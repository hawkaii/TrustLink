import 'package:dio/dio.dart';

class ApiConstants {
  static const String baseUrl = "https://tienext.inceptionsoftech.com/v1";
}


final dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

class ApiEndpoints {
  static const String signIn = "${ApiConstants.baseUrl}/auth/signin";
  static const String signUp = "${ApiConstants.baseUrl}/auth/signup";
  static const String authStatus = "${ApiConstants.baseUrl}/auth/status";
}
