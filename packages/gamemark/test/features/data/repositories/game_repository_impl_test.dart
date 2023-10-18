import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gamemark/core/core.dart';
import 'package:gamemark/features/features.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GameRepositoryImpl repository;
  late MockGamemarkLocalDataSource mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockGamemarkLocalDataSource();
    repository = GameRepositoryImpl(localDataSource: mockLocalDataSource);
  });

  final gameList = List.generate(
    3,
    (index) => GameModel(
      id: index,
      name: 'Test $index',
      creationDatetime: DateTime(2020, 01, 01).toString(),
    ),
  );

  test(
    'should return a list of games from the local data source',
    () async {
      // arrange
      when(mockLocalDataSource.getGames()).thenAnswer((_) async => gameList);
      // act
      final result = await repository.getGames();
      // assert
      expect(result, Right(gameList));
      verify(mockLocalDataSource.getGames());
      verifyNoMoreInteractions(mockLocalDataSource);
    },
  );

  test(
    'should return a CacheFailure when there is an exception',
    () async {
      // arrange
      when(mockLocalDataSource.getGames()).thenThrow(CacheException());
      // act
      final result = await repository.getGames();
      // assert
      expect(result, Left(CacheFailure()));
      verify(mockLocalDataSource.getGames());
      verifyNoMoreInteractions(mockLocalDataSource);
    },
  );
}
