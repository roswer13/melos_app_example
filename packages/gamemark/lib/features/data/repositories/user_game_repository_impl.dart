import 'package:dartz/dartz.dart';
import 'package:gamemark/core/core.dart';
import 'package:gamemark/features/features.dart';

class UserGameRepositoryImpl implements UserGameRepository {
  final GamemarkLocalDataSource localDataSource;

  UserGameRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, UserGame>> getCurrentUserGame(int gameId) {
    // TODO: implement getCurrentUserGame
    throw UnimplementedError();
  }
}
