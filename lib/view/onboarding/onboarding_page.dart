import 'package:flutter/material.dart';
import 'package:trustlink/res/extensions/int_extensions.dart';
import 'package:trustlink/res/extensions/widget_extensions.dart';
import 'package:trustlink/view/auth/login/login_page.dart';
import 'package:trustlink/view/auth/signup/signup_1.dart';
import 'package:trustlink/view/onboarding/widget/button_widget.dart';
import '../../res/assets/image_assets.dart';
import '../../res/constants/colors.dart';
import '../../res/constants/string.dart';
import '../../res/constants/text_theme.dart';
import '../../res/extensions/media_query_extensions.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(CustomImageAsset.onBoardingBgImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: context.fullHeight * 0.40,
              width: context.fullWidth,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  20.height,
                  const Text(
                    kWhatsBuddy,
                    style: AppTextTheme.displayMediumAlt,
                  ),
                  const Text(
                    kLetsPrepared,
                    style: AppTextTheme.bodyLargebold,
                  ),
                  40.height,
                  onBoardingBtn(
                    context: context,
                    text: kSignup,
                    color: AppColors.onBoardingBtnColor2,
                    onTap: () => const SignUpScreen1().getPush(),
                  ),
                  20.height,
                  onBoardingBtn(
                    context: context,
                    text: kLogin,
                    color: AppColors.black,
                    textColor: AppColors.white,
                    onTap: () => const LoginScreen().getPush(),
                  ),
                ],
              ).paddingSymmetric(horizontal: 16),
            ),
          ),
        ],
      ),
    );
  }
}
