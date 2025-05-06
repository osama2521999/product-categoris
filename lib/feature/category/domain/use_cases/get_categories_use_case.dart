import 'package:dartz/dartz.dart';
import '../../../../core/failures/failure.dart';
import '../repositories/category_repositories.dart';

class GetCategoriesUseCase {
  final CategoryRepositories _categoryRepositories;

  GetCategoriesUseCase(this._categoryRepositories);

  Future<Either<Failure, List<String>>> call() async {
    return await _categoryRepositories.getCategories();
  }
}
