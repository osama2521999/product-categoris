import 'package:dio/dio.dart';

abstract class ProductRemoteDataSource {
  Future<Response> getProductDetails({required String productId});
}

class ProductRemoteDataSourceImp implements ProductRemoteDataSource {
  final Dio _dio;

  ProductRemoteDataSourceImp(
    this._dio,
  );

  @override
  Future<Response> getProductDetails({required String productId}) async {
    return await _dio.get(
      "products/$productId",
      options: Options(
        headers: {
          "Content-type": "application/json",
        },
      ),
    );
  }
}
