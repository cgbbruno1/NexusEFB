import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sqflite;

class AppDatabase {
  AppDatabase._internal();

  static final AppDatabase _instance = AppDatabase._internal();

  factory AppDatabase() => _instance;

  sqflite.Database? _database;

  Future<sqflite.Database> get database async {
    _database ??= await openDatabase();
    return _database!;
  }

  Future<sqflite.Database> openDatabase() async {
    final databasesPath = await sqflite.getDatabasesPath();
    final databasePath = path.join(databasesPath, _databaseName);

    return sqflite.openDatabase(
      databasePath,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> close() async {
    final database = _database;
    if (database == null) {
      return;
    }

    await database.close();
    _database = null;
  }

  Future<void> _onCreate(sqflite.Database db, int version) async {
    await db.execute('''
      CREATE TABLE aircraft (
        id TEXT PRIMARY KEY,
        registration TEXT NOT NULL,
        model TEXT,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE logbook_entries (
        id TEXT PRIMARY KEY,
        aircraft_id TEXT,
        date TEXT NOT NULL,
        departure TEXT,
        arrival TEXT,
        flight_time_minutes INTEGER,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL
      )
    ''');
  }

  static const String _databaseName = 'nexus_efb.db';
  static const int _databaseVersion = 1;
}
