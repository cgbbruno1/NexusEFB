# Demo Branding Preview

## Objetivo da demo

Criar uma branch isolada de demonstracao comercial com branding visivel `NexusEFB`, preservando 100% do app Flutter original no comportamento funcional e alterando somente branding minimo e metadados do aplicativo.

## Decisao de Produto

A demo comercial deve usar o app Flutter original com branding `NexusEFB`.

A demo HTML foi descartada como caminho principal porque nao representa o software real.

A branch HTML `demo/html-commercial-preview` passa a existir apenas como alternativa emergencial arquivada e nao deve continuar evoluindo sem nova autorizacao.

## Escopo da Demo Flutter

### Alteracoes permitidas

- nome do app;
- launcher icon;
- splash existente, se houver;
- assets de branding;
- metadados Android, iOS e Web ligados ao branding.

### Alteracoes proibidas

- telas novas;
- navegacao nova;
- funcionalidades novas;
- UI fake;
- prototipo HTML como demo principal;
- regras de negocio;
- arquitetura modular;
- alteracoes em `lib/` que mudem comportamento funcional.

## Branch usada

- Branch: `demo/branding-preview`
- Commit base: `1439ab2f717aaa381d060f1b0bf803e0f0bdf7f5`
- Commit de branding visual usado como referencia funcional: `7c2afde9c2d5006d44a24c65885c1eed6148406d`
- Commits posteriores nesta branch foram usados apenas para documentacao.

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

## Validacao

### Branch

- Branch validada como demo oficial: `demo/branding-preview`
- Branch a nao continuar como demo principal: `demo/html-commercial-preview`

### Commit

- Referencia de branding funcional: `7c2afde9c2d5006d44a24c65885c1eed6148406d`
- A branch permaneceu restrita a branding e documentacao durante esta sessao.

### Resultado de diff contra `master`

Resumo equivalente ao pedido de `git diff master...demo/branding-preview`:

- `lib/`: nenhuma alteracao listada no diff da branch de branding.
- `android/`: apenas `AndroidManifest.xml`, `res/values/strings.xml` e `res/drawable/nexus_launcher_icon.xml`.
- `ios/`: apenas `ios/Runner/Info.plist`.
- `web/`: apenas `web/index.html` e `web/manifest.json`.
- `pubspec.yaml`: alterado somente para descricao, registro de `assets/branding/` e `msix_config.display_name`.
- `assets/branding/`: apenas placeholders de branding.
- `docs/` e `BACKLOG.md`: documentacao.

Conclusao do diff:

- `lib/` nao recebeu alteracao funcional nesta branch de branding.
- Nao foi encontrada tela nova, navegacao nova, layout funcional novo ou prototipo HTML dentro da branch `demo/branding-preview`.
- O escopo permaneceu restrito a branding, metadados e documentacao.

### Resultado de `flutter pub get`

- Nao executado nesta sessao.
- Motivo: ambiente local sem checkout executavel e Flutter local segue bloqueado.

### Resultado de `flutter analyze`

- Nao executado nesta sessao.
- Motivo: ambiente local sem checkout executavel e Flutter local segue bloqueado.

### Resultado de `flutter test`

- Nao executado nesta sessao.
- Motivo: ambiente local sem checkout executavel e Flutter local segue bloqueado.

### Resultado de `flutter build apk --debug`

- Nao executado nesta sessao.
- Motivo: ambiente local sem checkout executavel e Flutter local segue bloqueado.

### Caminho do APK

- Caminho esperado quando o build Android debug estiver funcional:
  - `build/app/outputs/flutter-apk/app-debug.apk`
- APK nao gerado nesta sessao.

### Pendencias

- validar build Android debug em ambiente limpo;
- instalar APK em Android real;
- confirmar nome exibido `NexusEFB` no dispositivo;
- confirmar icone placeholder ou logo oficial no dispositivo;
- atualizar AppIcon iOS com arquivos estaticos, se a demo iOS passar a ser prioridade.

## Evidencias de bloqueio de ambiente local

- `where.exe git`: Git nao encontrado no PATH na sessao anterior.
- `where.exe flutter`: encontrou `C:\src\flutter\bin\flutter` e `flutter.bat`.
- `where.exe dart`: encontrou `C:\src\flutter\bin\dart` e `dart.bat`.
- `flutter --version`: expirou por timeout.
- `dart --version`: expirou por timeout.

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
- A validacao da demo Flutter nao avancou para build por ausencia de ambiente limpo executavel nesta sessao.

## Conclusao

A branch `demo/branding-preview` permanece como o caminho correto para a demo comercial oficial. O app Flutter original foi preservado, sem alteracoes funcionais, e o escopo ficou limitado a branding minimo, metadados e documentacao.

## Status final

`BLOQUEADA`
