# Technical Baseline

Date: 2026-06-14

Repository: `cgbbruno1/NexusEFB`

Origin fork: `apps4av/avarex`

## Current Project Structure

The repository is a Flutter project with package name `avaremp` and app branding still aligned with AvareX. No NexusEFB branding changes have been made in Sprint 0 or Sprint 1.0.

The current codebase still uses the legacy AvareX folder structure for active app behavior, while a new modular baseline has now been added in parallel for future NexusEFB work.

## Main Folders Identified

Top-level repository folders currently identified:

- `.github/` - GitHub Actions workflows.
- `android/` - Android project.
- `assets/` - Images, documents and audio assets.
- `docs/` - Sprint and baseline documentation.
- `integration_test/` - Flutter integration tests.
- `ios/` - iOS project.
- `lib/` - Dart and Flutter application source.
- `linux/` - Linux desktop target.
- `macos/` - macOS desktop target.
- `snap/` - Snap packaging.
- `tests/` - Legacy binary and Python-based test assets.
- `web/` - Web target.
- `windows/` - Windows desktop target.

## Platforms Present

Based on repository metadata and workflow inspection, the project targets:

- Android
- iOS
- Web
- Linux
- macOS
- Windows
- Raspberry Pi / Linux arm64 through workflow builds

## Flutter and Dart Requirements

From `pubspec.yaml`:

```yaml
environment:
  sdk: '>=3.2.0 <4.0.0'
```

The repository workflow uses Flutter stable `3.35.1` in `flutter-ci.yml`.

Local Codex environment observations during Sprint 1.0:

- `where flutter` resolves to `C:\src\flutter\bin\flutter.bat`
- `flutter --version` still hangs in the local environment
- no usable local checkout of the repository is available inside the Codex sandbox

## Main Dependencies

Main dependencies declared in `pubspec.yaml` now include:

- `flutter_riverpod`
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

- `msvcredist` from `https://github.com/insertjokehere/flutter_msvcredist.git`
- `msix` from `https://github.com/insertjokehere/msix.git`

Development dependencies declared:

- `flutter_test`
- `flutter_lints`
- `build_runner`
- `integration_test`

## Technical Observations

- The fork still preserves AvareX package metadata: `name: avaremp`, `version: 0.0.106+106`.
- `msix_config` still uses AvareX identity values.
- `lib/main.dart` remains wired to the legacy app structure and routes.
- Firebase options remain a temporary baseline file created in Sprint 0.4.
- Riverpod was added only as modular infrastructure support in Sprint 1.0.
- No new screens, routes or feature wiring were added in Sprint 1.0.

## Modular Architecture Baseline

Sprint 1.0 added a non-invasive modular baseline alongside the existing legacy structure.

### New core structure

```text
lib/core/
  database/
  errors/
  providers/
```

Implemented files:

- `lib/core/database/app_database.dart`
- `lib/core/errors/app_exception.dart`
- `lib/core/providers/database_provider.dart`

### New feature structure

```text
lib/features/
  aircraft/
    data/
    domain/
    presentation/
  logbook/
    data/
    domain/
    presentation/
  flight_plan/
    data/
    domain/
    presentation/
  weather/
    data/
    domain/
    presentation/
  offline_charts/
    data/
    domain/
    presentation/
  moving_map/
    data/
    domain/
    presentation/
```

Concrete Sprint 1.0 files were limited to infrastructure and domain baseline:

- `Aircraft` model
- `LogbookEntry` model
- `AircraftRepository` contract
- `LogbookRepository` contract
- placeholder Riverpod providers for repository wiring
- `.gitkeep` placeholders for empty directories

### Database baseline

A minimal SQLite baseline was introduced with:

- database name: `nexus_efb.db`
- version: `1`
- baseline tables: `aircraft`, `logbook_entries`

This is infrastructure only. No CRUD, sync, UI or MVP workflow was implemented.

### Test baseline

A new `test/` tree was added for Dart unit tests, while legacy `tests/` remains untouched.

Added tests:

- `test/features/aircraft/domain/aircraft_test.dart`
- `test/features/logbook/domain/logbook_entry_test.dart`

## MVP NexusEFB Risk Points

These remain baseline risk notes only.

- Build reproducibility is still unresolved in the Codex local environment.
- GitHub Actions remote validation remains blocked by queued runners at repository/account level.
- `pubspec.lock` could not be refreshed after adding Riverpod because `flutter pub get` could not be executed in a usable environment.
- The project now contains both legacy and modular structures, which is intentional, but future sprints need discipline on where new code lives.
- Firebase and RevenueCat initialization paths may continue to complicate local validation.

## Baseline Status

The repository now contains a modular architecture baseline in addition to the original fork structure.

However, this baseline is not yet build-validated because the current environment still cannot reliably execute:

```text
flutter pub get
flutter analyze
flutter test
flutter build apk --debug
```

The first real blocker for Sprint 1.0 validation remains the local Codex Flutter environment hanging before usable execution, while remote GitHub Actions remains blocked by queued jobs.