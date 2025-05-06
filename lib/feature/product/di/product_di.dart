import '../../.././../feature/product/domain/entities/product_entity.dart';

import '../../../core/services/service_locator.dart';
import '../../../core/services/web_service.dart';
import '../data/data_sources/product_remote_source.dart';
import '../data/repositories/product_repositories_imp.dart';
import '../domain/repositories/product_repositories.dart';
import '../presentation/manager/product_cubit.dart';

Future<void> productInjectables() async {
  sl
    ..registerFactoryParam<ProductCubit, ProductEntity?, bool?>(
      (pram1, pram2) => ProductCubit(selectedProduct: pram1),
    )
    ..registerLazySingleton<ProductRepositories>(
      () => ProductRepositoriesImp(sl<ProductRemoteDataSource>()),
    )
    ..registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImp(
        sl<WebService>().privateDio,
      ),
    );
}
