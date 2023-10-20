import 'package:gamemark/core/core.dart';
import 'package:gamemark/features/features.dart';

class GamemarkLocalDataSourceImpl implements GamemarkLocalDataSource {
  final DatabaseHelper database;

  GamemarkLocalDataSourceImpl({required this.database});

  @override
  Future<List<GameModel>> getGames() async {
    try {
      final games = await database.getGames();

      return games.isNotEmpty
          ? games.map((game) => GameModel.fromJson(game)).toList()
          : throw CacheException();
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<int> insertGame(GameModel game) async {
    try {
      return database.insertGame(game);
    } catch (e) {
      throw CacheException();
    }
  }
}
