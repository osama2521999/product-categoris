import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../entities/product_entity.dart';

abstract class ProductRepositories {
  Future<Either<Failure, ProductEntity>> getProductDetails(
      {required String productId});
}
