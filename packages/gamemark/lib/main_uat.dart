import 'package:flutter/material.dart';
import 'package:gamemark/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Gamemark(env: 'UAT'));
}
