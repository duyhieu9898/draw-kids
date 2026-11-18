export type Bounds = [number, number, number, number]

export type ToolType = 'marker' | 'pencil' | 'fill' | 'eraser'

export type FillAction = {
  type: 'fill'
  regionId: number
  color: string
}

export type StrokeAction = {
  type: 'stroke' | 'erase'
  regionId: number
  color: string
  points: [number, number][]
  width: number
  tool: Exclude<ToolType, 'fill'>
}

export type Action = FillAction | StrokeAction
