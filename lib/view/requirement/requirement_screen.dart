import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienext/res/extensions/widget_extensions.dart';
import 'package:tienext/res/widgets/requirment_card.dart';
import 'package:tienext/view/requirement/requirement_owner_details.dart';
import '../../res/assets/image_assets.dart';
import '../../res/constants/colors.dart';
import '../../res/constants/string.dart';
import '../home_page/search_screen.dart';
import '../home_page/widgets/icon_widgets.dart';
import '../setting/setting_screen.dart';
import '../sharing/sharing_screen.dart';

class RequirementScreen extends StatelessWidget {
  final ScrollController scrollController;
  const RequirementScreen({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Image.asset(
            CustomImageAsset.splashScreenImg,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(SearchPage(scrollController: scrollController));
              },
              child: const AppIcons(
                imagePath: CustomImageAsset.search,
                showBorder: true,
                size: 16,
              ),
            ),
            const AppIcons(
                imagePath: CustomImageAsset.bellIcon,
                showBorder: true,
                size: 16),
            GestureDetector(
              onTap: () {
                Get.to(const SettingsScreen());
              },
              child: const AppIcons(
                  imagePath: CustomImageAsset.menu, showBorder: true, size: 16),
            ),
          ],
        ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    kRequirements,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16.0),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return RequirementCard(
                    screenWidth: screenWidth,
                  );
                },
              ),
            ],
          ),
        ));
  }
}
