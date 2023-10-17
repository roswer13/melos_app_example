import 'package:gamemark/features/features.dart';

class GameModel extends Game {
  GameModel({
    int? id,
    required String name,
    required String creationDatetime,
  }) : super(
          id: id,
          name: name,
          creationDatetime: creationDatetime,
        );

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      id: json['id'] ?? 0,
      name: json['name'],
      creationDatetime: json['creationDatetime'] ?? DateTime.now().toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'creationDatetime': creationDatetime,
    };
  }
}
