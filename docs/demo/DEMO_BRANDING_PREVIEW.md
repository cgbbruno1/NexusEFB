# Demo Branding Preview

## Objetivo da demo

Criar uma branch isolada de demonstracao comercial com branding visivel `NexusEFB`, sem alterar funcionalidades, regras de negocio, arquitetura modular, navegacao ou telas funcionais do app.

## Branch usada

- Branch: `demo/branding-preview`
- Commit base: `1439ab2f717aaa381d060f1b0bf803e0f0bdf7f5`
- Commit de referencia antes do fechamento desta documentacao: `e07f25e9bd8c46550e67de8cf4f8fcea04dd348e`
- Commit final: HEAD atual da branch `demo/branding-preview` apos este arquivo

## Arquivos alterados

- `android/app/src/main/AndroidManifest.xml`
- `android/app/src/main/res/drawable/nexus_launcher_icon.xml`
- `android/app/src/main/res/values/strings.xml`
- `assets/branding/nexus_efb_logo_placeholder.svg`
- `assets/branding/nexus_efb_logo_dark.svg`
- `ios/Runner/Info.plist`
- `web/index.html`
- `web/manifest.json`
- `pubspec.yaml`
- `BACKLOG.md`
- `docs/demo/DEMO_BRANDING_PREVIEW.md`

## O que foi alterado

- Nome exibido do app alterado para `NexusEFB` em Android, iOS e Web.
- `android:label` passou a usar `@string/app_name`.
- `strings.xml` foi criado com `app_name = NexusEFB`.
- Launcher icon Android foi trocado para um drawable placeholder de demo (`nexus_launcher_icon.xml`).
- Assets de branding placeholder foram criados em `assets/branding/`.
- `web/index.html` e `web/manifest.json` foram atualizados para `NexusEFB` e para o asset SVG de demo.
- `pubspec.yaml` recebeu o registro de `assets/branding/` e `msix_config.display_name` foi ajustado para `NexusEFB`.

## Splash / branding de inicializacao

- O fork atual nao possui splash customizada com asset proprio em Android.
- Os arquivos `launch_background.xml` existentes continuam na estrutura padrao do Flutter.
- Nenhum sistema novo de splash foi criado nesta sprint.

## O que NAO foi alterado

- Funcionalidades
- Regras de negocio
- Arquitetura modular
- Modulos
- Moving Map
- Aircraft CRUD
- Logbook
- Navegacao
- Telas funcionais
- Firebase funcional

## Comandos executados nesta sessao

- `where.exe git`
- `where.exe flutter`
- `where.exe dart`
- tentativa controlada de `flutter --version` com timeout de 15 segundos
- tentativa controlada de `dart --version` com timeout de 15 segundos

## Resultado da validacao local

### `flutter pub get`

- Nao executado nesta sessao.
- Motivo: nao ha checkout local utilizavel do repositorio dentro deste workspace e o ambiente Flutter local continua sem responder corretamente.

### `flutter analyze`

- Nao executado nesta sessao.
- Motivo: dependia de checkout local e de Flutter funcional.

### `flutter test`

- Nao executado nesta sessao.
- Motivo: dependia de checkout local e de Flutter funcional.

### `flutter build apk --debug`

- Nao executado nesta sessao.
- Motivo: dependia de checkout local e de Flutter funcional.

## Evidencias de bloqueio de ambiente

- `where.exe git`: Git nao encontrado no PATH nesta sessao.
- `where.exe flutter`: encontrou `C:\src\flutter\bin\flutter` e `flutter.bat`.
- `where.exe dart`: encontrou `C:\src\flutter\bin\dart` e `dart.bat`.
- `flutter --version`: expirou por timeout.
- `dart --version`: expirou por timeout.

## APK

- Caminho esperado quando o build Android debug estiver funcional:
  - `build/app/outputs/flutter-apk/app-debug.apk`
- APK nao gerado nesta sessao.

## Instrucoes de instalacao Android

1. Gerar ou obter o arquivo `build/app/outputs/flutter-apk/app-debug.apk` em ambiente Flutter funcional.
2. Transferir o APK para o dispositivo Android.
3. Permitir instalacao de apps desconhecidos para o app usado na transferencia.
4. Abrir o APK.
5. Instalar.
6. Confirmar:
   - nome exibido: `NexusEFB`;
   - icone exibido: branding de demo NexusEFB;
   - app abre sem crash.

## Screenshots

- Nao capturadas.
- Motivo: sem emulador ou dispositivo validado nesta sessao e sem build local utilizavel.

## Limitacoes conhecidas

- Nenhum build debug foi validado localmente nesta sprint.
- O launcher icon iOS nao foi regenerado por pipeline de assets nesta sessao.
- O `flutter_launcher_icons` do projeto nao foi reexecutado, porque o foco foi evitar mudancas funcionais e o Flutter local continua bloqueado.
- O branding aplicado aqui e um placeholder de demo, nao a identidade visual final de producao.

## Conclusao

A branch `demo/branding-preview` recebeu apenas mudancas de branding visivel e metadados. O trabalho ficou pronto para demonstracao de nome e identidade placeholder no codigo, mas a validacao por build continua bloqueada por ambiente local sem Git e com Flutter/Dart travando por timeout.

## Status final

`BLOQUEADA`
