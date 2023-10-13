import 'package:dartz/dartz.dart';
import 'package:gamemark/core/error/error.dart';
import 'package:gamemark/features/features.dart';

abstract class UserGameRepository {
  Future<Either<Failure, UserGame>> getCurrentUserGame(int gameId);
}
