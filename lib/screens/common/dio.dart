import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioClient {
  late final Dio dio;

  InterceptorsWrapper interceptorsWrapper = InterceptorsWrapper(
    onError: (e, handler) {
      debugPrint('Dio -- Error: ${e.type} --- ${e.message}');
      handler.next(e);
    },
    onRequest: (options, handler) {
      debugPrint('Dio -- Request: ${options.uri} --- ${options.data}');
      handler.next(options);
    },
    onResponse: (e, handler) {
      // debugPrint('Dio -- Response: ${e.realUri} --- ${e.data}');
      handler.next(e);
    },
  );

  DioClient() {
    dio = Dio();
    dio.options.baseUrl = 'https://newsapi.org/v2/';
    dio.options.connectTimeout = const Duration(seconds: 20);
    dio.options.receiveTimeout = const Duration(seconds: 5);
    dio.interceptors.add(interceptorsWrapper);
  }
}

late final DioClient dioClient;
