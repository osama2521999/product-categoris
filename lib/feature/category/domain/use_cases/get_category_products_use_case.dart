import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../repositories/category_repositories.dart';

class GetCategoryProductsUseCase {
  final CategoryRepositories _categoryRepositories;

  GetCategoryProductsUseCase(this._categoryRepositories);

  Future<Either<Failure, List<ProductEntity>>> call({required String catName}) async {
    return await _categoryRepositories.getCategoryProducts(catName: catName);
  }
}
