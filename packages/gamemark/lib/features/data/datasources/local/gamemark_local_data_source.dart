import 'package:gamemark/features/features.dart';

abstract class GamemarkLocalDataSource {
  Future<List<GameModel>> getGames();
  Future<int> insertGame(GameModel game);
}
