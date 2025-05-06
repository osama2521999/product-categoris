import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/failures/server_failure.dart';
import '../../../product/data/models/product_model.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../../domain/repositories/category_repositories.dart';
import '../data_sources/category_remote_source.dart';

class CategoryRepositoriesImp implements CategoryRepositories {
  final CategoryRemoteDataSource categoryRemoteDataSource;

  CategoryRepositoriesImp(this.categoryRemoteDataSource);

  @override
  Future<Either<Failure, List<String>>> getCategories() async {
    try {
      final response = await categoryRemoteDataSource.getCategories();

      if (response.statusCode == 200) {
        var data = List<String>.from(response.data);
        return Right(data);
      } else {
        return Left(
          ServerFailure(
            statusCode: response.statusCode.toString(),
            message: "Server Error",
          ),
        );
      }
    } on DioException catch (error) {
      return Left(
        ServerFailure(
          statusCode: error.response?.statusCode.toString() ?? "",
          message: error.response?.data["message"],
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getCategoryProducts(
      {required String catName}) async {
    try {
      final response =
          await categoryRemoteDataSource.getCategoryProducts(catName: catName);

      if (response.statusCode == 200) {
        var data = List.from(response.data['products'])
            .map(
              (element) => ProductModel.fromJson(element),
            )
            .toList();
        return Right(data);
      } else {
        return Left(
          ServerFailure(
            statusCode: response.statusCode.toString(),
            message: "Server Error",
          ),
        );
      }
    } on DioException catch (error) {
      return Left(
        ServerFailure(
          statusCode: error.response?.statusCode.toString() ?? "",
          message: error.response?.data["message"],
        ),
      );
    }
  }
}
