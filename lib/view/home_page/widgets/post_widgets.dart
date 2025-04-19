import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trustlink/res/assets/image_assets.dart';
import 'package:trustlink/res/extensions/media_query_extensions.dart';
import 'package:trustlink/res/extensions/widget_extensions.dart';
import '../../../models/home/user_model.dart';
import '../../../res/helpers/dialog_helper.dart';
import '../../../res/constants/custom_dialog.dart';
import '../../profile/user_profile/user_profile_page.dart';
import 'icon_widgets.dart';

class UserPost extends StatelessWidget {
  final ScrollController scrollController;
  final Post post;

  const UserPost(
      {super.key, required this.post, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 5.0), // Adjust padding here
          leading: GestureDetector(
            onTap: () {
              Get.to(
                UserProfilePage(scrollController: scrollController),
              );
            },
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.shade300,
              child: Image.asset(post.profileImage),
            ),
          ),
          title: GestureDetector(
            onTap: () {
              Get.to(UserProfilePage(scrollController: scrollController));
            },
            child: Text(post.username),
          ),
          subtitle: Text(post.time),
          trailing: const AppIcons(
            imagePath: CustomImageAsset.personAdd,
            showBorder: false,
            size: 25,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(post.description),
        ),
        const SizedBox(height: 8),
        Image.asset(
          post.postImg,
          fit: BoxFit.fill,
          width: double.infinity,
          height: context.fullHeight * 0.4,
        ),
        SizedBox(height: context.fullHeight * 0.01),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                CustomImageAsset.likeSvg,
                height: 30,
                width: 30,
              ),
              GestureDetector(
                onTap: () {
                  AppDialogHelper().showCommentsSheet(context);
                },
                child: SvgPicture.asset(
                  CustomImageAsset.chatSvg,
                  height: 32,
                  width: 30,
                ),
              ),
              GestureDetector(
                onTap: () {
                  showShareBottomSheet(context);
                },
                child: SvgPicture.asset(
                  CustomImageAsset.sendSvg,
                  height: 31,
                  width: 30,
                ),
              ),
              SvgPicture.asset(
                CustomImageAsset.linkSvg,
                height: 30,
                width: 30,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(showMentionedBottomSheet(context));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: SvgPicture.asset(
                    CustomImageAsset.userBoxSvg,
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              const Icon(Icons.more_horiz).onTap(
                () {
                  showCustomAlertDialog(context);
                },
              ),
            ],
          ),
        ),
        SizedBox(height: context.fullHeight * 0.01),
      ],
    );
  }
}
