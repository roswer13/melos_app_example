import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gamemark/features/domain/domain.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetUserGame usecase;
  late MockUserGameRepository mockUserGameRepository;

  setUp(() {
    mockUserGameRepository = MockUserGameRepository();
    usecase = GetUserGame(mockUserGameRepository);
  });

  final creationDatetime = DateTime(2020, 01, 01).toString();
  final game = Game(id: 1, name: 'Test', creationDatetime: creationDatetime);
  final userGame = UserGame(
    game: game,
    name: 'User test',
    points: 0,
    creationDate: creationDatetime,
  );

  test(
    'should get user game from the repository',
    () async {
      // arrange
      when(mockUserGameRepository.getCurrentUserGame(game.id))
          .thenAnswer((_) async => Right(userGame));
      // act
      final result = await usecase.execute(game.id!);
      // assert
      expect(result, Right(userGame));
      verify(mockUserGameRepository.getCurrentUserGame(game.id));
      verifyNoMoreInteractions(mockUserGameRepository);
    },
  );
}
