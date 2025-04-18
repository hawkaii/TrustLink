import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tienext/res/assets/image_assets.dart';
import 'package:tienext/res/constants/colors.dart';
import 'package:tienext/res/constants/string.dart';
import 'package:tienext/res/extensions/widget_extensions.dart';
import 'package:tienext/view/home_page/widgets/icon_widgets.dart';
import 'package:tienext/view/requirement/requirement_owner_details.dart';

class RequirementCard extends StatelessWidget {
  final double screenWidth;

  const RequirementCard({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xffECEEF1)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(
                      "https://via.placeholder.com/150",
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Searching for a cinematographer in urgent basis!!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Posted by Archi",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff797979),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Icon(Icons.location_on, size: 16, color: Color(0xff797979)),
                  SizedBox(width: 4),
                  Text(
                    "Noida, Sector-18",
                    style: TextStyle(fontSize: 12, color: Color(0xff797979)),
                  ),
                  Spacer(),
                  Icon(Icons.work_outline, size: 16, color: Color(0xff797979)),
                  SizedBox(width: 4),
                  Text(
                    "Cinematographer",
                    style: TextStyle(fontSize: 12, color: Color(0xff797979)),
                  ),
                  Spacer(),
                  Icon(Icons.calendar_today_outlined,
                      size: 16, color: Color(0xff797979)),
                  SizedBox(width: 4),
                  Text(
                    "25/11/24",
                    style: TextStyle(fontSize: 12, color: Color(0xff797979)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "Applied",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "Fulfilled",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      //Get.to( SharingScreen());
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: AppIcons(
                        imagePath: CustomImageAsset.sendSvg,
                        size: 14,
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.onBoardingBtnColor2,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      kView,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ).onTap(
                    () => Get.to(const RequirementOwnerDetails()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
