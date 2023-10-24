import 'package:gamemark/config/config.dart';
import 'package:gamemark/features/features.dart';
import 'package:go_router/go_router.dart';

final routes = [
  GoRoute(
    path: '/',
    name: RoutesName.home,
    parentNavigatorKey: RoutesConfig.navigationKey,
    builder: (context, state) => const MainPage(),
  )
];
