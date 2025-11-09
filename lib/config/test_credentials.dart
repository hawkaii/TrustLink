class TestCredentials {
  // Test API credentials - DO NOT USE IN PRODUCTION
  static const String testApiKey = 'test_api_key_123456789';
  static const String testSecretKey = 'test_secret_abcdef123456';
  static const String testBaseUrl = 'https://api-test.trustlink.dev';
  
  // Test user credentials
  static const String testEmail = 'test@trustlink.dev';
  static const String testPassword = 'Test123!@#';
  static const String testUserId = 'test_user_12345';
  
  // Test payment gateway credentials
  static const String testStripePublishableKey = 'pk_test_123456789abcdef';
  static const String testStripeSecretKey = 'sk_test_abcdef123456789';
  
  // Test Firebase credentials
  static const String testFirebaseProjectId = 'trustlink-test-12345';
  static const String testFirebaseApiKey = 'AIzaSyTest123456789abcdef';
  
  // Test database credentials
  static const String testDbHost = 'test-db.trustlink.dev';
  static const String testDbName = 'trustlink_test';
  static const String testDbUser = 'test_user';
  static const String testDbPassword = 'test_password_123';
  
  static bool get isTestMode => true;
}