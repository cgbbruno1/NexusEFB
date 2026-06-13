# Sprint 0.1 - Environment Fix

Date: 2026-06-13

Repository: `cgbbruno1/NexusEFB`

Sprint: `SPRINT 0.1 - Correcao do ambiente local`

## Scope

This sprint is environment-only.

No Flutter application code was modified. No UI, branding, features, Moving Map, SQLite, REST API, ADS-B, or NexusMX work was started.

## Operating System

```text
Microsoft Windows [versao 10.0.26200.8457]
Microsoft Windows NT 10.0.26200.0
64-bit: True
```

`Get-CimInstance Win32_OperatingSystem` was attempted but failed with access denied in this environment.

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

### Git installation search

Checked common locations:

```text
C:\Program Files\Git\bin\git.exe              missing
C:\Program Files\Git\cmd\git.exe              missing
C:\Program Files (x86)\Git\bin\git.exe        missing
C:\Program Files (x86)\Git\cmd\git.exe        missing
C:\src\flutter\bin\mingit\cmd\git.exe        exists
C:\src\flutter\bin\mingit\mingw64\bin\git.exe exists
```

Flutter's bundled MiniGit exists but is not a replacement for a normal Git for Windows installation.

MiniGit version:

```text
git version 2.15.1.windows.2.1.g603511c649
```

## GitHub Access

### git ls-remote

```powershell
git ls-remote https://github.com/cgbbruno1/NexusEFB.git
```

Result with global Git:

```text
git : O termo 'git' nao e reconhecido como nome de cmdlet, funcao, arquivo de script ou programa operavel.
```

Result using Flutter MiniGit with `GIT_EXEC_PATH` configured:

```text
fatal: unable to access 'https://github.com/cgbbruno1/NexusEFB.git/': Failed to connect to github.com port 443: Bad access
```

### DNS test

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

### HTTPS test

```powershell
curl.exe -I https://github.com
```

Result:

```text
curl: (7) Failed to connect to github.com port 443 after 98 ms: Could not connect to server
```

### Network assessment

The local terminal cannot resolve/connect to GitHub. Evidence points to a local network/DNS/proxy/firewall/antivirus restriction outside the repository itself.

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
Command produced no output and remained running until manually stopped.
```

### Installed Flutter version by file inspection

```powershell
Get-Content C:\src\flutter\version
```

Result:

```text
3.24.3
```

Expected/recommended for this project baseline:

```text
Flutter stable 3.35.1
```

The upstream AvareX workflows use Flutter `3.35.1`.

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
Command produced no output and remained running until manually stopped.
```

### Direct Dart SDK check

```powershell
C:\src\flutter\bin\cache\dart-sdk\bin\dart.exe --version
```

Result:

```text
Dart SDK version: 3.5.3 (stable) (Wed Sep 11 16:22:47 2024 +0000) on "windows_x64"
```

## Flutter doctor

### flutter doctor -v

The normal command could not complete because the Flutter wrapper hangs.

A direct Flutter Tools invocation was used to capture the underlying error:

```powershell
C:\src\flutter\bin\cache\dart-sdk\bin\dart.exe --disable-dart-dev --packages=C:\src\flutter\packages\flutter_tools\.dart_tool\package_config.json C:\src\flutter\bin\cache\flutter_tools.snapshot doctor -v
```

Result:

```text
Flutter failed to open a file at "C:\src\flutter\bin\cache\lockfile". The flutter tool cannot access the file or directory.
Please ensure that the SDK and/or project is installed in a location that has read/write permissions for the current user.

#0      throwToolExit (package:flutter_tools/src/base/common.dart:10:3)
#1      _throwFileSystemException (package:flutter_tools/src/base/error_handling_io.dart:844:3)
#2      _handleWindowsException (package:flutter_tools/src/base/error_handling_io.dart:834:3)
#3      _runSync (package:flutter_tools/src/base/error_handling_io.dart:608:7)
#4      ErrorHandlingFile.openSync (package:flutter_tools/src/base/error_handling_io.dart:306:12)
#5      Cache.lock (package:flutter_tools/src/cache.dart:327:24)
```

## Flutter SDK permissions

Checked:

```text
C:\src\flutter
C:\src\flutter\bin\cache\lockfile
```

The `lockfile` exists and is owned by `Adeline\Adeline Dias`. ACL shows Administrators and SYSTEM full control, Users read/execute, and Authenticated Users modify. Despite this, Flutter Tools cannot open the lock file from this session.

Recommended correction:

- Install Flutter stable `3.35.1` in a user-writable directory, for example `%USERPROFILE%\dev\flutter`.
- Put that Flutter `bin` path before `C:\src\flutter\bin` in PATH.
- Avoid relying on the current `C:\src\flutter` installation for this project.

## Android SDK

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

### PATH checks

```powershell
where.exe adb
where.exe sdkmanager
where.exe avdmanager
```

Result:

```text
INFORMACOES: nao foi possivel localizar arquivos para o(s) padrao(oes) especificado(s).
```

The Android SDK tools exist on disk but are not in PATH.

## Environment Variables Found

Important values in the current process:

```text
ANDROID_HOME      empty
ANDROID_SDK_ROOT  empty
JAVA_HOME         C:\Program Files\Eclipse Adoptium\jdk-17.0.17.10-hotspot\
PUB_CACHE         empty
PATH              includes C:\src\flutter\bin and JDK path, but not Git or Android SDK tool paths
```

## Problems Corrected

No persistent environment corrections were applied from this session.

Reason: the required fixes involve installing Git, fixing DNS/HTTPS access, replacing or moving the Flutter SDK outside the current restricted SDK path, and changing persistent Windows environment variables. These are machine-level changes and were documented instead of partially applying temporary session-only changes.

## Problems Still Pending

- Install Git for Windows and add it to PATH.
- Restore terminal DNS resolution for `github.com`.
- Restore terminal HTTPS access to `https://github.com`.
- Install/configure Flutter stable `3.35.1` in a user-writable path.
- Resolve Flutter lockfile failure at `C:\src\flutter\bin\cache\lockfile`.
- Configure `ANDROID_HOME` and `ANDROID_SDK_ROOT`.
- Add Android SDK `platform-tools`, `cmdline-tools/latest/bin`, and `emulator` to PATH.
- Re-run `flutter doctor -v` after Flutter works.
- Clone `https://github.com/cgbbruno1/NexusEFB.git`.
- Run `flutter pub get`.
- Run `flutter analyze`.
- Run `flutter test`.
- Run `flutter build apk --debug`.

## Project Commands

### Clone

```powershell
git clone https://github.com/cgbbruno1/NexusEFB.git work\NexusEFB_sprint0_1
```

Result:

```text
git : O termo 'git' nao e reconhecido como nome de cmdlet, funcao, arquivo de script ou programa operavel.
```

### flutter pub get

Result:

```text
NexusEFB_sprint0_1 nao foi clonado; flutter pub get nao pode ser executado.
```

### flutter analyze

Result:

```text
NexusEFB_sprint0_1 nao foi clonado; flutter analyze nao pode ser executado.
```

### flutter test

Result:

```text
NexusEFB_sprint0_1 nao foi clonado; flutter test nao pode ser executado.
```

### flutter build apk --debug

Result:

```text
NexusEFB_sprint0_1 nao foi clonado; flutter build apk --debug nao pode ser executado.
```

## Recommended Fix Commands

Run these in a normal Windows terminal after installing Git for Windows and restoring internet/DNS access:

```powershell
where git
git --version
git ls-remote https://github.com/cgbbruno1/NexusEFB.git
```

Configure Android SDK variables:

```powershell
setx ANDROID_HOME "%LOCALAPPDATA%\Android\Sdk"
setx ANDROID_SDK_ROOT "%LOCALAPPDATA%\Android\Sdk"
```

Add these to the user PATH:

```text
%LOCALAPPDATA%\Android\Sdk\platform-tools
%LOCALAPPDATA%\Android\Sdk\cmdline-tools\latest\bin
%LOCALAPPDATA%\Android\Sdk\emulator
```

Install Flutter stable `3.35.1` in a user-writable directory and ensure its `bin` appears before `C:\src\flutter\bin` in PATH.

Then validate:

```powershell
flutter --version
dart --version
flutter doctor -v
adb version
sdkmanager --version
```

Then run project validation:

```powershell
git clone https://github.com/cgbbruno1/NexusEFB.git work\NexusEFB_sprint0_1
cd work\NexusEFB_sprint0_1
flutter pub get
flutter analyze
flutter test
flutter build apk --debug
```

## Final Status

**FALHOU**

The environment still prevents clone/build. No functional app files were modified.
