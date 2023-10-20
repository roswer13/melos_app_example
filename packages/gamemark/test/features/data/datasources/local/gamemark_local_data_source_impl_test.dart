import 'package:flutter_test/flutter_test.dart';
import 'package:gamemark/core/core.dart';
import 'package:gamemark/features/features.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockDatabaseHelper mockDatabaseHelper;
  late GamemarkLocalDataSourceImpl dataSource;
  setUp(() async {
    mockDatabaseHelper = MockDatabaseHelper();
    dataSource = GamemarkLocalDataSourceImpl(database: mockDatabaseHelper);
  });

  group('getGames', () {
    final gameList = List.generate(
      10,
      (index) => GameModel(
        id: index,
        name: 'Game name $index',
        creationDatetime: DateTime.now().toString(),
      ),
    );

    test(
      'should return List<GameModel> from database when there is data in the cache',
      () async {
        // arrange
        when(mockDatabaseHelper.getGames())
            .thenAnswer((_) async => gameList.map((e) => e.toJson()).toList());
        // act
        final result = await dataSource.getGames();
        // assert
        verify(mockDatabaseHelper.getGames());
        expect(result, gameList);
      },
    );

    test(
      'should throw CacheException when there is no data in the cache',
      () async {
        // arrange
        when(mockDatabaseHelper.getGames()).thenAnswer((_) async => []);
        // act
        final call = dataSource.getGames;
        // assert
        expect(() => call(), throwsA(isInstanceOf<CacheException>()));
      },
    );
  });

  group('insertGame', () {
    final gameModel = GameModel(
      name: 'Test name',
      creationDatetime: DateTime.now().toString(),
    );

    test(
      'should call insertGame on database helper with the given game',
      () async {
        // arrange
        when(mockDatabaseHelper.insertGame(gameModel))
            .thenAnswer((_) async => 1);
        // act
        final result = await dataSource.insertGame(gameModel);
        // assert
        verify(mockDatabaseHelper.insertGame(gameModel));
        expect(result, 1);
      },
    );

    test(
      'should throw CacheException when insertGame on database helper throws an exception',
      () async {
        // arrange
        when(mockDatabaseHelper.insertGame(gameModel)).thenThrow(Exception());
        // act
        final call = dataSource.insertGame;
        // assert
        expect(() => call(gameModel), throwsA(isInstanceOf<CacheException>()));
      },
    );
  });
}
