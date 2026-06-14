# Sprint 1.0 - Modular App Foundation

Date: 2026-06-14

Repository: `cgbbruno1/NexusEFB`

Sprint: `SPRINT 1.0 - Modular App Foundation`

## Objetivo da sprint

Criar uma fundacao arquitetural minima, modular e compilavel para o NexusEFB sem iniciar funcionalidades do MVP, sem alterar UI existente e sem modificar o comportamento funcional atual do app legado baseado em AvareX.

## Estado inicial encontrado

### Repositorio

- O package continua `avaremp`.
- `lib/main.dart` permanece com bootstrap legado baseado em `Storage`, `Firebase`, `RevenueCat` e rotas existentes.
- `lib/firebase_options.dart` existe apenas como baseline temporaria para CI.
- `analysis_options.yaml` continua com `flutter_lints` padrao, sem regras extras desabilitadas.
- O workflow `.github/workflows/flutter-ci.yml` ainda existe e tenta rodar `flutter pub get`, `flutter analyze`, `flutter test` e `flutter build apk --debug`.

### Estrutura atual de `lib/`

Antes desta sprint, o codigo Flutter principal estava concentrado em uma estrutura legada, com pastas como:

- `lib/ai`
- `lib/aircraft`
- `lib/chart`
- `lib/checklist`
- `lib/community`
- `lib/data`
- `lib/destination`
- `lib/gdl90`
- `lib/instruments`
- `lib/io`
- `lib/logbook`
- `lib/nmea`
- `lib/place`
- `lib/plan`
- `lib/services`
- `lib/utils`
- `lib/weather`
- `lib/widgets`
- `lib/wnb`

Nao existiam ainda `lib/core/` e `lib/features/` como baseline modular paralela.

### Estrutura atual de `tests/`

O repositorio possui `tests/` legada com arquivos de fixture e scripts auxiliares, incluindo:

- `adsb_dallas.bin`
- `adsb_daytona.bin`
- `adsb_lancaster.bin`
- `dynon.bin`
- `gdl90_test.py`
- `levil.bin`
- `mmu.bin`
- `nmea_bos.txt`
- `nmea_test.py`

Nao existia `test/` com testes unitarios Dart para novos modelos de dominio.

### Estrutura atual de `integration_test/`

- `integration_test/app_test.dart`
- `integration_test/screenshot_navlog_test.dart`
- `integration_test/screenshot_test.dart`

### Dependencias

- `sqflite` e `path` ja existiam.
- `flutter_riverpod` ainda nao existia no `pubspec.yaml`.

## Arquivos criados

### Core

- `lib/core/database/app_database.dart`
- `lib/core/errors/app_exception.dart`
- `lib/core/providers/database_provider.dart`

### Features - Aircraft

- `lib/features/aircraft/domain/aircraft.dart`
- `lib/features/aircraft/domain/aircraft_repository.dart`
- `lib/features/aircraft/data/aircraft_repository_provider.dart`
- `lib/features/aircraft/presentation/.gitkeep`

### Features - Logbook

- `lib/features/logbook/domain/logbook_entry.dart`
- `lib/features/logbook/domain/logbook_repository.dart`
- `lib/features/logbook/data/logbook_repository_provider.dart`
- `lib/features/logbook/presentation/.gitkeep`

### Features - Flight Plan

- `lib/features/flight_plan/data/.gitkeep`
- `lib/features/flight_plan/domain/.gitkeep`
- `lib/features/flight_plan/presentation/.gitkeep`

### Features - Weather

- `lib/features/weather/data/.gitkeep`
- `lib/features/weather/domain/.gitkeep`
- `lib/features/weather/presentation/.gitkeep`

### Features - Offline Charts

- `lib/features/offline_charts/data/.gitkeep`
- `lib/features/offline_charts/domain/.gitkeep`
- `lib/features/offline_charts/presentation/.gitkeep`

### Features - Moving Map

- `lib/features/moving_map/data/.gitkeep`
- `lib/features/moving_map/domain/.gitkeep`
- `lib/features/moving_map/presentation/.gitkeep`

### Testes

- `test/features/aircraft/domain/aircraft_test.dart`
- `test/features/logbook/domain/logbook_entry_test.dart`

### Documentacao

- `docs/SPRINT_1_0_MODULAR_APP_FOUNDATION.md`

## Arquivos modificados

- `pubspec.yaml`
- `docs/TECHNICAL_BASELINE.md`
- `BACKLOG.md`

## Dependencias adicionadas

- `flutter_riverpod: ^3.3.2`

Observacao:

- `sqflite` ja existia.
- `path` ja existia.
- Nenhuma dependencia de cloud, mapa, REST client ou feature fora do escopo foi adicionada nesta sprint.

## Estrutura modular criada

Foi adicionada uma baseline paralela e nao intrusiva:

```text
lib/
  core/
    database/
    errors/
    providers/
  features/
    aircraft/
      data/
      domain/
      presentation/
    logbook/
      data/
      domain/
      presentation/
    flight_plan/
      data/
      domain/
      presentation/
    weather/
      data/
      domain/
      presentation/
    offline_charts/
      data/
      domain/
      presentation/
    moving_map/
      data/
      domain/
      presentation/
```

A estrutura nova foi criada sem tocar na navegacao principal, sem registrar rotas novas e sem substituir pastas legadas ja existentes em `lib/`.

## Explicacao da arquitetura

A baseline adotada nesta sprint separa o novo trabalho em duas camadas de alto nivel:

- `core/`: infraestrutura compartilhada e transversal.
- `features/`: unidades modulares por dominio funcional futuro.

Essa organizacao permite evoluir o NexusEFB sprint a sprint sem fazer refatoracao ampla do AvareX atual.

## Explicacao da camada core

### `lib/core/database`

Contem a infraestrutura minima de SQLite compartilhada para futuras features.

### `lib/core/errors`

Contem uma excecao base minima para futuras padronizacoes de erro, sem integrar isso ao codigo legado nesta sprint.

### `lib/core/providers`

Contem o provider base de banco, desacoplado de UI e sem side effect visual.

## Explicacao da camada features

Cada feature nova recebeu estrutura propria de:

- `data/`
- `domain/`
- `presentation/`

Nesta sprint, apenas `aircraft` e `logbook` receberam artefatos de dominio concretos. As demais features ficaram com baseline estrutural somente, sem telas, sem casos de uso e sem repositorios concretos.

## Explicacao da camada database

`lib/core/database/app_database.dart` introduz uma classe `AppDatabase` minima com:

- nome do banco `nexus_efb.db`
- versao inicial `1`
- getter `database`
- metodo `openDatabase`
- metodo `close`
- callback `onCreate`

As tabelas criadas foram limitadas a baseline tecnica:

### `aircraft`

- `id TEXT PRIMARY KEY`
- `registration TEXT NOT NULL`
- `model TEXT`
- `created_at TEXT NOT NULL`
- `updated_at TEXT NOT NULL`

### `logbook_entries`

- `id TEXT PRIMARY KEY`
- `aircraft_id TEXT`
- `date TEXT NOT NULL`
- `departure TEXT`
- `arrival TEXT`
- `flight_time_minutes INTEGER`
- `created_at TEXT NOT NULL`
- `updated_at TEXT NOT NULL`

Nao foi criada integracao com UI, CRUD, seed de dados ou sincronizacao.

## Explicacao dos models

### `Aircraft`

Modelo simples de dominio com:

- `id`
- `registration`
- `model`
- `createdAt`
- `updatedAt`
- construtor `const`
- `copyWith`
- `toMap`
- `fromMap`

### `LogbookEntry`

Modelo simples de dominio com:

- `id`
- `aircraftId`
- `date`
- `departure`
- `arrival`
- `flightTimeMinutes`
- `createdAt`
- `updatedAt`
- construtor `const`
- `copyWith`
- `toMap`
- `fromMap`

Nao foi usada code generation.

## Explicacao dos repository contracts

Foram criadas apenas interfaces abstratas:

### `AircraftRepository`

- `Future<List<Aircraft>> listAircraft();`
- `Future<Aircraft?> getAircraftById(String id);`
- `Future<void> saveAircraft(Aircraft aircraft);`
- `Future<void> deleteAircraft(String id);`

### `LogbookRepository`

- `Future<List<LogbookEntry>> listEntries();`
- `Future<List<LogbookEntry>> listEntriesByAircraft(String aircraftId);`
- `Future<LogbookEntry?> getEntryById(String id);`
- `Future<void> saveEntry(LogbookEntry entry);`
- `Future<void> deleteEntry(String id);`

Nao foi criado CRUD real nesta sprint.

## Explicacao dos providers

### `appDatabaseProvider`

Provider minimo de `AppDatabase`, sem abrir banco automaticamente por tela e sem alterar `main.dart`.

### `aircraftRepositoryProvider`

Provider placeholder com `UnimplementedError`, documentando que a ligacao concreta ficara para sprint futura.

### `logbookRepositoryProvider`

Mesmo padrao de placeholder para futura implementacao.

## Testes minimos

Foram criados testes unitarios simples para:

- criacao dos modelos
- `toMap`
- `fromMap`
- `copyWith`

Decisao documentada:

- nao foi criado `test/core/database/app_database_test.dart` nesta sprint;
- `sqflite` exigiria uma validacao local/CI mais confiavel do ambiente antes de adicionar teste de banco com valor tecnico real.

## Comandos executados

No ambiente local do Codex foram executados:

```text
where flutter
flutter --version
Get-ChildItem -Force
Get-ChildItem -Recurse -Depth 2 work
```

Tambem foram feitas inspecoes do repositorio e da arvore atual diretamente no GitHub para `lib/`, `tests/`, `integration_test/` e arquivos-chave do projeto.

## Resultado de `flutter pub get`

Status:

```text
NAO EXECUTADO
```

Motivo:

```text
O ambiente local do Codex nao possui um checkout utilizavel do repositorio e o wrapper local do Flutter continuou travando ainda no preflight (`flutter --version`).
```

## Resultado de `flutter analyze`

Status:

```text
NAO EXECUTADO
```

Motivo:

```text
Bloqueado pelo mesmo problema de ambiente local do Codex antes da validacao do repositrio.
```

## Resultado de `flutter test`

Status:

```text
NAO EXECUTADO
```

Motivo:

```text
Bloqueado pelo mesmo problema de ambiente local do Codex antes da validacao do repositrio.
```

## Resultado de `flutter build apk --debug`

Status:

```text
NAO EXECUTADO
```

Motivo:

```text
Bloqueado pelo mesmo problema de ambiente local do Codex antes da validacao do repositrio.
```

## Riscos

- `pubspec.lock` nao foi regenerado localmente nesta sprint porque `flutter pub get` nao pode ser validado no ambiente atual.
- Os providers placeholder falham intencionalmente se forem consumidos antes da sprint de implementacao concreta.
- A validacao remota via GitHub Actions continua impactada pelo problema ja documentado de jobs presos em `queued`.
- A baseline modular nova convive com a estrutura legada, o que e intencional agora, mas exigira governanca clara nas proximas sprints.

## Proximos passos

1. Recuperar um ambiente de validacao executavel: local Codex ou GitHub Actions.
2. Rodar `flutter pub get` para atualizar lockfile e validar a nova dependencia.
3. Rodar `flutter analyze` e corrigir somente o primeiro erro real, se houver.
4. Rodar `flutter test` para validar os testes de dominio criados.
5. Se o build Android continuar bloqueado localmente, documentar a primeira falha real em sprint especifica de ambiente.
6. Na Sprint 1.1, iniciar implementacoes concretas pequenas sobre `aircraft` ou `logbook`, sem tocar ainda em UI principal se o ambiente continuar instavel.

## Status final

**FALHOU**

A fundacao modular minima foi criada no repositrio, mas a sprint nao pode ser marcada como concluida porque `flutter pub get`, `flutter analyze`, `flutter test` e `flutter build apk --debug` nao puderam ser validados no ambiente atual do Codex.