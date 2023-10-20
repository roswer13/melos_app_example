import 'package:dartz/dartz.dart';
import 'package:gamemark/core/core.dart';
import 'package:gamemark/features/features.dart';

class GameRepositoryImpl implements GameRepository {
  final GamemarkLocalDataSource localDataSource;

  GameRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Game>>> getGames() async {
    try {
      return Right(await localDataSource.getGames());
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, int>> insertGame(Game game) async {
    try {
      return Right(await localDataSource.insertGame(game as GameModel));
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
