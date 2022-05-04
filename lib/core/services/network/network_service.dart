import 'package:code_base/core/error/failures.dart';
import 'package:code_base/core/utils/flavor_settings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'network_constants.dart';
import 'network_infor.dart';

class NetworkService {
  NetworkService({required this.networkInforImplement}) {
    init();
  }

  final NetworkInforImplement networkInforImplement;

  final dio = Dio();

  void init() async {
    dio.options.baseUrl = (await getFlavorSettings()).apiBaseUrl;
    dio.options.connectTimeout = 60000;

    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
      ));
    }

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        try {
          String? token = '';

          options.headers[authorization] = 'Bearer $token';
          options.headers[xSecretKey] =
              (await getFlavorSettings()).xSecretKey;
        } on Exception {
          return handler.reject(DioError(
              requestOptions: options,
              error: ServerFailure('BACKEND_GENERAL_ERROR_MESSAGE')));
        }
        return handler.next(options);
      },
      onResponse: (Response response, handler) {
        Response newResponse = Response(
          requestOptions: response.requestOptions,
          data: response.data,
        );
        return handler.next(newResponse);
      },
      onError: (DioError e, handler) async {
        if (await networkInforImplement.isConnected()) {
          return handler.next(DioError(
              response: e.response,
              requestOptions: e.requestOptions,
              error: ServerFailure('CHECK_INTERNET')));
        }
        return handler.next(DioError(
            response: e.response,
            requestOptions: e.requestOptions,
            error: ServerFailure('BACKEND_GENERAL_ERROR_MESSAGE')));
      },
    ));
  }
}

enum APIRoute {
  register,
  random,
}

extension APIRouteExtention on APIRoute {
  String get path {
    switch (this) {
      case APIRoute.register:
        return '/register';
      case APIRoute.random:
        return '/random?json';
    }
  }
}
