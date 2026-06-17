import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../../config/test_credentials.dart';

class ApiConstants {
  // Backend base (Go API)
  static const String localBackend = "http://localhost:8080";
  static const String deviceBackend = "http://10.0.2.2:8080"; // Android emulator
  static const String prodBackend = "http://35.253.120.86:8080"; // VM

  // Use deviceBackend for emulator, prodBackend for physical device
  static const String prodBaseUrl = prodBackend;
  static const String devBaseUrl = prodBackend;

  static String get baseUrl => devBaseUrl;

  static bool get isUsingMockApi => false;
}

final dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl))
  ..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
    // Attach Firebase ID token if available
    try {
      final user = firebase_auth.FirebaseAuth.instance.currentUser;
      if (user != null) {
        final token = await user.getIdToken();
        options.headers['Authorization'] = 'Bearer $token';
      }
    } catch (_) {}
    return handler.next(options);
  }));

class ApiEndpoints {
  static String get me => "${ApiConstants.baseUrl}/v1/profile/me";
  static String get feed => "${ApiConstants.baseUrl}/v1/posts";
}
