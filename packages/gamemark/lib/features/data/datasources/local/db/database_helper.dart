import 'package:gamemark/core/core.dart';
import 'package:gamemark/features/features.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._() {
    _initDatabase();
  }

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    sqfliteFfiInit();

    return await databaseFactoryFfi.openDatabase(
      inMemoryDatabasePath,
      options: OpenDatabaseOptions(
        version: DbConstants.databaseVersion,
        onCreate: _onCreate,
      ),
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    return await db.execute(DbConstants.createTableQuery);
  }

  Future<List<Map<String, dynamic>>> getGames() async {
    final db = await database;
    return await db.query(DbConstants.tableGameName);
  }

  Future<int> insertGame(GameModel game) async {
    final db = await database;

    return db.transaction((txn) async {
      return await txn.insert(
        DbConstants.tableGameName,
        game.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }
}
