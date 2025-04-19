import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trustlink/res/constants/colors.dart';
import 'package:trustlink/res/extensions/media_query_extensions.dart';
import 'package:trustlink/res/extensions/widget_extensions.dart';
import 'package:trustlink/res/widgets/requirment_card.dart';
import 'package:trustlink/view/chat_screen/chat_list_page.dart';
import 'package:trustlink/view/profile/user_profile/widgets/moments_item.dart';
import 'package:trustlink/view/requirement/requirement_screen.dart';
import '../../../models/home/user_model.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/constants/custom_dialog.dart';
import '../../../res/constants/string.dart';
import '../../../res/helpers/dialog_helper.dart';
import '../../home_page/widgets/icon_widgets.dart';
import '../../requirement/requirement_owner_details.dart';
import '../../sharing/sharing_screen.dart';
import '../timiline_components.dart';

class UserProfilePage extends StatefulWidget {
  final ScrollController scrollController;
  const UserProfilePage({super.key, required this.scrollController});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late Future<List<Post>> _postsFuture;

  @override
  void initState() {
    super.initState();
    _postsFuture = fetchPosts();
  }

  Future<List<Post>> fetchPosts() async {
    return [
      Post(
        username: 'Christopher Nolan',
        time: 'Just a moment ago',
        postImg: CustomImageAsset.back,
        profileImage: CustomImageAsset.thumb,
        description: 'Dynamic post from backend!',
      ),
      Post(
        username: 'Ankit Patel',
        profileImage: CustomImageAsset.splashScreenImg,
        time: '5 minutes ago',
        description: 'Learning Flutter, it’s awesome.',
        postImg: CustomImageAsset.splashScreenImg,
      ),
      Post(
        username: 'Anurag Singh',
        profileImage: CustomImageAsset.star,
        time: '15 minutes ago',
        description: 'Learning Flutter, it’s awesome.',
        postImg: CustomImageAsset.dynamic,
      ),
      Post(
        username: 'Archi',
        profileImage: CustomImageAsset.splashScreenImg,
        time: '5 minutes ago',
        description: 'Learning Android, it’s awesome.',
        postImg: CustomImageAsset.splashScreenImg,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: widget.scrollController,
          child: Column(
            children: [
              Stack(
                children: [
                  // Background image
                  Container(
                    width: context.fullWidth,
                    height: context.fullHeight * 0.27 + 2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          CustomImageAsset.mountains,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Grey overlay with high opacity
                  Container(
                    width: context.fullWidth,
                    height: context.fullHeight * 0.27 + 2,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(255, 255, 255, 0.6), // Start color
                          Color.fromRGBO(177, 177, 177, 0.6), // Middle color
                          Color.fromRGBO(0, 0, 0, 0.6), // End color
                        ],
                        stops: [0.0, 0.031, 0.9999], // Gradient stops
                      ),
                    ),
                  ),
                  // Main content
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(
                                  CustomImageAsset.splashScreenImg,
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 48,
                                    width: 72,
                                    child: Card(
                                      margin: const EdgeInsets.all(0),
                                      child: Column(
                                        children: [
                                          Text(
                                            '50K',
                                            style: GoogleFonts.inter(
                                              fontSize: 18,
                                              letterSpacing: -0.5,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'Followings',
                                            style: GoogleFonts.inter(
                                              letterSpacing: -0.5,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  SizedBox(
                                    height: 48,
                                    width: 72,
                                    child: Card(
                                      margin: const EdgeInsets.all(0),
                                      child: Column(
                                        children: [
                                          Text(
                                            '1M',
                                            style: GoogleFonts.inter(
                                              fontSize: 18,
                                              letterSpacing: -0.5,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'Followers',
                                            style: GoogleFonts.inter(
                                              letterSpacing: -0.5,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  IconButton(
                                    style: IconButton.styleFrom(
                                      minimumSize: const Size(30, 30),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor: Colors.white,
                                      padding: EdgeInsets.zero,
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down_circle_outlined,
                                      size: 18,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // Name
                          Text(
                            'Ankit Patel',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),

                          Text(
                            'Id:- patel.ankit_07',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(181, 0, 0, 1),
                            ),
                          ),
                          SizedBox(height: context.fullHeight * 0.01),

                          Row(
                            children: [
                              const Icon(
                                Icons.work,
                                color: Colors.white,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Flutter Developer',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Patna,Bihar(Saran)',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Column(
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(57, 210, 192, 1),
                            minimumSize: const Size(87, 28),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            elevation: 2,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                          ),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.person_add_alt_1,
                            size: 16,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Follow',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            minimumSize: const Size(87, 28),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            elevation: 2,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatListScreen(
                                    scrollController: widget.scrollController,
                                  ),
                                ));
                          },
                          icon: const Icon(
                            Icons.chat_rounded,
                            size: 16,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Message',
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 3),
                child: Column(
                  children: [
                    MomentsSection(),
                    ActivitiesSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MomentsSection extends StatefulWidget {
  const MomentsSection({super.key});

  @override
  _MomentsSectionState createState() => _MomentsSectionState();
}

class _MomentsSectionState extends State<MomentsSection> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
            style: TextButton.styleFrom(
                padding: const EdgeInsets.all(0.0),
                backgroundColor: AppColors.gray100,
                minimumSize: const Size(160, 39),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
            onPressed: () {},
            child: Text(
              "Attached link \nhttp://muziplex.com/re...",
              style:
                  GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 12),
            )),
        Row(
          children: [
            Text(
              'Moments',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.5,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 10),
            Row(
              children: [
                TabButton(
                  text: "Today's",
                  isSelected: _selectedTab == 0,
                  onPressed: () {
                    setState(() {
                      _selectedTab = 0;
                    });
                  },
                ),
                const SizedBox(width: 8),
                TabButton(
                  text: "Saved",
                  isSelected: _selectedTab == 1,
                  onPressed: () {
                    setState(() {
                      _selectedTab = 1;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        _selectedTab == 0 ? buildTodayMoments() : _buildSavedMoments(),
      ],
    );
  }

  Widget buildTodayMoments() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          momentItem(CustomImageAsset.splashScreenImg, CustomImageAsset.star),
          momentItem(
              CustomImageAsset.splashScreenImg, CustomImageAsset.heartyMoment),
          momentItem(CustomImageAsset.splashScreenImg, CustomImageAsset.thumb),
          momentItem(
              CustomImageAsset.splashScreenImg, CustomImageAsset.questionMark),
          momentItem(
              CustomImageAsset.splashScreenImg, CustomImageAsset.onePlus),
          momentItem(
              CustomImageAsset.splashScreenImg, CustomImageAsset.namaste),
        ],
      ),
    );
  }

  Widget _buildSavedMoments() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          momentItem(CustomImageAsset.splashScreenImg, CustomImageAsset.star),
          momentItem(
              CustomImageAsset.splashScreenImg, CustomImageAsset.onePlus),
          momentItem(CustomImageAsset.splashScreenImg, CustomImageAsset.thumb),
        ],
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const TabButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(63, 33),
        backgroundColor: isSelected ? Colors.black : Colors.white,
        // Background color
        elevation: 0,
        // Remove shadow for a flat appearance
        side: BorderSide(
          color: isSelected ? Colors.black : Colors.grey[300]!,
          width: isSelected ? 0 : 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
          color: isSelected ? Colors.white : Colors.black, // Text color
        ),
      ),
    );
  }
}

// Activities Section
class ActivitiesSection extends StatefulWidget {
  const ActivitiesSection({super.key});

  @override
  _ActivitiesSectionState createState() => _ActivitiesSectionState();
}

class _ActivitiesSectionState extends State<ActivitiesSection> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tabs
        Row(
          children: [
            TabButton(
              text: "Activities",
              isSelected: _selectedTab == 0,
              onPressed: () {
                setState(() {
                  _selectedTab = 0;
                });
              },
            ),
            const SizedBox(width: 8),
            TabButton(
              text: "Requirements",
              isSelected: _selectedTab == 1,
              onPressed: () {
                setState(() {
                  _selectedTab = 1;
                });
              },
            ),
            const SizedBox(width: 8),
            TabButton(
              text: "About",
              isSelected: _selectedTab == 2,
              onPressed: () {
                setState(() {
                  _selectedTab = 2;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 16),
        _selectedTab == 0
            ? _buildActivities()
            : _selectedTab == 1
                ? _buildRequirements()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Experiences",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black, // Text color
                          ),
                        ),
                        const TimelineComponent(
                          isFirst: true,
                          isCompleted: true,
                          text: 'Mar 1,2022 -> Mar 1,2024',
                          description:
                              'The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
                        ),
                        const TimelineComponent(
                          isCompleted: true,
                          text: 'Preparing',
                          description:
                              'The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
                        ),
                      ],
                    ),
                  ),
      ],
    );
  }

  // Activities Content
  Widget _buildActivities() {
    return Column(
      children: [
        _buildActivityItem(
          profileImage: CustomImageAsset.splashScreenImg,
          username: 'Archi Maze',
          time: '4 hours ago',
          postImg: CustomImageAsset.splashScreenImg,
          description: 'This is a sample activity description.',
        ),
        _buildActivityItem(
          profileImage: CustomImageAsset.splashScreenImg,
          username: 'Ankit Patel',
          time: '6 hours ago',
          description: 'This is another sample activity description.',
          postImg: CustomImageAsset.splashScreenImg,
        ),
      ],
    );
  }

  Widget _buildActivityItem({
    required String profileImage,
    required String username,
    required String time,
    required String description,
    required String postImg,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(profileImage),
                radius: 25,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        letterSpacing: -0.5,
                        color: Colors.black),
                  ),
                  Text(
                    time,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        letterSpacing: -0.5,
                        color: const Color.fromRGBO(79, 79, 79, 1)),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: context.fullHeight * 0.01),
          Text(
            description,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                letterSpacing: -0.5,
                color: const Color.fromRGBO(0, 0, 0, 1)),
          ),
          SizedBox(height: context.fullHeight * 0.01),
          SizedBox(
            height: context.fullHeight * 0.4,
            width: context.fullWidth * 1,
            child: Image.asset(
              postImg,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Row(
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
          SizedBox(height: context.fullHeight * 0.01),
        ],
      ),
    );
  }
}

Widget _buildRequirements() {
  return const Column(
    children: [
      RequirementCard(
        screenWidth: BorderSide.strokeAlignCenter,
      ),
      RequirementCard(
        screenWidth: BorderSide.strokeAlignCenter,
      ),
      RequirementCard(
        screenWidth: BorderSide.strokeAlignCenter,
      ),
      // BuildRequirementsItems(),
      // BuildRequirementsItems(),
    ],
  );
}

class BuildRequirementsItems extends StatelessWidget {
  const BuildRequirementsItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey[100]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                    child: Image.asset(CustomImageAsset.splashScreenImg)
                    // radius: 24,
                    // backgroundImage: NetworkImage(
                    //   "https://via.placeholder.com/150",
                    // ),
                    ),
                const SizedBox(width: 12),
                const Expanded(
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
                          color: Colors.grey,
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
                Icon(Icons.location_on, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text(
                  "Noida, Sector-18",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Spacer(),
                Icon(Icons.work_outline, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text(
                  "Cinematographer",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Spacer(),
                Icon(Icons.calendar_today_outlined,
                    size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text(
                  "25/11/24",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
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
                    //Get.to(SharingScreen());
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: AppIcons(
                      imagePath: CustomImageAsset.sendSvg,
                      size: 20,
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
    );
  }
}
