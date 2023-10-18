import 'package:flutter_test/flutter_test.dart';
import 'package:gamemark/core/core.dart';
import 'package:gamemark/features/features.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late Database database;
  late MockGamemarkLocalDataSourceImpl localDataSource;

  final gameModel = GameModel(
    name: 'Test name',
    creationDatetime: DateTime.now().toString(),
  );

  final gameList = List.generate(10, (index) => gameModel);

  setUpAll(() async {
    sqfliteFfiInit();
    database = await databaseFactoryFfi.openDatabase(
      inMemoryDatabasePath,
      options: OpenDatabaseOptions(
        version: DbConstants.databaseVersion,
      ),
    );
    await database.execute(DbConstants.createTableQuery);
    localDataSource = MockGamemarkLocalDataSourceImpl();
    localDataSource.db = database;
  });

  group('Database ...', () {
    test('Should return database version', () async {
      //arrange
      const dbVersion = DbConstants.databaseVersion;
      //act
      final result = await database.getVersion();
      //assert
      expect(result, dbVersion);
    });

    test('Should add successfully a Game to database', () async {
      //arrange
      final tSerializedGame = gameModel.toJson();
      //act - insert method in sql return 1 if success or 0 if not
      final result =
          await database.insert(DbConstants.tableGameName, tSerializedGame);
      //assert
      expect(result, equals(1));
    });

    test(
        'Should fail if trying to insert the same game more than once into the database',
        () async {
      //arrange
      final tSerializedGame = gameModel.toJson();
      //act - insert method in sql return 1 if success or 0 if not
      await database.insert(DbConstants.tableGameName, tSerializedGame);
      final result = await database.insert(
        DbConstants.tableGameName,
        tSerializedGame,
      );
      //assert
      expect(result, isNot(1));
    });

    test('Should close database', () async {
      //arrange
      //act
      await database.close();
      //assert
      expect(database.isOpen, isFalse);
    });
  });

  group('get and insert game', () {
    test(
      'should return List<GameModel> from the database when there is data present',
      () async {
        //arrange
        when(localDataSource.getGames()).thenAnswer((_) async => gameList);
        verifyNever(localDataSource.getGames());
        //act
        final result = await localDataSource.getGames();
        //assert
        expect(result, gameList);
        verify(localDataSource.getGames());
      },
    );

    test(
      'should insert GameModel into the database',
      () async {
        // arrange
        when(localDataSource.insertGame(gameModel)).thenAnswer((_) async => 1);
        //act
        final result = await localDataSource.insertGame(gameModel);
        //assert
        expect(result, equals(1));
      },
    );
  });
}
