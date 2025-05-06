import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../.././../feature/product/domain/entities/product_entity.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/failures/server_failure.dart';
import '../../domain/repositories/product_repositories.dart';
import '../data_sources/product_remote_source.dart';
import '../models/product_model.dart';

class ProductRepositoriesImp implements ProductRepositories {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoriesImp(this.productRemoteDataSource);

  @override
  Future<Either<Failure, ProductEntity>> getProductDetails(
      {required String productId}) async {
    try {
      final response =
          await productRemoteDataSource.getProductDetails(productId: productId);

      if (response.statusCode == 200) {
        var data = ProductModel.fromJson(response.data);
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
