# Sprint 0.3 - Remote Validation via GitHub Actions

Date: 2026-06-13

Repository: `cgbbruno1/NexusEFB`

Sprint: `SPRINT 0.3 - Validacao remota via GitHub Actions`

## Scope

This sprint creates only CI and documentation.

No functional Flutter code was changed. No UI, branding, features, SQLite, REST API, ADS-B, NexusMX, Moving Map, or refactoring work was started.

## Reason for Remote Validation

Local validation remains blocked by Windows environment issues documented in Sprint 0, Sprint 0.1, and Sprint 0.2.

The PC local environment currently cannot be trusted for build validation because:

- DNS lookup for `github.com` times out.
- HTTPS access to `https://github.com` fails.
- Global Git is missing from PATH.
- Flutter wrapper commands hang.
- Local Flutter is `3.24.3`, while AvareX workflows use Flutter `3.35.1`.
- Flutter Tools fails on `C:\src\flutter\bin\cache\lockfile`.
- Android SDK tools exist on disk but are not configured in PATH.
- The repository cannot be cloned locally.

Because of that, GitHub Actions is being used as a temporary trusted remote environment to validate the fork baseline.

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

Flutter version:

```text
3.35.1 stable
```

Java version:

```text
Temurin 17
```

## Commands Executed by CI

The workflow runs:

```bash
flutter --version
flutter pub get
flutter analyze
flutter test
flutter build apk --debug
```

## Expected Validation Coverage

The CI is intended to validate:

- repository checkout;
- Flutter stable `3.35.1` installation;
- dependency resolution;
- Dart analyzer;
- test suite;
- Android debug APK build.

## CI Result

Status at document creation: **PENDING / NOT YET RECORDED**

The workflow file was created in the repository. A push to `master` should trigger GitHub Actions automatically. If Actions is disabled for the fork, it must be enabled manually in the GitHub repository UI.

After the workflow runs, update this section with:

- workflow run URL;
- final conclusion;
- failing step, if any;
- exact error output;
- whether `flutter build apk --debug` passed.

## Errors Found So Far

No CI execution result has been recorded yet.

Known local blockers remain:

- Git not available globally.
- GitHub DNS/HTTPS blocked locally.
- Flutter local install broken/old.
- Android SDK not configured in local PATH.

## Next Steps

1. Open the repository Actions tab:

```text
https://github.com/cgbbruno1/NexusEFB/actions
```

2. Open or run `Flutter CI`.
3. Capture the run result.
4. Update this document with the CI result.
5. If CI fails, fix only minimal build blockers in a later sprint and document every change.

## Final Status

**PENDING REMOTE CI RESULT**

The workflow was added, but this document has not yet been updated with the final GitHub Actions run result.
