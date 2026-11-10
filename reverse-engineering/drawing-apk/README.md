# Static analysis: `drawing.apk`

Analyzed with REA 6.8.0 / JADX headless 0.7.1. The APK was read statically and was not installed or executed.

## Identity and size

- Package: `com.uptodown`
- App/version from manifest: Uptodown 7.44 (version code 744)
- Minimum SDK: 23; target SDK: 36
- APK size: 15,790,385 bytes
- APK SHA-256: `8f8a7b2416d84d64d418dc4e194cd8ab6f4394d51651bf2e1aac47207503fd92`
- JADX loaded 14,237 classes and 2,230 resources.

This `drawing.apk` is an Uptodown app APK, so it does not appear to be the Draw Kids application built in this workspace.

## First code read

`com.uptodown.activities.MainActivity` has 81 methods and 40 fields. JADX decompiled its `onCreate(Bundle)` method; see [MainActivity.onCreate.java](MainActivity.onCreate.java). The entry point selects a TV activity when running in the app's TV mode; otherwise it initializes the main layout, splash/wizard flow, search and Turbo controls, and handles incoming APK links. Many app identifiers are obfuscated, so these names and the decompiled control flow should be treated as static evidence, not a complete behavioral explanation.

## Signature observations

REA detected v1, v2 and v3 signing blocks. The APK's embedded signer certificate reports subject `CN=Uptodown Technologies SL`; the SHA-256 certificate fingerprint is `822b9ca12b534ebcf426632221d951bfc60eb08f9f0cf2839c321b0685c2e8a4`. The v2/v3 declared APK digests match the APK bytes. This confirms self-consistency of the inspected signature material, not the real-world identity or trustworthiness of the publisher.

## Evidence files

- [Package and manifest evidence](package-evidence.json)
- [MainActivity class evidence](main-activity-class-evidence.json)
- [APK signature evidence](signature-evidence.json)
- Decompiled method: [MainActivity.onCreate.java](MainActivity.onCreate.java)
