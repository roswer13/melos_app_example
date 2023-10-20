import 'package:flutter_test/flutter_test.dart';
import 'package:gamemark/features/features.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late DatabaseHelper databaseHelper;

  sqfliteFfiInit();

  setUp(() async {
    databaseHelper = DatabaseHelper();
  });

  test('should return a database instance', () async {
    // arrange
    final db = await databaseHelper.database;
    // act
    // assert
    expect(db, isA<Database>());
  });

  test('should insert a game into the database', () async {
    //arrange
    final game = GameModel(
      name: 'Test name',
      creationDatetime: DateTime.now().toString(),
    );
    //act
    final result = await databaseHelper.insertGame(game);
    //assert
    expect(result, 1);
  });

  test('should return a list of games from the database', () async {
    //arrange
    final games = await databaseHelper.getGames();
    //act
    //assert
    expect(games, isA<List<Map<String, dynamic>>>());
  });

  test('Should close database', () async {
    //arrange
    final db = await databaseHelper.database;
    //act
    await db.close();
    //assert
    expect(db.isOpen, isFalse);
  });
}
