import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../../product/domain/entities/product_entity.dart';

abstract class CategoryRepositories {
  Future<Either<Failure, List<String>>> getCategories();

  Future<Either<Failure, List<ProductEntity>>> getCategoryProducts(
      {required String catName});

}
