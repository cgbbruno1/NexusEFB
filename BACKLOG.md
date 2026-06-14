# Backlog

## Sprint 0

Objetivo: validar o estado inicial do fork AvareX e garantir que o projeto compile sem alteracoes funcionais.

### Problemas encontrados

- [ ] Instalar Git for Windows ou adicionar `git.exe` ao PATH.
  - Evidencia: `where git` nao encontrou executavel.
  - Evidencia: `git --version` falhou com comando nao reconhecido.

- [ ] Corrigir acesso HTTPS do terminal ao GitHub.
  - Evidencia: clone de `https://github.com/cgbbruno1/NexusEFB.git` falhou com `Failed to connect to github.com port 443: Bad access`.

- [ ] Instalar ou configurar Flutter stable `3.35.1`.
  - Evidencia: `C:\src\flutter\version` indica `3.24.3`.
  - Risco: workflows oficiais usam Flutter stable `3.35.1`.

- [ ] Corrigir permissao/local do Flutter SDK.
  - Evidencia: Flutter falhou ao abrir `C:\src\flutter\bin\cache\lockfile`.
  - Recomendacao: instalar Flutter em diretorio gravavel do usuario ou corrigir permissoes de `C:\src\flutter`.

- [ ] Corrigir `flutter --version` e `flutter doctor -v`.
  - Evidencia: `flutter --version` travou sem saida e precisou ser encerrado.
  - Evidencia: execucao direta do Flutter Tools falhou em `Cache.lock`.

- [ ] Configurar Android SDK no ambiente.
  - Evidencia: Android SDK existe em `%LOCALAPPDATA%\Android\Sdk`.
  - Evidencia: `ANDROID_HOME` e `ANDROID_SDK_ROOT` nao estao configurados.
  - Evidencia: `adb`, `sdkmanager` e `avdmanager` nao estao no PATH.

- [ ] Validar Android SDK command-line tools.
  - Evidencia: `sdkmanager --version` retornou `12.0`, mas exibiu warnings sobre SDK XML version e `package.xml`.

- [ ] Executar `flutter pub get` no checkout local.
  - Bloqueado porque o repositorio nao foi clonado localmente.

- [ ] Executar `flutter analyze` no checkout local.
  - Bloqueado porque o repositorio nao foi clonado localmente.

- [ ] Executar `flutter test` no checkout local.
  - Bloqueado porque o repositorio nao foi clonado localmente.

- [ ] Executar `flutter build apk --debug` no checkout local.
  - Bloqueado porque o repositorio nao foi clonado localmente.

- [ ] Confirmar app original AvareX abrindo localmente sem modificacoes.
  - Bloqueado ate clone, Flutter e Android toolchain funcionarem.

## Sprint 0.1 - Correcao do ambiente local

Objetivo: preparar o PC para clonar, rodar Flutter e validar o build do fork AvareX/NexusEFB.

### Problemas encontrados

- [ ] Instalar Git for Windows.
  - `where git` nao encontrou Git global.
  - `git --version` falhou com comando nao reconhecido.
  - O MiniGit embutido no Flutter existe, mas nao substitui uma instalacao normal de Git for Windows.

- [ ] Corrigir DNS local para GitHub.
  - `nslookup github.com` falhou por timeout.
  - Servidor DNS retornado: `fe80::1`.

- [ ] Corrigir acesso HTTPS ao GitHub.
  - `curl.exe -I https://github.com` falhou com `Could not connect to server`.
  - MiniGit com `GIT_EXEC_PATH` configurado falhou com `Failed to connect to github.com port 443: Bad access`.

- [ ] Instalar/configurar Flutter stable `3.35.1`.
  - Flutter local identificado por `C:\src\flutter\version` como `3.24.3`.
  - Dart interno identificado como `3.5.3`.

- [ ] Resolver travamento de `flutter --version` e `dart --version`.
  - Ambos os wrappers ficaram sem saida e precisaram ser encerrados.

- [ ] Resolver erro de lockfile do Flutter.
  - Execucao direta do Flutter Tools falhou em `C:\src\flutter\bin\cache\lockfile`.
  - Recomendacao: instalar Flutter em diretorio gravavel do usuario e priorizar esse caminho no PATH.

- [ ] Configurar variaveis Android.
  - `ANDROID_HOME` vazio.
  - `ANDROID_SDK_ROOT` vazio.
  - `JAVA_HOME` configurado para JDK 17 Temurin.

- [ ] Adicionar Android SDK ao PATH.
  - `adb`, `sdkmanager` e `avdmanager` nao estao no PATH.
  - Ferramentas existem em `%LOCALAPPDATA%\Android\Sdk`.

- [ ] Validar `sdkmanager` apos ajuste.
  - `sdkmanager --version` retorna `12.0`, mas com warnings de XML/package parsing.

- [ ] Reexecutar `flutter doctor -v` depois que Flutter funcionar.
  - Doctor normal nao conclui enquanto Flutter falhar no lockfile.

- [ ] Clonar `https://github.com/cgbbruno1/NexusEFB.git` em `work\NexusEFB_sprint0_1`.
  - Bloqueado por Git ausente e rede GitHub indisponivel.

- [ ] Executar `flutter pub get`.
  - Bloqueado porque o checkout local nao existe.

- [ ] Executar `flutter analyze`.
  - Bloqueado porque o checkout local nao existe.

- [ ] Executar `flutter test`.
  - Bloqueado porque o checkout local nao existe.

- [ ] Executar `flutter build apk --debug`.
  - Bloqueado porque o checkout local nao existe.

## Sprint 0.2 - Recuperacao manual do ambiente Windows

Objetivo: desbloquear o ambiente local para permitir clone, Flutter doctor e build Android debug.

### Problemas encontrados

- [ ] Alterar DNS do Windows manualmente para `1.1.1.1` e `8.8.8.8`.
  - `ipconfig /flushdns` executou com sucesso.
  - `nslookup github.com` continua falhando por timeout.

- [ ] Restaurar acesso HTTPS ao GitHub.
  - `curl.exe -I https://github.com` falhou com `Could not connect to server`.

- [ ] Instalar Git oficial pelo navegador.
  - Git global ainda nao existe.
  - `where git` e `git --version` falham.

- [ ] Reinstalar Flutter stable limpo em `C:\src\flutter`.
  - A instalacao atual ainda e `3.24.3`.
  - `flutter --version` segue travando.

- [ ] Resolver manualmente o lockfile do Flutter.
  - `flutter doctor -v` e `flutter doctor --android-licenses` seguem travando.
  - Nao foi apagado `C:\src\flutter\bin\cache\lockfile` nesta sessao restrita.

- [ ] Configurar Android SDK no PATH.
  - `adb`, `sdkmanager` e `avdmanager` funcionam por caminho absoluto.
  - `where adb`, `where sdkmanager` e `where avdmanager` ainda nao encontram as ferramentas.

- [ ] Validar Android licenses.
  - Bloqueado porque `flutter doctor --android-licenses` trava com o Flutter atual.

- [ ] Clonar em `C:\work\NexusEFB`.
  - Bloqueado porque Git global ainda nao esta instalado/no PATH.

- [ ] Executar `flutter pub get`, `flutter analyze`, `flutter test` e `flutter build apk --debug`.
  - Bloqueado porque o repositorio ainda nao foi clonado e Flutter ainda nao executa corretamente.

## Sprint 0.3 - Validacao remota via GitHub Actions

Objetivo: validar o projeto Flutter em ambiente remoto enquanto o PC local permanece bloqueado.

### Itens

- [x] Criar workflow remoto Flutter CI em `.github/workflows/flutter-ci.yml`.
  - Usa `actions/checkout@v4`.
  - Usa Java Temurin 17.
  - Usa Flutter stable `3.35.1`.

- [x] Executar manualmente o workflow `Flutter CI` no branch `master`.
  - Run: `https://github.com/cgbbruno1/NexusEFB/actions/runs/27470320265`.
  - Job: `flutter-ci`.
  - Resultado final: `failure`.

- [x] Confirmar que o ambiente remoto instalou Flutter e resolveu dependencias.
  - `flutter --version`: passou com Flutter `3.35.1` e Dart `3.9.0`.
  - `flutter pub get`: passou com avisos de dependencias desatualizadas/incompativeis com constraints.

- [x] Registrar resultado final do GitHub Actions em `docs/SPRINT_0_3_REMOTE_VALIDATION.md`.

- [x] Identificar primeiro bloqueador real.
  - `flutter analyze` falhou porque `lib/main.dart` importa `firebase_options.dart`, mas `lib/firebase_options.dart` nao existe no repositorio.
  - `DefaultFirebaseOptions` fica indefinido.

- [ ] Executar `flutter test` no CI.
  - Pulado porque `flutter analyze` falhou.

- [ ] Executar `flutter build apk --debug` no CI.
  - Pulado porque `flutter analyze` falhou.

- [ ] Corrigir somente build blockers minimos se aprovado em sprint propria.
  - Nenhuma correcao funcional foi feita na Sprint 0.3.

## Sprint 0.4 - Minimal Firebase baseline unblock

Objetivo: remover o bloqueador de Firebase sem alterar comportamento funcional do app.

### Itens

- [x] Inspecionar `lib/main.dart`, `pubspec.yaml`, `.gitignore`, `docs/SPRINT_0_3_REMOTE_VALIDATION.md` e `BACKLOG.md`.

- [x] Criar `lib/firebase_options.dart` com baseline minima no formato esperado pelo FlutterFire.
  - Arquivo criado no commit `18aa9732c5deae50ea60b19a05d44bff2c674a8f`.
  - Sem chaves reais de producao.
  - Apenas placeholders para destravar analyze/build baseline.

- [x] Confirmar que o erro de ausencia de `firebase_options.dart` deixou de acontecer.
  - `flutter analyze` nao reporta mais `uri_does_not_exist` para `firebase_options.dart`.
  - `DefaultFirebaseOptions` deixou de ficar indefinido.

- [x] Reexecutar CI remoto apos a correcao.
  - Run: `https://github.com/cgbbruno1/NexusEFB/actions/runs/27470526551`.
  - Job: `flutter-ci`.

- [x] Documentar o resultado em `docs/SPRINT_0_4_FIREBASE_BASELINE.md`.

- [ ] Concluir pipeline completo ate `flutter test` e `flutter build apk --debug`.
  - Bloqueado pelo proximo problema do `flutter analyze`.

### Status final

- Resultado da Sprint 0.4: `FALHOU`.
- O bloqueador de Firebase foi removido.
- O proximo bloqueador agora e `integration_test/app_test.dart:19:9 - unused_local_variable`.

## Sprint 0.5 - Analyzer baseline cleanup

Objetivo: corrigir o proximo bloqueador minimo do `flutter analyze` sem alterar funcionalidades.

### Resultado

- [x] Corrigir `integration_test/app_test.dart:19:9 - unused_local_variable`.
  - Correcao aplicada no commit `0978ee2bed72f5137183e5e8c7c34a8fbbf48922`.
  - A chamada `IntegrationTestWidgetsFlutterBinding.ensureInitialized()` foi preservada.
  - Nenhuma regra do analyzer foi desabilitada.

- [x] Reexecutar `flutter analyze` no CI apos a correcao minima.
  - Workflow: `https://github.com/cgbbruno1/NexusEFB/actions/runs/27471523907`.
  - Job: `flutter-ci`.
  - Resultado final: `failure`.

- [x] Confirmar que o bloqueador da Sprint 0.5 desapareceu do CI.
  - O erro `unused_local_variable` nao aparece mais no `flutter analyze`.

- [ ] Concluir pipeline completo ate `flutter test` e `flutter build apk --debug`.
  - Ainda bloqueado pelo proximo conjunto minimo de findings do analyzer.

### Proximo bloqueador documentado

- [x] Corrigir `integration_test/screenshot_navlog_test.dart:38:14 - use_build_context_synchronously`.
  - Corrigido na Sprint 0.6.
- [x] Corrigir `integration_test/screenshot_test.dart:49:14 - use_build_context_synchronously`.
  - Corrigido na Sprint 0.6.
- [x] Corrigir `lib/io/adsb_capture.dart:3:8 - unnecessary_import`.
  - Corrigido na Sprint 0.6.
- [x] Corrigir `lib/io/adsb_capture.dart:189:26 - unnecessary_brace_in_string_interps`.
  - Corrigido na Sprint 0.6.

### Status final

- Resultado da Sprint 0.5: `FALHOU`.
- O bloqueador solicitado foi removido.
- O proximo passo recomendado e uma Sprint 0.6 focada apenas nos quatro findings restantes do `flutter analyze`.

## Sprint 0.6 - Analyzer info cleanup

Objetivo: corrigir apenas os quatro findings restantes do `flutter analyze` sem alterar funcionalidades.

### Resultado

- [x] Corrigir `integration_test/screenshot_navlog_test.dart:38:14 - use_build_context_synchronously`.
  - Inserido `if (!ctx.mounted)` antes do uso do contexto apos a lacuna assincrona.

- [x] Corrigir `integration_test/screenshot_test.dart:49:14 - use_build_context_synchronously`.
  - Inserido `if (!ctx.mounted)` antes do uso do contexto apos a lacuna assincrona.

- [x] Corrigir `lib/io/adsb_capture.dart:3:8 - unnecessary_import`.
  - Removido apenas `import 'dart:typed_data';`.

- [x] Corrigir `lib/io/adsb_capture.dart:189:26 - unnecessary_brace_in_string_interps`.
  - Alterado `${_bytesSeenSinceLog}` para `$_bytesSeenSinceLog` sem mudar o texto gerado.

- [ ] Validar `flutter pub get`, `flutter analyze`, `flutter test` e `flutter build apk --debug` no GitHub Actions.
  - Workflow: `https://github.com/cgbbruno1/NexusEFB/actions/runs/27475368880`.
  - Job: `flutter-ci` (`81213539749`).
  - Bloqueado porque o job permaneceu `queued` e nao iniciou a execucao.

### Status final

- Resultado da Sprint 0.6: `FALHOU`.
- Os quatro findings solicitados foram corrigidos no codigo.
- A validacao remota nao concluiu porque o GitHub Actions nao saiu de `queued`.

### Proximo bloqueador documentado

- [x] Desbloquear a execucao do workflow `Flutter CI` no GitHub Actions.
  - Investigado na Sprint 0.7.

## Sprint 0.7 - CI Queue Recovery

Objetivo: destravar a validacao remota do GitHub Actions apos o `Flutter CI` ficar preso em `queued`.

### Resultado

- [x] Confirmar que o run original da Sprint 0.6 continuava travado.
  - Run `27475368880` / job `81213539749` permaneceu em `queued` por cerca de 45 minutos.

- [x] Cancelar o run travado original.
  - O run `27475368880` foi cancelado manualmente pela interface do GitHub.

- [x] Executar novo `Flutter CI` manualmente no branch `master`.
  - Novo run: `27476406835`.
  - Job: `81216402677` (`flutter-ci`).
  - Resultado observado: ainda `queued`.

- [x] Verificar configuracoes do repositrio em `Settings > Actions > General`.
  - `Allow all actions and reusable workflows` estava habilitado.
  - Actions nao estava desabilitado no nivel do repositorio.
  - Permissao padrao do workflow permanecia valida para execucao.

- [x] Verificar `Settings > Actions > Runners`.
  - Nao ha runners self-hosted configurados.
  - O problema nao decorre de um label privado de runner local.

- [x] Confirmar que havia outros workflows presos em fila.
  - Foram observados runs `queued` tambem para `Android`, `IOS`, `Windows`, `Arm64-Linux` e `Snap-Linux`.

- [x] Criar workflow minimo de teste para isolar infraestrutura.
  - Arquivo criado: `.github/workflows/ci-smoke-test.yml`.
  - Commit: `1ded76241b1b42887b26b32de19c00f5b762d4a2`.

- [x] Executar manualmente o `CI Smoke Test`.
  - Run: `27477157844`.
  - Job: `81218447500` (`smoke-test`).
  - Resultado observado: ainda `queued`.

### Status final

- Resultado da Sprint 0.7: `FALHOU`.
- O problema de fila/permissao/infraestrutura do GitHub Actions foi confirmado.
- O bloqueio nao esta no `flutter-ci.yml`, porque o smoke test minimo tambem nao iniciou.

### Proximo bloqueador documentado

- [ ] Verificar limite, billing, quota, concurrency ou restricao de Actions no nivel da conta proprietaria do repositorio.
  - Com o smoke test minimo tambem em `queued`, o proximo gargalo esta fora do codigo Flutter e fora do workflow Flutter em si.

## Sprint 1.0 - Modular App Foundation

Objetivo: criar a fundacao arquitetural minima, modular e nao intrusiva para o NexusEFB sem iniciar funcionalidades do MVP e sem alterar o comportamento atual do app.

### Itens concluidos

- [x] Inspecionar `pubspec.yaml`, `lib/main.dart`, `lib/firebase_options.dart`, `analysis_options.yaml`, `lib/`, `tests/`, `integration_test/`, `.github/workflows/flutter-ci.yml`, `BACKLOG.md`, `docs/TECHNICAL_BASELINE.md` e `docs/SPRINT_0_7_CI_QUEUE_RECOVERY.md`.

- [x] Criar baseline modular em `lib/core/` e `lib/features/`.
  - `lib/core/database/app_database.dart`
  - `lib/core/errors/app_exception.dart`
  - `lib/core/providers/database_provider.dart`
  - `lib/features/aircraft/...`
  - `lib/features/logbook/...`
  - `lib/features/flight_plan/...`
  - `lib/features/weather/...`
  - `lib/features/offline_charts/...`
  - `lib/features/moving_map/...`

- [x] Adicionar Riverpod como dependencia minima de fundacao.
  - `flutter_riverpod` foi adicionado ao `pubspec.yaml`.
  - `sqflite` e `path` ja existiam no projeto.

- [x] Criar baseline minima de SQLite.
  - Banco `nexus_efb.db`
  - Versao `1`
  - Tabelas tecnicas: `aircraft`, `logbook_entries`

- [x] Criar modelos de dominio minimos.
  - `Aircraft`
  - `LogbookEntry`

- [x] Criar contratos de repositorio.
  - `AircraftRepository`
  - `LogbookRepository`

- [x] Criar providers Riverpod minimos sem tocar na UI.
  - `appDatabaseProvider`
  - `aircraftRepositoryProvider`
  - `logbookRepositoryProvider`

- [x] Criar testes unitarios minimos para modelos de dominio.
  - `test/features/aircraft/domain/aircraft_test.dart`
  - `test/features/logbook/domain/logbook_entry_test.dart`

- [x] Atualizar documentacao.
  - `docs/SPRINT_1_0_MODULAR_APP_FOUNDATION.md`
  - `docs/TECHNICAL_BASELINE.md`
  - `BACKLOG.md`

### Itens pendentes

- [ ] Executar `flutter pub get` em ambiente valido.
- [ ] Executar `flutter analyze` em ambiente valido.
- [ ] Executar `flutter test` em ambiente valido.
- [ ] Executar `flutter build apk --debug` em ambiente valido ou documentar a primeira falha real do build.
- [ ] Atualizar `pubspec.lock` apos `flutter pub get` real.
- [ ] Decidir a primeira sprint de implementacao concreta sobre `aircraft` ou `logbook` depois que o ambiente voltar a validar.

### Status final

- Resultado da Sprint 1.0: `FALHOU`.
- A fundacao modular foi criada no repositorio.
- A validacao obrigatoria nao foi concluida por bloqueio de ambiente.

### Proximo bloqueador documentado

- [ ] Recuperar um ambiente executavel para validacao Flutter.
  - No Codex local, `flutter --version` continuou travando antes de `pub get` e `analyze`.
  - No GitHub Actions, o bloqueio anterior de jobs presos em `queued` ainda impede confiar na validacao remota.

## Sprint 2 - SQLite Offline First

Sem itens nesta tarefa.

## Sprint 3 - Cadastro de Aeronaves

Sem itens nesta tarefa.

## Sprint 4 - Logbook Basico

Sem itens nesta tarefa.

## Sprint 5 - Cartas Offline

Sem itens nesta tarefa.

## Sprint 6 - Plano de Voo

Sem itens nesta tarefa.

## Sprint 7 - METAR/TAF/NOTAM

Sem itens nesta tarefa.

## Sprint 8 - Moving Map

Sem itens nesta tarefa.

## Sprint 1.1 - Validation Recovery

Objetivo: recuperar uma forma confiavel de validar o projeto depois da Sprint 1.0, sem criar funcionalidades novas e sem alterar comportamento do app.

### Itens concluidos

- [x] Confirmar o estado do Flutter local.
  - `where flutter` e `where dart` resolvem para `C:\src\flutter\bin`.
  - `flutter --version` e `dart --version` travam sem retorno util.

- [x] Identificar o primeiro erro local real.
  - Execucao direta do Flutter tools falha com `Flutter failed to open a file at "C:\src\flutter\bin\cache\lockfile"`.
  - O problema esta no ambiente local, nao no codigo do app.

- [x] Confirmar que o Dart embutido ainda responde.
  - `C:\src\flutter\bin\cache\dart-sdk\bin\dart.exe --version` retornou Dart `3.5.3`.
  - Isso indica que o executavel do Dart existe, mas os wrappers locais nao estao confiaveis.

- [x] Verificar o estado atual do GitHub Actions.
  - A pagina geral de Actions ainda mostra varios runs `queued` para `Flutter CI`, `Android`, `IOS`, `Windows`, `Arm64-Linux` e `Snap-Linux`.
  - O `Flutter CI #53` (`27501348750`) continuava `queued` no momento da inspecao.

- [x] Confirmar que GitHub Actions nao esta totalmente indisponivel.
  - `CI Smoke Test #1` (`27477157844`) apareceu como `completed successfully`.
  - Isso mostra que ha execucao remota possivel, embora a fila continue instavel.

- [x] Recuperar um resultado remoto real do `Flutter CI`.
  - Run inspecionado: `27501066717`.
  - Job: `81283916972`.
  - `flutter pub get`: passou.
  - `flutter analyze`: passou com `No issues found!`.
  - `flutter test`: falhou com `Test directory "test" not found.`.

### Itens pendentes

- [ ] Validar o `master` atual do repositorio em um run novo e completo do `Flutter CI`.
  - Os runs mais novos continuam em `queued`, entao o estado atual do `master` ainda nao esta validado ponta a ponta.

- [ ] Executar `flutter build apk --debug` em um ambiente confiavel.
  - Nem o ambiente local nem o `Flutter CI` mais recente chegaram a esse passo.

- [ ] Escolher um ambiente alternativo unico para validacao confiavel.
  - Recomendacao atual: GitHub Codespaces antes de insistir no Flutter local quebrado.

### Status final

- Resultado da Sprint 1.1: `BLOQUEADA`.
- Houve recuperacao parcial da validacao remota.
- O bloqueio principal continua sendo a instalacao local do Flutter e a fila irregular dos workflows mais novos.

### Proximo bloqueador documentado

- [ ] Validar o `master` atual em ambiente limpo ou em um unico run remoto concluido.
  - Se esse run falhar por codigo, corrigir apenas o primeiro erro real.
  - Se continuar falhando por ambiente, mover a validacao para GitHub Codespaces ou outro ambiente limpo.