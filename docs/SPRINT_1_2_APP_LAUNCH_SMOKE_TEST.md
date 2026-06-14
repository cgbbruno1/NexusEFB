# Sprint 1.2 - App Launch Smoke Test

Date: 2026-06-14

Repository: `cgbbruno1/NexusEFB`

## Objective

Try to see the current app running by validating whether it can compile, produce a debug APK, and open without an immediate crash.

This sprint was limited to technical validation only. No new functionality was implemented.

## Environment Used

- Execution environment: local Codex desktop session on Windows
- Operating system family: Windows
- Local workspace note: the current Codex workspace is not a usable local checkout of `NexusEFB`
- Local toolchain note: `git` is not available in PATH and Flutter wrappers still hang locally

## Repository State Confirmation

Commands requested:

- `git status`
- `git branch --show-current`
- `git rev-parse HEAD`

### Local result

All three commands failed immediately because `git` is not available in the local terminal.

Representative error:

```text
git : O termo 'git' nao e reconhecido como nome de cmdlet, funcao, arquivo de script ou programa operavel.
```

### Branch and commit tested

Because local Git is unavailable, the repository state could not be read from a local checkout.

Target branch intended for this smoke test:

```text
master
```

Latest branch/commit observed remotely during inspection of the GitHub Actions page:

```text
branch: master
commit: e1d62a65c5f1f19eea1e298ea4378a6de9d2efb5
```

### Modified files locally

Could not be determined through `git status` because Git is not installed or not available in PATH.

## Flutter Environment Check

Commands requested:

- `flutter --version`
- `dart --version`
- `flutter doctor -v`

### `flutter --version`

Result:

- command produced no output and remained hanging;
- no usable version string was returned from the wrapper.

### `dart --version`

Result:

- command produced no output and remained hanging;
- no usable version string was returned from the wrapper.

### `flutter doctor -v`

Result:

- command produced no output and remained hanging;
- doctor did not complete.

## First Real Local Error

Although the wrapper commands hung again, the root problem had already been confirmed in Sprint 1.1 by direct Flutter tools invocation:

```text
Flutter failed to open a file at "C:\src\flutter\bin\cache\lockfile".
The flutter tool cannot access the file or directory.
```

This remains the first real local environment blocker.

## Dependency Download

Requested command:

- `flutter pub get`

Result:

- not executed in this sprint;
- per sprint rule, execution stopped after Flutter itself proved non-usable in the local environment.

## Basic Validation

Requested commands:

- `flutter analyze`
- `flutter test`

Result:

- not executed in this sprint;
- blocked by the same local Flutter startup problem.

## APK Debug Build

Requested command:

- `flutter build apk --debug`

Result:

- not executed in this sprint;
- blocked by the same local Flutter startup problem.

### APK generated

```text
No
```

### APK path

```text
build/app/outputs/flutter-apk/app-debug.apk
```

This path was not produced locally because the build never started.

## App Launch Attempt

Requested follow-up commands would have been:

- `flutter devices`
- `flutter run`

Result:

- not executed;
- there was no valid local Flutter session capable of reaching device detection or app launch.

### Did the app open?

```text
No
```

### Initial screen observed

No screen was observed because the app did not launch.

### Crash observations

No runtime crash could be observed because the app never reached execution.

### Specific runtime checks not reached

The sprint did not reach runtime validation for:

- Firebase startup behavior
- permission prompts
- assets loading
- database startup
- black screen detection

## Conclusion

The Sprint 1.2 smoke test could not advance to build or launch.

The blocker is still environmental, not functional application code:

- `git` is unavailable locally;
- `flutter --version`, `dart --version` and `flutter doctor -v` still hang;
- the previously confirmed Flutter cache `lockfile` access problem remains the first real local error;
- without a usable Flutter process, `pub get`, `analyze`, `test`, `build apk --debug` and `flutter run` could not be attempted safely in this local environment.

## Final Status

`BLOQUEADA`

## Next Recommended Blocker

Use one clean validation path instead of continuing on the broken local environment:

1. GitHub Codespaces
2. clean secondary Windows machine
3. clean WSL environment
4. repaired local Flutter installation with working Git and PATH

Only after that should the real app launch smoke test be retried.