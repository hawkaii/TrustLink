import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trustlink/res/extensions/media_query_extensions.dart';
import 'package:trustlink/view/auth/reset_password/reset_password_email.dart';
import 'package:trustlink/view/auth/signup/phone_otp_screen.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/constants/colors.dart';
import '../../../res/constants/string.dart';
import '../../../res/constants/text_theme.dart';
import '../../../res/widgets/custom_button_widget.dart';
import '../../../res/widgets/custom_text_field.dart';

class ResetPasswordPhone extends StatefulWidget {
  const ResetPasswordPhone({super.key});

  @override
  State<ResetPasswordPhone> createState() => _ResetPasswordPhoneState();
}

class _ResetPasswordPhoneState extends State<ResetPasswordPhone> {
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
              SizedBox(height: context.fullHeight * 0.08),
              Image.asset(
                height: context.fullHeight * 0.06,
                CustomImageAsset.logotrustlinkImage,
                fit: BoxFit.contain,
              ),
              SizedBox(height: context.fullHeight * 0.03),
              const Text(kWhatsUrPhone, style: AppTextTheme.displayMediumAlt),
              const Text(kPhoneResetPass,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Albert Sans',
                    color: AppColors.black,
                  )),
              SizedBox(height: context.fullHeight * 0.03),
              const CustomTextField(
                hintText: kPhone,
              ),
              SizedBox(height: context.fullHeight * 0.02),
              GestureDetector(
                onTap: () {
                  Get.to(const ResetPasswordEmail());
                },
                child: const Text.rich(
                  TextSpan(
                    text: kDontRecall,
                    style: AppTextTheme.bodyMediumbold,
                    children: [
                      TextSpan(
                        text: kTryWithEmail,
                        style: AppTextTheme.createLogin,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: context.fullHeight * 0.07),
              CustomButton(
                text: kNext,
                fontSize: 22,
                onPressed: () {
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
