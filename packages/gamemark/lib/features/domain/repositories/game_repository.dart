import 'package:dartz/dartz.dart';
import 'package:gamemark/core/error/error.dart';
import 'package:gamemark/features/domain/domain.dart';

abstract class GameRepository {
  Future<Either<Failure, UserGame>> getCurrentUserGame(int gameId);
}
