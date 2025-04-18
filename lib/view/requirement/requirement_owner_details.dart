import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienext/res/extensions/media_query_extensions.dart';
import '../../res/assets/image_assets.dart';
import '../../res/constants/colors.dart';
import '../../res/constants/string.dart';
import '../home_page/widgets/icon_widgets.dart';
import '../profile/my_profile/my_profile.dart';

class RequirementOwnerDetails extends StatelessWidget {
  const RequirementOwnerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Requirement Details'),
        centerTitle: true,
        backgroundColor: Colors.white,
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 4),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const AppIcons(
                      imagePath: CustomImageAsset.delete,
                      size: 17,
                    ),
                  ),
                  const AppIcons(
                    imagePath: CustomImageAsset.sendSvg,
                    size: 17,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 3),
                      child: Text(
                        "Fulfilled",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.grey200,
                        borderRadius: BorderRadius.circular(5)),
                  )
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
                      border: Border.all(color: AppColors.grey200, width: 1),
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
                              color: Color(0xffD8D8D8),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Searching for the profession',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'Cinematographer',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on,
                                        size: 18, color: AppColors.black),
                                    SizedBox(width: context.fullWidth * 0.01),
                                    const Text(
                                      'Noida, Sector-18, Delhi, India',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
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
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Details Section
                          const Padding(
                            padding: EdgeInsets.only(right: 5, top: 10),
                            child: Text(
                              'Searching for a cinematographer in urgent basis!!',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(
                              top: context.fullHeight * 0.01,
                              right: 284,
                            ),
                            child: const Text(
                              'Details:',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const Text(
                            kGenerated,
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      "Posted By",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // Posted By Section
                  GestureDetector(
                    onTap: () {
                      Get.to(const MyProfilePage());
                    },
                    child: Card(
                      elevation: 0,
                      color: Color(0xffF0F0F0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.grey[300],
                            child: const Icon(Icons.person,
                                size: 24, color: Colors.white),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Archi Maze',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.shopping_bag_rounded,
                                      size: 18, color: AppColors.black),
                                  SizedBox(width: context.fullWidth * 0.01),
                                  const Text(
                                    'Entrepreneur',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.location_on,
                                      size: 18, color: AppColors.black),
                                  SizedBox(width: context.fullWidth * 0.01),
                                  const Text(
                                    'Noida, Sector-18, Delhi, India',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ).paddingAll(10),
                    ),
                  ),
                  const SizedBox(height: 24),

                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: context.fullHeight * 0.05,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'Mark as fulfilled',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: context.fullHeight * 0.05,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'View Application',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
