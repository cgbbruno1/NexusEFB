# Sprint 0 - Build Validation

Date: 2026-06-13

Repository: `cgbbruno1/NexusEFB`

Sprint: `SPRINT 0 - Validacao tecnica do fork AvareX`

## Scope

This validation does not add features, change runtime behavior, rename the app, change UI, create `nexus-branding`, add ADS-B, add NexusMX, add SQLite integration, or create any API.

Only build-environment validation was attempted.

## Flutter / Dart Version

### Command

```powershell
flutter --version
```

### Result

Failed. The command produced no output and remained running until manually stopped.

Additional direct inspection found:

```text
C:\src\flutter\version = 3.24.3
C:\src\flutter\bin\cache\dart-sdk\bin\dart.exe --version = Dart SDK 3.5.3
```

The upstream AvareX workflows use Flutter stable `3.35.1`. The fork should be validated with Flutter `3.35.1` to match CI.

## flutter pub get

### Command

```powershell
flutter pub get
```

### Result

Not executed against the project checkout because the repository could not be cloned locally in this environment.

Recorded command guard output:

```text
NexusEFB_sprint0 nao foi clonado; flutter pub get nao pode ser executado.
```

## flutter analyze

### Command

```powershell
flutter analyze
```

### Result

Not executed against the project checkout because the repository could not be cloned locally in this environment.

Recorded command guard output:

```text
NexusEFB_sprint0 nao foi clonado; flutter analyze nao pode ser executado.
```

## flutter test

### Command

```powershell
flutter test
```

### Result

Not executed against the project checkout because the repository could not be cloned locally in this environment.

Recorded command guard output:

```text
NexusEFB_sprint0 nao foi clonado; flutter test nao pode ser executado.
```

## flutter build apk --debug

### Command

```powershell
flutter build apk --debug
```

### Result

Not executed against the project checkout because the repository could not be cloned locally in this environment.

Recorded command guard output:

```text
NexusEFB_sprint0 nao foi clonado; flutter build apk --debug nao pode ser executado.
```

## Clone Attempt

### Command

```powershell
git clone https://github.com/cgbbruno1/NexusEFB.git work\NexusEFB_sprint0
```

### Result

Failed because global `git` is not available in PATH.

A second attempt using Flutter's bundled MiniGit with `GIT_EXEC_PATH` configured reached HTTPS but failed on network access:

```text
fatal: unable to access 'https://github.com/cgbbruno1/NexusEFB.git/': Failed to connect to github.com port 443: Bad access
```

## Errors Found

- Global `git` is not installed or not available in PATH.
- Terminal HTTPS access to GitHub is blocked in this environment.
- Flutter wrapper hangs before producing `flutter --version` output.
- Direct Flutter tool execution fails while opening `C:\src\flutter\bin\cache\lockfile`.
- Local Flutter SDK is `3.24.3`, while the project should be validated with Flutter stable `3.35.1`.
- Android SDK tools exist on disk, but `ANDROID_HOME`, `ANDROID_SDK_ROOT`, `adb`, `sdkmanager`, and `avdmanager` are not configured in PATH for the current shell.

## Minimal Fixes Applied

No project code fixes were applied.

No functional files were changed.

Documentation-only files were added to record the baseline validation status.

## Files Modified

- `docs/SPRINT_0_BUILD_VALIDATION.md`
- `docs/TECHNICAL_BASELINE.md`
- `BACKLOG.md`

## Final Status

**FALHOU**

The project source remains unmodified, but Sprint 0 build validation could not complete because the local development environment cannot clone the repository and the installed Flutter SDK cannot run correctly in this session.
