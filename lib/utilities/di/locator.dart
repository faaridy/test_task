import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_task/data/contracts/login_contract.dart';
import 'package:test_task/data/contracts/products_contract.dart';
import 'package:test_task/data/repositories/login_repository.dart';
import 'package:test_task/data/repositories/products_repository.dart';
import 'package:test_task/data/services/local/hive_local_service.dart';
import 'package:test_task/data/services/remote/login_services.dart';
import 'package:test_task/data/services/remote/products_services.dart';

final GetIt locator = GetIt.instance;
init() async {
  await Hive.initFlutter();
}

Future<void> setupLocator() async {
  final Box box = await Hive.openBox('login');
  locator.registerLazySingleton(() => LoginServices());
  locator
      .registerLazySingleton<LoginContract>(() => LoginRepository(locator()));
  locator.registerLazySingleton(() => HiveLocalService(box));
  locator.registerLazySingleton(() => ProductsServices());
  locator.registerLazySingleton<ProductsContract>(
      () => ProductsRepository(locator()));
}
