# Demo Branding Preview

## Objetivo da demo

Criar uma branch isolada de demonstracao comercial com branding visivel `NexusEFB`, sem alterar funcionalidades, regras de negocio, arquitetura modular, navegacao ou telas funcionais do app.

## Branch usada

- Branch: `demo/branding-preview`
- Commit base: `1439ab2f717aaa381d060f1b0bf803e0f0bdf7f5`
- Commit de referencia antes do fechamento desta documentacao: `e07f25e9bd8c46550e67de8cf4f8fcea04dd348e`
- Commit final: `7c2afde9c2d5006d44a24c65885c1eed6148406d`

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

## Comandos executados na sprint anterior

- `where.exe git`
- `where.exe flutter`
- `where.exe dart`
- tentativa controlada de `flutter --version` com timeout de 15 segundos
- tentativa controlada de `dart --version` com timeout de 15 segundos

## Resultado da validacao local anterior

### `flutter pub get`

- Nao executado na sprint anterior.
- Motivo: nao havia checkout local utilizavel do repositorio dentro do workspace e o ambiente Flutter local nao respondia corretamente.

### `flutter analyze`

- Nao executado na sprint anterior.
- Motivo: dependia de checkout local e de Flutter funcional.

### `flutter test`

- Nao executado na sprint anterior.
- Motivo: dependia de checkout local e de Flutter funcional.

### `flutter build apk --debug`

- Nao executado na sprint anterior.
- Motivo: dependia de checkout local e de Flutter funcional.

## Evidencias de bloqueio de ambiente anterior

- `where.exe git`: Git nao encontrado no PATH na sessao anterior.
- `where.exe flutter`: encontrou `C:\src\flutter\bin\flutter` e `flutter.bat`.
- `where.exe dart`: encontrou `C:\src\flutter\bin\dart` e `dart.bat`.
- `flutter --version`: expirou por timeout.
- `dart --version`: expirou por timeout.

## Validacao da Demo Build

### Ambiente usado

- Sessao remota via GitHub e workspace restrito do Codex.
- Nenhum ambiente limpo executavel esteve disponivel nesta sessao para abrir Codespaces, WSL limpo, outro PC ou maquina cloud.

### Branch validada

- Branch alvo: `demo/branding-preview`
- Commit alvo: `7c2afde9c2d5006d44a24c65885c1eed6148406d`
- A branch permanece a frente de `master` e nao houve alteracao funcional nesta sprint.

### Confirmacao de branch / commit

- O commit esperado do prompt foi confirmado como referencia da branch.
- Nao foi possivel executar `git status`, `git branch --show-current` ou `git rev-parse HEAD` em um checkout limpo nesta sessao.
- Nao foi encontrado workflow run associado ao commit `7c2afde9c2d5006d44a24c65885c1eed6148406d` no GitHub Actions durante esta verificacao.

### `flutter --version`

- Nao executado em ambiente limpo nesta sessao.
- Sem resultado real disponivel.

### `dart --version`

- Nao executado em ambiente limpo nesta sessao.
- Sem resultado real disponivel.

### `flutter doctor -v`

- Nao executado em ambiente limpo nesta sessao.
- Sem resultado real disponivel.

### `flutter pub get`

- Nao executado em ambiente limpo nesta sessao.
- Bloqueado por ausencia de ambiente Flutter limpo acessivel.

### `flutter analyze`

- Nao executado em ambiente limpo nesta sessao.
- Bloqueado por ausencia de ambiente Flutter limpo acessivel.

### `flutter test`

- Nao executado em ambiente limpo nesta sessao.
- Bloqueado por ausencia de ambiente Flutter limpo acessivel.

### `flutter build apk --debug`

- Nao executado em ambiente limpo nesta sessao.
- Bloqueado por ausencia de ambiente Flutter limpo acessivel.

### Caminho do APK

- Caminho esperado quando o build Android debug estiver funcional:
  - `build/app/outputs/flutter-apk/app-debug.apk`
- APK nao gerado nesta sprint.

### Resultado da instalacao Android

- Nao validado.
- Sem APK gerado nesta sprint, nao houve instalacao em dispositivo Android.

### Screenshots

- Nao capturadas.
- Motivo: sem emulador, sem dispositivo e sem build executado em ambiente limpo.

### Lista final de arquivos alterados nesta branch de demo

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

### Status final

`BLOQUEADA`

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
- A validacao DEMO 0.2 nao avancou para build por ausencia de ambiente limpo executavel nesta sessao.

## Conclusao

A branch `demo/branding-preview` recebeu apenas mudancas de branding visivel e metadados. O trabalho segue pronto para demonstracao de nome e identidade placeholder no codigo, mas a validacao por build e instalacao Android continua pendente por falta de ambiente limpo executavel nesta sessao.

## Status final

`BLOQUEADA`
