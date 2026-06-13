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

Objetivo: remover o primeiro bloqueador de baseline sem criar funcionalidades novas e sem alterar UI ou branding.

### Itens propostos

- [ ] Investigar ausencia de `lib/firebase_options.dart` no fork AvareX/NexusEFB.
- [ ] Confirmar se o AvareX original espera gerar esse arquivo via FlutterFire CLI, commit de arquivo local, secrets de CI ou configuracao externa.
- [ ] Definir a menor correcao possivel para permitir `flutter analyze` sem alterar comportamento funcional.
- [ ] Reexecutar GitHub Actions depois da correcao minima.
- [ ] Documentar resultado de `flutter analyze`, `flutter test` e `flutter build apk --debug`.

## Sprint 1 - Fundacao do App

Sem itens nesta tarefa. A Sprint 1 nao deve iniciar antes da Sprint 0 passar.

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
