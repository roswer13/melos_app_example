import 'package:flutter/material.dart';
import 'package:gamemark/config/config.dart';

class Gamemark extends StatelessWidget {
  final String env;

  const Gamemark({super.key, required this.env});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Gamemark',
      routerConfig: RoutesConfig.routeConfig,
    );
  }
}
