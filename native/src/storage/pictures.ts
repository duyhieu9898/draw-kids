import * as FileSystem from 'expo-file-system/legacy'
import * as SQLite from 'expo-sqlite'
import { CATALOG_VERSION, PICTURES } from '../assets/catalog'
import type { Action } from '../domain/types'

export type SavedDrawing = {
  key: string
  actions: Action[]
  /** File URI of the 264×264 PNG, or a data URI for records saved before schema 2. */
  thumbnailUri: string | null
  updatedAt: number
}

type PictureRow = {
  key: string
  catalog_version: number
  actions: string
  thumbnail_base64: string | null
  thumbnail_path: string | null
  updated_at: number
}

let databasePromise: Promise<SQLite.SQLiteDatabase> | null = null

/** Bump together with a migration step in `openDatabase`. */
const SCHEMA_VERSION = 2

async function openDatabase(): Promise<SQLite.SQLiteDatabase> {
  const database = await SQLite.openDatabaseAsync('drawings.db')
  await database.execAsync('PRAGMA journal_mode = WAL;')

  const pragma = await database.getFirstAsync<{ user_version: number }>('PRAGMA user_version')
  const version = pragma?.user_version ?? 0
  if (version > SCHEMA_VERSION) {
    throw new Error(
      `drawings.db has schema ${version}, app only supports up to ${SCHEMA_VERSION}. Need a newer app version.`,
    )
  }

  // Migration ladder; version 0 is a fresh database or the pre-migration table
  // created by earlier builds, which already matches schema 1.
  if (version < 1) {
    await database.execAsync(`
      CREATE TABLE IF NOT EXISTS pictures (
        key TEXT PRIMARY KEY NOT NULL,
        catalog_version INTEGER NOT NULL,
        actions TEXT NOT NULL,
        thumbnail_base64 TEXT,
        updated_at INTEGER NOT NULL
      );
      PRAGMA user_version = 1;
    `)
  }

  // Version 2 moves thumbnails out of SQLite into app-private files; rows from
  // version 1 keep their base64 column and are read as data URIs.
  if (version < 2) {
    await database.execAsync(`
      ALTER TABLE pictures ADD COLUMN thumbnail_path TEXT;
      PRAGMA user_version = 2;
    `)
  }

  return database
}

function parseActions(raw: string): Action[] | null {
  try {
    const parsed: unknown = JSON.parse(raw)
    return Array.isArray(parsed) ? (parsed as Action[]) : null
  } catch {
    return null
  }
}

function getDatabase(): Promise<SQLite.SQLiteDatabase> {
  if (!databasePromise) databasePromise = openDatabase()
  return databasePromise
}

export async function loadSavedDrawing(key: string): Promise<SavedDrawing | null> {
  const database = await getDatabase()
  const row = await database.getFirstAsync<PictureRow>(
    'SELECT key, catalog_version, actions, thumbnail_base64, thumbnail_path, updated_at FROM pictures WHERE key = ?',
    key,
  )
  if (!row) return null
  // Actions are replayed against the current geometry; a catalog change can move
  // or drop regions, so a drawing from another catalog version is treated as
  // unsaved instead of being replayed onto the wrong picture. The row is kept so
  // a future import/upgrade path can migrate it.
  if (row.catalog_version !== CATALOG_VERSION) return null
  const actions = parseActions(row.actions)
  if (!actions) return null
  return {
    key: row.key,
    actions,
    thumbnailUri: await thumbUri(row),
    updatedAt: row.updated_at,
  }
}

/**
 * Schema 2 stored an absolute path, which breaks as soon as the app container
 * moves (reinstall, update, Expo Go session). New rows store only the file name
 * and are resolved here; both shapes are accepted, and a missing file falls back
 * to the outline instead of a broken image.
 */
async function thumbUri(row: PictureRow): Promise<string | null> {
  if (row.thumbnail_path) {
    const dir = thumbnailDir()
    const path = row.thumbnail_path.includes('/')
      ? row.thumbnail_path
      : dir && `${dir}${row.thumbnail_path}`
    if (path) {
      const info = await FileSystem.getInfoAsync(path).catch(() => null)
      if (info?.exists) return path
    }
  }
  return row.thumbnail_base64 ? `data:image/png;base64,${row.thumbnail_base64}` : null
}

export async function listSavedDrawings(): Promise<Record<string, SavedDrawing>> {
  const database = await getDatabase()
  const rows = await database.getAllAsync<PictureRow>(
    'SELECT key, catalog_version, actions, thumbnail_base64, thumbnail_path, updated_at FROM pictures',
  )
  const result: Record<string, SavedDrawing> = {}
  const currentKeys = new Set(PICTURES.map((picture) => picture.key))
  for (const row of rows) {
    if (row.catalog_version !== CATALOG_VERSION || !currentKeys.has(row.key)) continue
    const actions = parseActions(row.actions)
    if (!actions) continue
    result[row.key] = {
      key: row.key,
      actions,
      thumbnailUri: await thumbUri(row),
      updatedAt: row.updated_at,
    }
  }
  return result
}

const THUMBNAIL_DIR = 'thumbnails/'

function thumbnailDir(): string | null {
  return FileSystem.documentDirectory ? `${FileSystem.documentDirectory}${THUMBNAIL_DIR}` : null
}

/** Stable per-picture file name; also the value kept in `thumbnail_path`. */
function thumbnailName(key: string): string {
  return `${key.replace(/[^a-z0-9]+/gi, '-')}.png`
}

/**
 * Writes the PNG next to the database. Returns the file name (not an absolute
 * path) or null when the file system is unavailable, so the caller can fall back
 * to storing the base64 payload.
 */
async function writeThumbnail(key: string, base64: string): Promise<string | null> {
  const dir = thumbnailDir()
  if (!dir) return null
  try {
    await FileSystem.makeDirectoryAsync(dir, { intermediates: true })
    await FileSystem.writeAsStringAsync(`${dir}${thumbnailName(key)}`, base64, {
      encoding: FileSystem.EncodingType.Base64,
    })
    return thumbnailName(key)
  } catch {
    return null
  }
}

export async function saveDrawing(input: {
  key: string
  actions: Action[]
  thumbnailBase64: string | null
}): Promise<void> {
  const database = await getDatabase()
  const thumbnailPath = input.thumbnailBase64
    ? await writeThumbnail(input.key, input.thumbnailBase64)
    : null
  await database.runAsync(
    `INSERT OR REPLACE INTO pictures
       (key, catalog_version, actions, thumbnail_base64, thumbnail_path, updated_at)
     VALUES (?, ?, ?, ?, ?, ?)`,
    input.key,
    CATALOG_VERSION,
    JSON.stringify(input.actions),
    thumbnailPath ? null : input.thumbnailBase64,
    thumbnailPath,
    Date.now(),
  )
}

export async function deleteSavedDrawing(key: string): Promise<void> {
  const database = await getDatabase()
  await database.runAsync('DELETE FROM pictures WHERE key = ?', key)
  const dir = thumbnailDir()
  if (!dir) return
  await FileSystem.deleteAsync(`${dir}${thumbnailName(key)}`, { idempotent: true }).catch(
    () => undefined,
  )
}
