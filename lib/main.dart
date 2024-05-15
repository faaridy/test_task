import 'package:flutter/material.dart';
import 'package:test_task/utilities/di/locator.dart';
import 'package:test_task/presentations/app.dart';

void main() async {
  await init();
  await setupLocator();
  runApp(const App());
}