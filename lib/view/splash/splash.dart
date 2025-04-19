import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trustlink/res/extensions/media_query_extensions.dart';
import 'package:trustlink/res/extensions/widget_extensions.dart';
import '../../res/assets/image_assets.dart';
import '../onboarding/onboarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => const OnboardingPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        CustomImageAsset.splashScreenImg,
        height: context.fullHeight * 0.2,
      ).center(),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:trustlink/res/constants/buttom_nav.dart';
// import 'package:trustlink/res/extensions/media_query_extensions.dart';
// import 'package:trustlink/res/extensions/widget_extensions.dart';
// import '../../provider/auth_provider.dart';
// import '../../res/assets/image_assets.dart';
// import '../onboarding/onboarding_page.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     checkAuthStatus();
//   }
//
//   Future<void> checkAuthStatus() async {
//     try {
//       await Future.delayed(const Duration(seconds: 2));
//       const String token = "your_token_here";
//       await AuthProvider.checkAuthStatus(token);
//       Get.offAll(() =>  const ButtonNavigation());
//     } catch (e) {
//       Get.offAll(() => const OnboardingPage());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Image.asset(
//         CustomImageAsset.splashScreenImg,
//         height: context.fullHeight * 0.2,
//       ).center(),
//     );
//   }
// }
