import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:trustlink/res/constants/string.dart';
import 'package:trustlink/res/extensions/media_query_extensions.dart';
import 'package:trustlink/res/extensions/validation_extensions.dart';
import 'package:trustlink/res/extensions/widget_extensions.dart';
import 'package:trustlink/view/auth/reset_password/reset_password_email.dart';
import 'package:trustlink/view/auth/signup/signup_1.dart';
import '../../../provider/auth_provider.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/constants/text_theme.dart';
import '../../../res/widgets/custom_button_widget.dart';
import '../../../res/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.fullWidth * 0.08),
          child: Column(
            children: [
              SizedBox(height: context.fullHeight * 0.08),
              Image.asset(
                height: context.fullHeight * 0.06,
                CustomImageAsset.logotrustlinkImage,
                fit: BoxFit.contain,
              ),
              SizedBox(height: context.fullHeight * 0.04),
              const Text(kWelcomeBack, style: AppTextTheme.displayMediumAlt),
              const Text(kLetsMission, style: AppTextTheme.authtextreq),
              SizedBox(height: context.fullHeight * 0.03),
              Column(
                children: [
                  CustomTextField(
                    controller: emailController,
                    hintText: kEnterPhone,
                  ),
                  SizedBox(height: context.fullHeight * 0.01),
                  Consumer<AuthProvider>(
                    builder: (context, authProvider, child) {
                      return CustomTextField(
                        controller: passwordController,
                        hintText: kPassword,
                        obscureText: !authProvider.isPasswordVisible,
                        suffixIcon: IconButton(
                          icon: Icon(authProvider.isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: authProvider.togglePasswordVisibility,
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: context.fullHeight * 0.02),
              const Text(kForgetPass, style: AppTextTheme.forgotPassword).onTap(
                () => Get.to(const ResetPasswordEmail()),
              ),
              SizedBox(height: context.fullHeight * 0.032),
              CustomButton(
                text: kLogin,
                onPressed: () async {
                  log("api called");
                  if (emailController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    "All fields are required".showToast();
                    return;
                  }
                  try {
                    await AuthProvider.login(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                      context: context,
                    );
                  } catch (e) {
                    log("Error during signIn: $e");
                  }
                },
              ),
              SizedBox(height: context.fullHeight * 0.04),
              GestureDetector(
                onTap: () {
                  Get.to(const SignUpScreen1());
                },
                child: const Text.rich(
                  TextSpan(
                    text: kDontHaveAccount,
                    style: AppTextTheme.bodyMediumbold,
                    children: [
                      TextSpan(
                        text: kCreateAccount,
                        style: AppTextTheme.createLogin,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
