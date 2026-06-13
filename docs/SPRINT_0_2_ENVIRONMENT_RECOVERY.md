# Sprint 0.2 - Windows Environment Recovery

Date: 2026-06-13

Repository: `cgbbruno1/NexusEFB`

Sprint: `SPRINT 0.2 - Recuperacao manual do ambiente Windows`

## Scope

This sprint is only about Windows local environment recovery.

No Flutter app code was modified. No UI, branding, features, SQLite, REST API, ADS-B, NexusMX, or Moving Map work was started.

## Initial Diagnosis

Sprint 0.2 started from the known blocked state:

- Global Git is not installed or not in PATH.
- Terminal DNS lookup for `github.com` times out.
- Terminal HTTPS access to GitHub fails.
- Flutter wrapper commands hang.
- Local Flutter installation at `C:\src\flutter` is version `3.24.3`, while the project should be validated with Flutter stable `3.35.1`.
- Flutter Tools fails on `C:\src\flutter\bin\cache\lockfile`.
- Android SDK exists but is not fully exposed through environment variables/PATH.

## DNS Configuration

Requested DNS targets for manual Windows recovery:

```text
1.1.1.1
8.8.8.8
```

Persistent Windows DNS settings were not changed from this restricted session. This must be done manually in Windows network adapter settings or an elevated PowerShell session.

### ipconfig /flushdns

```powershell
ipconfig /flushdns
```

Result:

```text
Configuracao de IP do Windows
Liberacao do Cache do DNS Resolver bem-sucedida.
```

## nslookup github.com

```powershell
nslookup github.com
```

Result:

```text
DNS request timed out.
timeout was 2 seconds.
Servidor:  UnKnown
Address:  fe80::1
DNS request timed out.
```

Status: failed.

## curl -I https://github.com

```powershell
curl.exe -I https://github.com
```

Result:

```text
curl: (7) Failed to connect to github.com port 443 after 78 ms: Could not connect to server
```

Status: failed.

## Git

### where git

```powershell
where.exe git
```

Result:

```text
INFORMACOES: nao foi possivel localizar arquivos para o(s) padrao(oes) especificado(s).
```

### git --version

```powershell
git --version
```

Result:

```text
git : O termo 'git' nao e reconhecido como nome de cmdlet, funcao, arquivo de script ou programa operavel.
```

Status: failed.

### Git installed search

Checked:

```text
C:\Program Files\Git\bin\git.exe              missing
C:\Program Files\Git\cmd\git.exe              missing
C:\Program Files (x86)\Git\bin\git.exe        missing
C:\Program Files (x86)\Git\cmd\git.exe        missing
C:\src\flutter\bin\mingit\cmd\git.exe        exists
C:\src\flutter\bin\mingit\mingw64\bin\git.exe exists
```

Flutter MiniGit exists but is not sufficient as the official Git installation for this development environment.

MiniGit version:

```text
git version 2.15.1.windows.2.1.g603511c649
```

MiniGit with HTTPS still failed:

```text
fatal: unable to access 'https://github.com/cgbbruno1/NexusEFB.git/': Failed to connect to github.com port 443: Bad access
```

## Flutter

### where flutter

```powershell
where.exe flutter
```

Result:

```text
C:\src\flutter\bin\flutter
C:\src\flutter\bin\flutter.bat
```

### flutter --version

```powershell
flutter --version
```

Result:

```text
C:\src\flutter\bin\flutter
C:\src\flutter\bin\flutter.bat
```

Then the command produced no further output and remained running until manually stopped.

### Installed Flutter version by file inspection

```powershell
Get-Content C:\src\flutter\version
```

Result:

```text
3.24.3
```

Required target for local recovery:

```text
Flutter stable 3.35.1
```

Status: failed. Current Flutter installation is old and still hangs.

## Dart

### where dart

```powershell
where.exe dart
```

Result:

```text
C:\src\flutter\bin\dart
C:\src\flutter\bin\dart.bat
```

### dart --version

```powershell
dart --version
```

Result:

```text
C:\src\flutter\bin\dart
C:\src\flutter\bin\dart.bat
```

Then the command produced no further output and remained running until manually stopped.

### Direct Dart SDK version

```powershell
C:\src\flutter\bin\cache\dart-sdk\bin\dart.exe --version
```

Result:

```text
Dart SDK version: 3.5.3 (stable) (Wed Sep 11 16:22:47 2024 +0000) on "windows_x64"
```

## Flutter lockfile

The known lockfile failure remains:

```text
Flutter failed to open a file at "C:\src\flutter\bin\cache\lockfile".
```

Manual recovery requested:

1. Close VS Code, Android Studio and terminals.
2. Open terminal as Administrator.
3. Delete only:

```text
C:\src\flutter\bin\cache\lockfile
```

This deletion was not performed from this restricted session.

Recommended stronger fix:

- Rename old Flutter installation manually to:

```text
C:\src\flutter_broken_backup
```

- Install a fresh Flutter stable SDK at:

```text
C:\src\flutter
```

- Ensure `C:\src\flutter\bin` is in PATH.

## Android SDK

Expected Android SDK path found from prior diagnostics:

```text
C:\Users\Adeline Dias\AppData\Local\Android\Sdk
```

### adb version

```powershell
C:\Users\Adeline Dias\AppData\Local\Android\Sdk\platform-tools\adb.exe version
```

Result:

```text
Android Debug Bridge version 1.0.41
Version 36.0.2-14143358
Installed as C:\Users\Adeline Dias\AppData\Local\Android\Sdk\platform-tools\adb.exe
Running on Windows 10.0.26200
```

### sdkmanager --version

```powershell
C:\Users\Adeline Dias\AppData\Local\Android\Sdk\cmdline-tools\latest\bin\sdkmanager.bat --version
```

Result:

```text
Warning: This version only understands SDK XML versions up to 3 but an SDK XML file of version 4 was encountered.
Warning: package.xml parsing problem. elemento inesperado "abis" / "translatedAbis".
12.0
```

### avdmanager --help

```powershell
C:\Users\Adeline Dias\AppData\Local\Android\Sdk\cmdline-tools\latest\bin\avdmanager.bat --help
```

Result: command responded and printed valid actions including `list`, `create avd`, `move avd`, and `delete avd`.

### PATH check

```powershell
where.exe adb
where.exe sdkmanager
where.exe avdmanager
```

Result:

```text
INFORMACOES: nao foi possivel localizar arquivos para o(s) padrao(oes) especificado(s).
```

Android tools exist on disk but are not configured in PATH.

## Environment Variables

Known state from Sprint 0.1 remains applicable:

```text
ANDROID_HOME      empty
ANDROID_SDK_ROOT  empty
JAVA_HOME         C:\Program Files\Eclipse Adoptium\jdk-17.0.17.10-hotspot\
PATH              includes C:\src\flutter\bin and JDK path, but not Git or Android SDK tool paths
```

Required manual environment setup:

```powershell
setx ANDROID_HOME "%LOCALAPPDATA%\Android\Sdk"
setx ANDROID_SDK_ROOT "%LOCALAPPDATA%\Android\Sdk"
```

Add to user PATH:

```text
%ANDROID_HOME%\platform-tools
%ANDROID_HOME%\cmdline-tools\latest\bin
%ANDROID_HOME%\emulator
```

## flutter doctor -v

```powershell
flutter doctor -v
```

Result: command produced no output and remained running until manually stopped.

Status: failed.

## flutter doctor --android-licenses

```powershell
flutter doctor --android-licenses
```

Result: command produced no output and remained running until manually stopped.

Status: failed because Flutter itself still hangs.

## git clone

```powershell
git clone https://github.com/cgbbruno1/NexusEFB.git C:\work\NexusEFB
```

Result:

```text
git : O termo 'git' nao e reconhecido como nome de cmdlet, funcao, arquivo de script ou programa operavel.
```

Status: failed.

## flutter pub get

Not executed because the repository was not cloned.

Status:

```text
Blocked by missing Git and GitHub network access.
```

## flutter analyze

Not executed because the repository was not cloned.

Status:

```text
Blocked by missing Git and GitHub network access.
```

## flutter test

Not executed because the repository was not cloned.

Status:

```text
Blocked by missing Git and GitHub network access.
```

## flutter build apk --debug

Not executed because the repository was not cloned.

Status:

```text
Blocked by missing Git and GitHub network access.
```

## Problems Corrected

- DNS resolver cache was flushed successfully with `ipconfig /flushdns`.
- Android SDK tools were verified by absolute path:
  - `adb.exe` works.
  - `sdkmanager.bat` responds with version `12.0`.
  - `avdmanager.bat --help` responds.

No persistent DNS, Git, Flutter, or PATH changes were applied from this restricted session.

## Problems Pending

- Change Windows DNS manually to `1.1.1.1` and `8.8.8.8`.
- Restore DNS resolution for `github.com`.
- Restore HTTPS access to `https://github.com`.
- Install official Git for Windows and add it to PATH.
- Reinstall Flutter stable `3.35.1` cleanly.
- Stop using the broken `C:\src\flutter` install until repaired/replaced.
- Resolve Flutter lockfile failure.
- Configure `ANDROID_HOME` and `ANDROID_SDK_ROOT`.
- Add Android SDK tools to PATH.
- Run `flutter doctor -v` successfully.
- Run `flutter doctor --android-licenses` successfully.
- Clone `cgbbruno1/NexusEFB` locally.
- Execute `flutter pub get`, `flutter analyze`, `flutter test`, and `flutter build apk --debug`.

## Final Status

**FALHOU**

The environment is still blocked before clone/build. No functional application files were modified.
