import 'package:flutter/material.dart';
import 'package:test_task/data/services/local/hive_local_service.dart';
import 'package:test_task/utilities/di/locator.dart';

import '../utilities/helpers/pager.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isChecked = locator<HiveLocalService>().getData;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: isChecked
          ? Pager.home
          : Pager.login,
    );
  }
}
