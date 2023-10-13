import 'package:dartz/dartz.dart';
import 'package:gamemark/core/error/error.dart';
import 'package:gamemark/features/domain/domain.dart';

class GetUserGame {
  final UserGameRepository repository;

  GetUserGame(this.repository);

  Future<Either<Failure, UserGame>> execute(int gameId) {
    return repository.getCurrentUserGame(gameId);
  }
}
