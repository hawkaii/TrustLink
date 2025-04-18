import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ChangePasswordController extends GetxController {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Observable variables for validation and visibility
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var validationMessage = ''.obs;

  void updatePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

   updateConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  bool validatePasswords() {
    if (newPasswordController.text.isEmpty || confirmPasswordController.text.isEmpty) {
      validationMessage.value = "Password fields cannot be empty.";
      return false;
    }
    if (newPasswordController.text != confirmPasswordController.text) {
      validationMessage.value = "Passwords do not match.";
      return false;
    }
    return true;
  }
}
