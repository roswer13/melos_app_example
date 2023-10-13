import 'package:gamemark/features/features.dart';

class GameModel extends Game {
  GameModel({
    required super.id,
    String? name,
    required super.creationDate,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      id: json['id'],
      name: json['name'],
      creationDate: json['creationDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': super.id,
      'name': super.name,
      'creationDate': super.creationDate,
    };
  }
}
