import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trustlink/res/assets/image_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trustlink/res/extensions/media_query_extensions.dart';

import 'buttom_nav.dart';

class AchievementCard extends StatelessWidget {
  const AchievementCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(370, 322),
      builder: (_, __) => Scaffold(
        body: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Achievement Icon
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset(CustomImageAsset.star),
                    ),
                    SizedBox(width: 12.w),

                    // Text Content
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                          ),
                          children: [
                            TextSpan(
                              text: 'Archi Maze ',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const TextSpan(
                              text: 'has achieved ',
                            ),
                            const TextSpan(
                              text: 'a gold medal in Olympics',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),

                // Buttons Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _iconButton(Icons.thumb_up_alt_outlined, () {
                      // Handle like button
                    }),
                    SizedBox(width: 12.w),
                    _iconButton(Icons.more_horiz, () {
                      // Handle more options
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _iconButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(icon, color: Colors.black, size: 20.w),
      ),
    );
  }
}

class SaveDialog extends StatelessWidget {
  const SaveDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Container(
        width: 0.9.sw,
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Close button
            Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200],
                  ),
                  child: Icon(
                    Icons.close,
                    size: 20.sp,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            // Option 1: Save This Moment
            ListTile(
              leading: Icon(Icons.save_alt, color: Colors.teal, size: 28.sp),
              title: Text(
                "Save This Moment",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                // Add your save functionality here
                Navigator.of(context).pop();
              },
            ),
            // Option 2: Delete
            ListTile(
              leading: Icon(Icons.delete, color: Colors.teal, size: 28.sp),
              title: Text(
                "Delete",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                // Add your delete functionality here
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Home page share bottom sheet
class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Share",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: List.generate(8, (index) {
              return Column(
                children: [
                  CircleAvatar(
                    radius: width * 0.08,
                    backgroundImage:
                        const AssetImage(CustomImageAsset.splashScreenImg),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Ankit Patel",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              );
            }),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              Clipboard.setData(const ClipboardData(
                  text:
                      "https://www.trustlink.com/activity-195h3732h329/?p=activity"));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Link copied to clipboard!')),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Copy Link",
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(
                        Icons.copy,
                        color: Colors.grey[600],
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "https://www.trustlink.com/activity-195h3732h329/?p=activity",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildShareIcon(context, CustomImageAsset.whatsapp, 'WhatsApp'),
              _buildShareIcon(context, CustomImageAsset.messages, 'Messages'),
              _buildShareIcon(context, CustomImageAsset.threads, 'Threads'),
              _buildShareIcon(context, CustomImageAsset.facebook, 'Facebook'),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildShareIcon(BuildContext context, String iconPath, String label) {
    return Column(
      children: [
        SvgPicture.asset(
          iconPath,
          height: 32,
          width: 32,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

showShareBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    builder: (context) => const ShareBottomSheet(),
  );
}

/// Mention bottom sheet
class MentionedBottomSheet extends StatelessWidget {
  const MentionedBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: context.fullWidth * 0.30,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const Text(
            "These people are mentioned in this activity",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: width * 0.04,
            children: List.generate(4, (index) {
              return SizedBox(
                width: width * 0.2,
                child: const Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                        CustomImageAsset.splashScreenImg,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Archi Maze",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          SizedBox(
            height: context.fullHeight * 0.01,
          )
        ],
      ),
    );
  }
}

showMentionedBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    builder: (context) => const MentionedBottomSheet(),
  );
}

/// Delete Activity Dialog
showDeleteDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: Container(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Dialog Box Heading",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              Text(
                "Lorem Ipsum is a text for use in graphic in graphic. Lorem Ipsum is a text for use in graphic in graphic.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.offAll(const ButtonNavigation());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r))),
                    child: Text(
                      "Confirm",
                      style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.r)),
                      side: const BorderSide(color: Colors.grey),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: 14.sp, color: Colors.grey.shade700),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

/// information Dialog
void showSecondDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.grey.shade900,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: Container(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.person_outline,
                size: 40.w,
                color: Colors.teal.shade300,
              ),
              SizedBox(height: 16.h),
              Text(
                "Dialog Box Heading",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 10.h),
              Text(
                "Lorem Ipsum is a text for use in graphic in graphic. Lorem Ipsum is a text for use in graphic in graphic.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade500),
              ),
            ],
          ),
        ),
      );
    },
  );
}

/// More option alert dialog
class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  height: 4,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.edit, color: Colors.teal),
                  title: const Text(
                    "Edit activity",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.delete, color: Colors.teal),
                  title: const Text(
                    "Delete activity",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    showDeleteDialog(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.block, color: Colors.teal),
                  title: const Text(
                    "Block this user",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

void showCustomAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const CustomAlertDialog();
    },
  );
}
