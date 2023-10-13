import 'package:gamemark/features/features.dart';

abstract class GamemarkLocalDataSource {
  Future<GameModel> getGames();
}
