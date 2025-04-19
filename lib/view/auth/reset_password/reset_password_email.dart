import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trustlink/res/extensions/media_query_extensions.dart';
import 'package:trustlink/res/extensions/validation_extensions.dart';
import 'package:trustlink/view/auth/reset_password/reset_password_phone.dart';
import 'package:trustlink/view/auth/signup/phone_otp_screen.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/constants/colors.dart';
import '../../../res/constants/string.dart';
import '../../../res/constants/text_theme.dart';
import '../../../res/widgets/custom_button_widget.dart';
import '../../../res/widgets/custom_text_field.dart';

class ResetPasswordEmail extends StatefulWidget {
  const ResetPasswordEmail({super.key});

  @override
  State<ResetPasswordEmail> createState() => _ResetPasswordEmailState();
}

class _ResetPasswordEmailState extends State<ResetPasswordEmail> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.08),
              Image.asset(
                height: context.fullHeight * 0.06,
                CustomImageAsset.logotrustlinkImage,
                fit: BoxFit.contain,
              ),
              SizedBox(height: context.fullHeight * 0.03),
              const Text(kWhatsUrEmail, style: AppTextTheme.displayMediumAlt),
              const Text(kEmailResetPass,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Albert Sans',
                    color: AppColors.black,
                  )),
              SizedBox(height: context.fullHeight * 0.03),
              CustomTextField(
                controller: emailController,
                hintText: kEmail,
              ),
              SizedBox(height: context.fullHeight * 0.02),
              GestureDetector(
                onTap: () {
                  Get.to(const ResetPasswordPhone());
                },
                child: const Text.rich(
                  TextSpan(
                    text: kDontRecall,
                    style: AppTextTheme.bodyMediumbold,
                    children: [
                      TextSpan(
                        text: kTryWithPhone,
                        style: AppTextTheme.createLogin,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: context.fullHeight * 0.07),
              CustomButton(
                text: kNext,
                onPressed: () {
                  if (emailController.text.isEmpty) {
                    "Email is required".showToast();
                    return;
                  }
                  final emailError = emailController.text.emailValidator();
                  if (emailError != null) {
                    emailError.showToast();
                    return;
                  }

                  // If valid, move to the next screen (ChangePassword)
                  Get.to(const OTPScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
