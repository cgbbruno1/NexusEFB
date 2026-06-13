# Technical Baseline

Date: 2026-06-13

Repository: `cgbbruno1/NexusEFB`

Origin fork: `apps4av/avarex`

## Current Project Structure

The repository is a Flutter project with package name `avaremp` and app branding still aligned with AvareX. No NexusEFB branding changes have been made in Sprint 0.

The repository could not be cloned locally in this environment, so this baseline is based on the GitHub repository metadata and `pubspec.yaml` content read from the fork.

## Main Folders Identified

Expected Flutter project folders and files from the fork/upstream layout:

- `.github/` - GitHub Actions workflows.
- `android/` - Android project.
- `ios/` - iOS project.
- `web/` - Web target.
- `linux/` - Linux desktop target.
- `macos/` - macOS desktop target.
- `windows/` - Windows desktop target.
- `lib/` - Dart/Flutter application source.
- `assets/images/` - Image assets.
- `assets/docs/` - Document assets.
- `assets/audio/traffic_alerts/` - Traffic alert audio assets.
- `assets/audio/gpws/` - GPWS audio assets.
- `assets/audio/runway_incursion/` - Runway incursion audio assets.
- `integration_test/` - Integration tests.
- `pubspec.yaml` - Flutter package definition.
- `analysis_options.yaml` - Dart analyzer/lint configuration.

## Platforms Present

Based on repository metadata and `pubspec.yaml`/workflow inspection, the project targets:

- Android
- iOS
- Web
- Linux
- macOS
- Windows
- Raspberry Pi / Linux arm64 through workflow artifact builds

## Flutter and Dart Requirements

From `pubspec.yaml`:

```yaml
environment:
  sdk: '>=3.2.0 <4.0.0'
```

Upstream/fork workflows use Flutter stable `3.35.1` for the main platform builds.

Local environment discovered during Sprint 0:

- Flutter path: `C:\src\flutter\bin\flutter.bat`
- Flutter SDK version file: `3.24.3`
- Dart direct SDK: `3.5.3`
- Java: Temurin JDK `17.0.17`

## Main Dependencies

Main dependencies declared in `pubspec.yaml` include:

- `sqflite`
- `sqflite_common_ffi`
- `sqflite_common_ffi_web`
- `sqlite3_flutter_libs`
- `path`
- `path_provider`
- `geolocator`
- `wakelock_plus`
- `dio`
- `http`
- `archive`
- `flutter_map`
- `flutter_map_marker_cluster`
- `latlong2`
- `mbtiles`
- `vector_map_tiles`
- `vector_tile_renderer`
- `vector_tile`
- `cached_network_image`
- `flutter_cache_manager`
- `syncfusion_flutter_pdfviewer`
- `audioplayers`
- `flutter_bluetooth_serial_ble`
- `firebase_core`
- `firebase_auth`
- `firebase_ui_auth`
- `firebase_ai`
- `firebase_storage`
- `cloud_firestore`
- `purchases_flutter`
- `purchases_flutter_ui`
- `purchases_ui_flutter`
- `csv`
- `xml`
- `html`
- `image`
- `image_picker`
- `file_picker`
- `share_plus`
- `fl_chart`
- `toastification`
- `in_app_review`
- `scribble`
- `geojson_vi`
- `universal_io`

Git dependencies declared:

- `msvcredist` from `https://github.com/insertjokehere/flutter_msvcredist.git`, ref `main`.
- `msix` from `https://github.com/insertjokehere/msix.git`, ref `msvc_redist`.

Development dependencies:

- `flutter_test`
- `flutter_lints`
- `build_runner`
- `integration_test`

## Technical Observations

- The fork currently preserves AvareX package metadata: `name: avaremp`, `version: 0.0.106+106`.
- `msix_config` still uses AvareX identity values. This is expected for Sprint 0 and must not be changed yet.
- The project depends on Firebase and RevenueCat-related packages; local builds may require generated Firebase option files or placeholder configuration depending on target and feature flags.
- Android workflows run `flutterfire configure` in CI using repository secrets.
- Windows workflows build with `flutter build windows --release` and then run `dart run msix:create`.
- Android workflows build both APK and AAB.
- Linux/Snap workflows install native packages for GTK, GStreamer, WebKitGTK, CMake, Ninja, and related desktop dependencies.

## Environment Issues Found During Sprint 0

- `git` is missing from PATH.
- Terminal HTTPS access to GitHub failed with `Bad access`.
- Flutter wrapper hangs on `flutter --version`.
- Direct Flutter tool execution fails on `C:\src\flutter\bin\cache\lockfile`.
- Installed Flutter is `3.24.3`, older than the `3.35.1` version used by project workflows.
- Android SDK exists locally but Android environment variables and PATH entries are incomplete.
- Visual Studio Build Tools 2022 exists and works when loaded through `VsDevCmd.bat`; it is not available in a plain shell PATH.

## MVP NexusEFB Risk Points

These are only risk notes. No MVP implementation is part of Sprint 0.

- Build reproducibility must be solved before any branding or feature work.
- Git dependencies require working HTTPS access from the development machine.
- Firebase and RevenueCat initialization paths may affect local testability.
- Multi-platform plugin registrations can be fragile when dependencies are updated.
- Windows build requires the correct Visual Studio developer environment.
- Android build requires complete Android SDK PATH and license setup.
- Flutter version drift between local and CI can produce dependency resolution differences.

## Baseline Status

The codebase remains unmodified from the fork baseline except for Sprint 0 documentation files.

The technical baseline cannot be marked build-validated until the environment can clone the repository and execute:

```powershell
flutter pub get
flutter analyze
flutter test
flutter build apk --debug
```
