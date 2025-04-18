import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienext/res/extensions/media_query_extensions.dart';

import '../../../res/assets/image_assets.dart';
import '../../../res/constants/colors.dart';
import '../../../res/constants/string.dart';
import '../../../res/constants/text_theme.dart';
import '../../../res/widgets/custom_button_widget.dart';
import '../../home_page/interested_screen.dart';


class SignupVerification extends StatefulWidget {
  const SignupVerification({super.key});

  @override
  State<SignupVerification> createState() => _SignupVerificationState();
}

class _SignupVerificationState extends State<SignupVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.fullWidth * 0.1),
          child: Column(
            children: [
              SizedBox(height: context.fullHeight * 0.08),
              Image.asset(
                CustomImageAsset.logoTieNextImage,
                fit: BoxFit.contain,
              ),
              SizedBox(height: context.fullHeight * 0.04),
              const Text("Please verify", style: AppTextTheme.displayMediumAlt),
              const Text(
                  "Please check your email for verification \n      link. click on link for verification",
                  style: AppTextTheme.bodyMediumAltblack),
              SizedBox(height: context.fullHeight * 0.2),
              CustomButton(
                text: kFinish,
                onPressed: () {
                  Get.to(InterestsScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
