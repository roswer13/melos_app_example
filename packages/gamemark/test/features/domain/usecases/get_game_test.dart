import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gamemark/features/features.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetGame usecase;
  late MockGameRepository mockGameRepository;

  setUp(() {
    mockGameRepository = MockGameRepository();
    usecase = GetGame(mockGameRepository);
  });

  final game = Game(
    id: 1,
    name: 'Test',
    creationDatetime: DateTime(2020, 01, 01).toString(),
  );

  final tGameList = [game];

  test(
    'should get game from the repository',
    () async {
      // arrange
      when(mockGameRepository.getGames())
          .thenAnswer((_) async => Right(tGameList));
      // act
      final result = await usecase.execute();
      // assert
      expect(result, equals(Right(tGameList)));
      verify(mockGameRepository.getGames());
      verifyNoMoreInteractions(mockGameRepository);
    },
  );
}
