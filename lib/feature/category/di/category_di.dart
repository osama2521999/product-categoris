import '../../../core/services/service_locator.dart';
import '../../../core/services/web_service.dart';
import '../data/data_sources/category_remote_source.dart';
import '../data/repositories/category_repositories_imp.dart';
import '../domain/repositories/category_repositories.dart';
import '../domain/use_cases/get_categories_use_case.dart';
import '../domain/use_cases/get_category_products_use_case.dart';
import '../presentation/manager/category_cubit.dart';

Future<void> categoryInjectables() async {
  sl
    ..registerLazySingleton<CategoryCubit>(
      () => CategoryCubit(),
    )
    ..registerLazySingleton(
      () => GetCategoriesUseCase(sl<CategoryRepositories>()),
    )
    ..registerLazySingleton(
      () => GetCategoryProductsUseCase(sl<CategoryRepositories>()),
    )
    ..registerLazySingleton<CategoryRepositories>(
      () => CategoryRepositoriesImp(sl<CategoryRemoteDataSource>()),
    )
    ..registerLazySingleton<CategoryRemoteDataSource>(
      () => CategoryRemoteDataSourceImp(
        sl<WebService>().privateDio,
      ),
    );
}
