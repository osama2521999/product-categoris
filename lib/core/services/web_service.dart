import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '/core/constants/constants.dart';
import 'toast_service.dart';

class WebService {
  factory WebService() {
    _this ??= WebService._();
    return _this!;
  }

  static WebService? _this;

  final String _baseURL = Constants.baseUrl;

  Dio privateDio = Dio();

  WebService._() {
    privateDio.options.baseUrl = _baseURL;
    privateDio.options.connectTimeout = const Duration(milliseconds: 45000);

    initializeInterceptors();
  }

  initializeInterceptors() async {
    privateDio.interceptors.clear();

    privateDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (kDebugMode) {
            print(options.data);
            print('-----------------------------------------------');
          }
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          if (kDebugMode) {
            print(response.data.toString());
          }
          return handler.next(response); // continue
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 404) {
            ToastService.showErrorToast("not found");
          }

          if (e.response?.statusCode == 400) {
            return handler.resolve(e.response!);
          } else {
            ToastService.showErrorToast("no connection");
          }
          return handler.next(e);
        },
      ),
    );
  }
}
