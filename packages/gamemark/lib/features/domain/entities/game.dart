import 'package:equatable/equatable.dart';

class Game extends Equatable {
  final int id;
  final String? name;
  final DateTime creationDate;

  const Game({
    required this.id,
    this.name,
    required this.creationDate,
  });

  @override
  List<Object?> get props => [name, creationDate];
}
