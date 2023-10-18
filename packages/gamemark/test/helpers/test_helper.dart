import 'package:gamemark/features/data/data.dart';
import 'package:gamemark/features/domain/domain.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  GameRepository,
  UserGameRepository,
  GamemarkLocalDataSource,
  GamemarkLocalDataSourceImpl,
], customMocks: [])
void main() {}
