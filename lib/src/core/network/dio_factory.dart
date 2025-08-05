import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import '../constants/end_points.dart';

class DioFactory {
  static final DioFactory _instance = DioFactory._internal();

  factory DioFactory() => _instance;

  late Dio dio;

  DioFactory._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: EndPoints.baseURL,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=utf-8',
        'tz': DateTime.now().timeZoneName.toString(),
      },
      responseType: ResponseType.json,
    );

    dio = Dio(options);
    dio.interceptors.add(
      RetryInterceptor(dio: dio, logPrint: print, retries: 3),
    );
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
        ),
      );
    }
  }
  Future<Response<dynamic>> postData(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
      })  {
    return dio.post(path,data:data,queryParameters: queryParameters);
  }
  Future<Response<dynamic>> getData(
      String path, {
        Map<String, dynamic>? queryParameters,
      })  {
    return dio.get(path,queryParameters: queryParameters);
  }
}
