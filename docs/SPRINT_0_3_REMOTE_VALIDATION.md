# Sprint 0.3 - Remote Validation via GitHub Actions

Date: 2026-06-13

Repository: `cgbbruno1/NexusEFB`

Sprint: `SPRINT 0.3 - Fechamento da validacao remota via GitHub Actions`

## Scope

This sprint created and executed only CI and documentation.

No functional Flutter code was changed. No UI, branding, features, SQLite, REST API, ADS-B, NexusMX, Moving Map, or refactoring work was started.

## Reason for Remote Validation

Local validation remains blocked by Windows environment issues documented in Sprint 0, Sprint 0.1, and Sprint 0.2.

The local PC environment cannot be trusted for build validation yet because:

- DNS lookup for `github.com` times out.
- HTTPS access to `https://github.com` fails from the terminal.
- Global Git is missing from PATH.
- Flutter wrapper commands hang.
- Local Flutter is `3.24.3`, while the workflow uses Flutter `3.35.1`.
- Flutter Tools fails on `C:\src\flutter\bin\cache\lockfile`.
- Android SDK tools exist on disk but are not configured in PATH.
- The repository cannot be cloned locally.

Because of that, GitHub Actions was used as a temporary trusted remote environment to validate the fork baseline.

## Workflow Created

Created:

```text
.github/workflows/flutter-ci.yml
```

Workflow name:

```text
Flutter CI
```

Triggers:

- Push to `master` or `main`.
- Pull request targeting `master` or `main`.
- Manual `workflow_dispatch`.

Runner:

```text
ubuntu-latest
```

Java version:

```text
Temurin 17
```

Flutter version configured:

```text
3.35.1 stable
```

## Manual CI Execution

Workflow run:

```text
https://github.com/cgbbruno1/NexusEFB/actions/runs/27470320265
```

Job:

```text
flutter-ci
```

Job ID:

```text
81199949619
```

Trigger:

```text
workflow_dispatch
```

Branch:

```text
master
```

Actor:

```text
cgbbruno1
```

Final job conclusion:

```text
failure
```

## Commands Executed by CI

The workflow attempted the planned commands:

```bash
flutter --version
flutter pub get
flutter analyze
flutter test
flutter build apk --debug
```

## Result by Step

| Step | Result |
| --- | --- |
| Checkout repository | PASSOU |
| Set up Java | PASSOU |
| Set up Flutter | PASSOU |
| `flutter --version` | PASSOU |
| `flutter pub get` | PASSOU COM AVISOS |
| `flutter analyze` | FALHOU |
| `flutter test` | PULADO |
| `flutter build apk --debug` | PULADO |

## Version Output

```text
Flutter 3.35.1 - channel stable - https://github.com/flutter/flutter.git
Framework - revision 20f8274939 - 2025-08-14 10:53:09 -0700
Engine - hash 6cd51c08a88e7bbe848a762c20ad3ecb8b063c0e
Tools - Dart 3.9.0 - DevTools 2.48.0
```

Java resolved by GitHub Actions:

```text
Temurin 17.0.19+10
```

Runner:

```text
Ubuntu 24.04.4 LTS
```

## Dependency Resolution Result

`flutter pub get` completed successfully.

Relevant output:

```text
Resolving dependencies...
Downloading packages...
Changed 6 dependencies!
145 packages have newer versions incompatible with dependency constraints.
Try `flutter pub outdated` for more information.
```

This is not the blocking failure. It indicates dependency drift, but dependency resolution completed.

## Analyze Result

`flutter analyze` failed.

Analyzer summary:

```text
7 issues found. (ran in 28.6s)
Process completed with exit code 1.
```

Issues reported:

```text
warning - The value of the local variable 'binding' isn't used - integration_test/app_test.dart:19:9 - unused_local_variable
info - Don't use 'BuildContext's across async gaps - integration_test/screenshot_navlog_test.dart:38:14 - use_build_context_synchronously
info - Don't use 'BuildContext's across async gaps - integration_test/screenshot_test.dart:49:14 - use_build_context_synchronously
info - The import of 'dart:typed_data' is unnecessary because all of the used elements are also provided by the import of 'package:flutter/foundation.dart' - lib/io/adsb_capture.dart:3:8 - unnecessary_import
info - Unnecessary braces in a string interpolation - lib/io/adsb_capture.dart:189:26 - unnecessary_brace_in_string_interps
error - Target of URI doesn't exist: 'firebase_options.dart' - lib/main.dart:20:8 - uri_does_not_exist
error - Undefined name 'DefaultFirebaseOptions' - lib/main.dart:38:20 - undefined_identifier
```

## First Blocking Error

The first real blocking error is the missing Firebase options file referenced by `lib/main.dart`:

```text
lib/main.dart:20:8 - Target of URI doesn't exist: 'firebase_options.dart'
lib/main.dart:38:20 - Undefined name 'DefaultFirebaseOptions'
```

This prevents `flutter analyze` from passing.

Because `flutter analyze` failed, GitHub Actions skipped:

```text
flutter test
flutter build apk --debug
```

## Errors Found

- `lib/firebase_options.dart` is missing from the repository or not generated in CI.
- `DefaultFirebaseOptions` is referenced by `lib/main.dart`, but no definition is available.
- Analyzer also reports warnings and info-level issues, but they are not the first blocking error.

## Corrections Applied

No functional correction was applied in this sprint.

Only documentation was updated after the CI execution result was collected.

## Files Modified in This Sprint

- `.github/workflows/flutter-ci.yml`
- `docs/SPRINT_0_3_REMOTE_VALIDATION.md`
- `BACKLOG.md`

No Flutter application code was changed.

## Recommended Next Sprint

Because CI failed before tests and build, the recommended next sprint is:

```text
SPRINT 0.4 - Minimal Firebase baseline unblock
```

Objective:

- Investigate the missing `lib/firebase_options.dart` baseline.
- Confirm whether AvareX expects this file to be generated by FlutterFire CLI, committed with placeholder/project configuration, or handled through a CI secret/config generation step.
- Apply the smallest possible non-functional build unblock.
- Re-run `flutter analyze`, `flutter test`, and `flutter build apk --debug` in GitHub Actions.

## Final Status

**FALHOU**

GitHub Actions executed successfully as a remote validation environment, but the Flutter project baseline did not pass because `flutter analyze` failed on missing Firebase configuration source.
