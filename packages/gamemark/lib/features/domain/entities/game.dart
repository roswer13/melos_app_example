import 'package:equatable/equatable.dart';

class Game extends Equatable {
  final int? id;
  final String name;
  final String creationDatetime;

  const Game({
    this.id,
    required this.name,
    required this.creationDatetime,
  });

  @override
  List<Object?> get props => [id, name, creationDatetime];
}
