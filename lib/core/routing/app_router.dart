import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../feature/category/presentation/manager/category_cubit.dart';
import '../../feature/category/presentation/pages/cat_products_view.dart';
import '../../feature/category/presentation/pages/home_view.dart';
import '../../feature/product/domain/entities/product_entity.dart';
import '../../feature/product/presentation/manager/product_cubit.dart';
import '../../feature/product/presentation/pages/product_view.dart';
import '../services/service_locator.dart';
import 'page_routes_name.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesName.initial:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<CategoryCubit>(),
            child: const HomeView(),
          ),
          settings: settings,
        );
      case PageRoutesName.catProducts:
        Map<String, dynamic> passedData =
            (settings.arguments as Map<String, dynamic>);
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: sl<CategoryCubit>(),
            child: CatProductsView(
              catName: passedData['catName'] as String,
            ),
          ),
          settings: settings,
        );

      case PageRoutesName.productDetails:
        Map<String, dynamic> passedData =
            (settings.arguments as Map<String, dynamic>);
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<ProductCubit>(
              param1: passedData['product'] as ProductEntity,
            ),
            child: const ProductView(),
          ),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(),
        );
    }
  }
}
