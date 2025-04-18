import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienext/res/extensions/int_extensions.dart';
import 'package:tienext/res/extensions/media_query_extensions.dart';

import '../../res/assets/image_assets.dart';
import '../../res/constants/colors.dart';

class MonetizationScreen extends StatefulWidget {
  const MonetizationScreen({super.key});

  @override
  State<MonetizationScreen> createState() => _MonetizationScreenState();
}

class _MonetizationScreenState extends State<MonetizationScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Monetization")),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: context.fullHeight * 0.3,
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage(
                        CustomImageAsset.monetization,
                      ),
                      fit: BoxFit.cover)),
            ),
            SizedBox(height: context.fullHeight * 0.01),
            const Text(
              textAlign: TextAlign.center,
              "Tienext 68 days monetization challenge let’s you find your",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const Text(
                "strength by posting an activity daily for 68 consecutive days",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
            const Text(
                "and at the 69th day you will monetized with your strengths in",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
            const Text("your mind.",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
            SizedBox(height: context.fullHeight * 0.02),
            const Text("Not Everybody Gets The",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: AppColors.black)),
            const Text("Chance",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    color: AppColors.onBoardingBtnColor2)),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100, top: 36),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Join Waiting List',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            10.height,
            const Align(
                alignment: Alignment.center,
                child: Text(
                    "All slots are filled, join the waiting\n list to be next bright achievers"))
          ],
        ),
      ),
    );
  }
}
