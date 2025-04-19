import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trustlink/res/constants/buttom_nav.dart';
import '../network/api_url/api_url.dart';
import '../res/builders/loader_builder.dart';
import '../view/auth/signup/signup_verification.dart';

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
      Map<String, dynamic> data = {
        "username": userName,
        "password": password,
        "fullName": fullName,
        "email": email,
        "profession": profession,
        "birthday": birthday
      };
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      final response = await dio.post(
        ApiEndpoints.signUp,
        data: data,
        options: Options(headers: headers),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        loader.dismissLoader();
        log("Response data : ${response.data}");
        Get.to(() => const SignupVerification());
        return response;
      }
    } on DioException catch (e) {
      loader.dismissLoader();
      log("SignUp Failed $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(e.response?.data["message"] ?? "An error occurred"),
      ));
    } catch (e) {
      loader.dismissLoader();
      log("Unexpected error during signup: $e");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text("An unexpected error occurred"),
      ));
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
      Map<String, dynamic> data = {
        "identifier": email,
        "password": password,
      };
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      final response = await dio.post(
        ApiEndpoints.signIn,
        data: data,
        options: Options(headers: headers),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        loader.dismissLoader();
        log("Response data : ${response.data}");
        Get.offAll(() => const ButtonNavigation());
        return response;
      }
    } on DioException catch (e) {
      loader.dismissLoader();
      log("Login Failed $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(e.response?.data["message"] ?? "An error occurred"),
      ));
    } catch (e) {
      loader.dismissLoader();
      log("Unexpected error during login: $e");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text("An unexpected error occurred"),
      ));
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
