import 'package:equatable/equatable.dart';

class Game extends Equatable {
  final String? name;
  final DateTime creationDate;

  const Game({
    this.name,
    required this.creationDate,
  });

  @override
  List<Object?> get props => [name, creationDate];
}
