import 'package:gamemark/core/core.dart';
import 'package:gamemark/features/features.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class GamemarkLocalDataSourceImpl implements GamemarkLocalDataSource {
  static final GamemarkLocalDataSourceImpl _instance =
      GamemarkLocalDataSourceImpl._();

  factory GamemarkLocalDataSourceImpl() => _instance;

  GamemarkLocalDataSourceImpl._() {
    _initDatabase();
  }

  static Database? _database;

  set db(Database? value) {
    _database = value;
  }

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, DbConstants.databaseName);
    return openDatabase(
      path,
      onCreate: _onCreate,
      version: DbConstants.databaseVersion,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    return await db.execute(DbConstants.createTableQuery);
  }

  @override
  Future<GameModel> getGames() {
    // TODO: implement getGames
    throw UnimplementedError();
  }

  Future close() async => _database?.close();
}
