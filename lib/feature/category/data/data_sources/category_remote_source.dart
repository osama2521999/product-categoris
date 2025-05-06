import 'package:dio/dio.dart';

abstract class CategoryRemoteDataSource {
  Future<Response> getCategories();

  Future<Response> getCategoryProducts({required String catName});
}

class CategoryRemoteDataSourceImp implements CategoryRemoteDataSource {
  final Dio _dio;

  CategoryRemoteDataSourceImp(
    this._dio,
  );

  @override
  Future<Response> getCategories() async {
    return await _dio.get(
      "products/category-list",
      options: Options(
        headers: {
          "Content-type": "application/json",
        },
      ),
    );
  }

  @override
  Future<Response> getCategoryProducts({required String catName}) async {
    return await _dio.get(
      "products/category/$catName",
      options: Options(
        headers: {
          "Content-type": "application/json",
        },
      ),
    );
  }
}
