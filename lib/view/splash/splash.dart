import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trustlink/res/constants/buttom_nav.dart';
import 'package:trustlink/res/extensions/media_query_extensions.dart';
import 'package:trustlink/res/extensions/widget_extensions.dart';
import '../../res/assets/image_assets.dart';
import '../onboarding/onboarding_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  Future<void> _checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 2));
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Get.offAll(() => const ButtonNavigation());
    } else {
      Get.offAll(() => const OnboardingPage());
    }
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
