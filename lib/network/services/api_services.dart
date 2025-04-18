import 'dart:developer';
import 'package:dio/dio.dart';

import '../api_url/api_url.dart';

class ApiServices {
  static final authHeader = {'Content-Type': "application/json"};

  Dio api = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      contentType: "application/json",
    ),
  );

  Future<dynamic> request({
    required String url,
    required RequestMethod method,
    Object? payload,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> header,
  }) async {
    log("URL $url");
    log("queryParameters $queryParameters");
    if (payload is FormData) {
      log("Request Body FormData -- ${payload.fields} ${payload.files}");
    } else {
      log("Request Body-- $payload");
    }

    try {
      Response<dynamic> response;
      switch (method) {
        case RequestMethod.get:
          response = await api.get(
            url,
            data: payload,
            options: Options(headers: header),
            queryParameters: queryParameters,
          );
          break;
        case RequestMethod.post:
          response = await api.post(
            url,
            data: payload,
            options: Options(headers: header),
            queryParameters: queryParameters,
          );
          break;
        case RequestMethod.patch:
          response = await api.patch(
            url,
            data: payload,
            options: Options(headers: header),
            queryParameters: queryParameters,
          );
          break;
        case RequestMethod.delete:
          response = await api.delete(
            url,
            options: Options(headers: header),
            queryParameters: queryParameters,
          );
          break;
      }
      log("message${response.data}");

      return response.data;
    } on DioException catch (e) {
      log("message${e.toString()}");
      return null;
    }
  }
}

enum RequestMethod { get, post, patch, delete }
