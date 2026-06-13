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

## Sprint 0.1 — Correcao do ambiente local

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

## Sprint 1 — Fundacao do App

Sem itens nesta tarefa. A Sprint 1 nao deve iniciar antes da Sprint 0 passar.

## Sprint 2 — SQLite Offline First

Sem itens nesta tarefa.

## Sprint 3 — Cadastro de Aeronaves

Sem itens nesta tarefa.

## Sprint 4 — Logbook Basico

Sem itens nesta tarefa.

## Sprint 5 — Cartas Offline

Sem itens nesta tarefa.

## Sprint 6 — Plano de Voo

Sem itens nesta tarefa.

## Sprint 7 — METAR/TAF/NOTAM

Sem itens nesta tarefa.

## Sprint 8 — Moving Map

Sem itens nesta tarefa.
