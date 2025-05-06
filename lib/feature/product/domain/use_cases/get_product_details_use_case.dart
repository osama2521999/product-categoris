import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repositories.dart';

class GetProductDetailsUseCase {
  final ProductRepositories _productRepositories;

  GetProductDetailsUseCase(this._productRepositories);

  Future<Either<Failure, ProductEntity>> call({required String productId}) async {
    return await _productRepositories.getProductDetails(productId: productId);
  }
}
