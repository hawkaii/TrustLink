import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:trustlink/res/constants/buttom_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../config/test_credentials.dart';
import '../network/api_url/api_url.dart';
import '../res/builders/loader_builder.dart';
import '../view/auth/signup/signup_verification.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  static Future<dynamic> signUp({
    required String fullName,
    required String email,
    required String password,
    required String userName,
    required String birthday,
    required String profession,
    required BuildContext context,
  }) async {
    final loader = LoaderBuilder(context: context);
    try {
      loader.showLoader(title: "Signing up...");
      // Firebase email/password sign up
      final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      await cred.user?.updateDisplayName(fullName);
      // Bootstrap backend user via /me (GET) which triggers creation if missing
      try { await dio.get(ApiEndpoints.me); } catch (e) { log('Backend bootstrap failed: $e'); }
      loader.dismissLoader();
      Get.to(() => const SignupVerification());
      return cred.user;
    } on FirebaseAuthException catch (e) {
      loader.dismissLoader();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red, content: Text(e.message ?? 'Signup failed')));
    } catch (e) {
      loader.dismissLoader();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.red, content: Text('Unexpected signup error')));
    } finally {
      loader.dismissLoader();
    }
    return null;
  }


  static Future<dynamic> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    final loader = LoaderBuilder(context: context);

    try {
      loader.showLoader(title: "Login...");

      log("🔐 Starting login attempt");
      log("📧 Email: $email");

      if (ApiConstants.isUsingMockApi) {
        // Keep existing mock branch
      }

      // If needed, attempt Google sign-in path (placeholder example)
      // Uncomment for Google provider login instead of email/password.
      // final googleUser = await GoogleSignIn().signIn();
      // if (googleUser != null) {
      //   final googleAuth = await googleUser.authentication;
      //   final credential = GoogleAuthProvider.credential(
      //     idToken: googleAuth.idToken,
      //     accessToken: googleAuth.accessToken,
      //   );
      //   await FirebaseAuth.instance.signInWithCredential(credential);
      // }

      // Firebase email/password sign in
      final cred = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      // Call backend /me to ensure user is provisioned
      final me = await dio.get(ApiEndpoints.me);
      log("/me response: ${me.statusCode} ${me.data}");

      loader.dismissLoader();
      Get.offAll(() => const ButtonNavigation());
      return cred.user;
    } on FirebaseAuthException catch (e) {
      loader.dismissLoader();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red, content: Text(e.message ?? 'Login failed')));
    } on DioException catch (e) {
      loader.dismissLoader();
      String errorMessage = e.response?.data is Map && e.response?.data['error'] != null ? e.response?.data['error'] : 'Server error occurred';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red, content: Text(errorMessage)));
    } catch (e) {
      loader.dismissLoader();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.red, content: Text("An unexpected error occurred")));
    } finally {
      loader.dismissLoader();
    }
    return null;
  }


  static checkAuthStatus(String token) async {
    try {
      final response = await dio.get(
        ApiEndpoints.authStatus,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        log("Auth status checked: ${response.data}");
      } else {
        log("Error response: ${response.data}");
        throw Exception(
            response.data['message'] ?? "Failed to check auth status");
      }
    } on DioException catch (e) {
      log("Auth status check failed: $e");
      if (e.response != null && e.response?.data != null) {
        throw Exception(
            e.response?.data['message'] ?? "Failed to check auth status");
      }
      throw DioException(
        requestOptions: RequestOptions(path: ''),
        error: "Failed to check auth status",
      );
    } catch (e) {
      log("Unexpected error: $e");
      throw Exception("An unexpected error occurred: $e");
    }
  }
}
