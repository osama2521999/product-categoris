import 'package:get_it/get_it.dart';
import '../../core/services/web_service.dart';

import '../../feature/category/di/category_di.dart';
import '../../feature/product/di/product_di.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    productInjectables();
    categoryInjectables();
    initializeWebServices();
  }

  static void initializeWebServices() {
    sl.registerLazySingleton<WebService>(
      () => WebService(),
    );
  }
}
