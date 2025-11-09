import 'package:dio/dio.dart';

import '../../../config/test_credentials.dart';

class ApiConstants {
  // Production API
  static const String prodBaseUrl = "http://139.59.36.95:5000/v1";
  
  // Development/Test mode - use mock server or alternative
  static const String devBaseUrl = "https://jsonplaceholder.typicode.com"; // Mock API for testing
  
  // Use test base URL when in test mode, otherwise production
  static String get baseUrl => TestCredentials.isTestMode ? devBaseUrl : prodBaseUrl;
  
  static bool get isUsingMockApi => TestCredentials.isTestMode;
}

final dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

class ApiEndpoints {
  static String get signIn => TestCredentials.isTestMode 
    ? "${ApiConstants.baseUrl}/posts" // Mock endpoint for testing
    : "${ApiConstants.baseUrl}/auth/signin";
    
  static String get signUp => TestCredentials.isTestMode
    ? "${ApiConstants.baseUrl}/posts" // Mock endpoint for testing  
    : "${ApiConstants.baseUrl}/auth/signup";
    
  static String get authStatus => TestCredentials.isTestMode
    ? "${ApiConstants.baseUrl}/posts/1" // Mock endpoint for testing
    : "${ApiConstants.baseUrl}/auth/status";
}
