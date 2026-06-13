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
