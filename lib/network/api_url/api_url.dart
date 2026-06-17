import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../../config/test_credentials.dart';

class ApiConstants {
  // Backend base (Go API)
  static const String localBackend = "http://localhost:8080";
  static const String deviceBackend = "http://10.0.2.2:8080"; // Android emulator

  // Existing demo/mock endpoints kept for legacy flows
  static const String prodBaseUrl = deviceBackend; // point to backend for now
  static const String devBaseUrl = deviceBackend;

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
  static String get signIn => "${ApiConstants.baseUrl}/auth/signin"; // legacy unused
  static String get signUp => "${ApiConstants.baseUrl}/auth/signup"; // legacy unused
  static String get authStatus => "${ApiConstants.baseUrl}/auth/status"; // legacy unused
  static String get me => "${ApiConstants.baseUrl}/me";
  static String get feed => "${ApiConstants.baseUrl}/feed";
}
