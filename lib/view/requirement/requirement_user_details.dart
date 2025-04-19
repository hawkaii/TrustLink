import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trustlink/res/extensions/media_query_extensions.dart';
import '../../res/assets/image_assets.dart';
import '../../res/constants/colors.dart';
import '../../res/constants/string.dart';
import '../../res/widgets/custom_button_widget.dart';
import '../home_page/widgets/icon_widgets.dart';

class RequirementUserDetails extends StatelessWidget {
  const RequirementUserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Requirement Details'),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  AppIcons(
                    imagePath: CustomImageAsset.sendSvg,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightWhite,
                      border: Border.all(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Container(
                            height: context.fullHeight * 0.16,
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: AppColors.grey200,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Searching for the profession',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(height: context.fullHeight * 0.005),
                                const Text(
                                  'Cinematographer',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: context.fullHeight * 0.005),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on,
                                        size: 18, color: AppColors.black),
                                    SizedBox(width: context.fullWidth * 0.01),
                                    const Text(
                                      'Noida, Sector-18, Delhi, India',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: context.fullHeight * 0.01),
                                const Row(
                                  children: [
                                    Icon(Icons.calendar_today,
                                        size: 18, color: Colors.black54),
                                    SizedBox(width: 4),
                                    Text(
                                      '25/11/24',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Details Section
                          const Padding(
                            padding: EdgeInsets.only(right: 20, top: 10),
                            child: Text(
                              'Searching for a cinematographer in urgent\n basis!!',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Details:',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(kGenerated),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: context.fullHeight * 0.03),
                  // Posted By Section
                  Card(
                    elevation: 0,
                    color: AppColors.grey200,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: context.fullHeight * 0.03,
                          backgroundColor: Colors.grey[300],
                          child: const Icon(Icons.person,
                              size: 24, color: Colors.white),
                        ),
                        const SizedBox(width: 12),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Archi Maze',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Entrepreneur',
                              style: TextStyle(
                                  fontSize: 14, color: AppColors.black),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Noida, Sector-18...',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black54),
                            ),
                          ],
                        ),
                      ],
                    ).paddingAll(10),
                  ),
                  SizedBox(height: context.fullHeight * 0.03),
                  Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                      text: "Apply",
                      backgroundColor: AppColors.onBoardingBtnColor2,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
