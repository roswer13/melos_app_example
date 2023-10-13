import 'package:dartz/dartz.dart';
import 'package:gamemark/core/error/error.dart';
import 'package:gamemark/features/domain/domain.dart';

class GetGame {
  final GameRepository repository;

  GetGame(this.repository);

  Future<Either<Failure, Game>> execute() {
    return repository.getGames();
  }
}
