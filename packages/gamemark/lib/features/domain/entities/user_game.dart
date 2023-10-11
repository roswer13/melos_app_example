import 'package:equatable/equatable.dart';
import 'package:gamemark/features/domain/domain.dart';

class UserGame extends Equatable {
  final Game game;
  final String name;
  final String? note;
  final int points;
  final DateTime creationDate;

  const UserGame({
    required this.game,
    required this.name,
    this.note,
    required this.points,
    required this.creationDate,
  });

  @override
  List<Object?> get props => [game, name, note, points, creationDate];
}
