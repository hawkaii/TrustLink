import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tienext/res/constants/colors.dart';
import 'package:tienext/res/extensions/widget_extensions.dart';
import 'package:tienext/view/setting/setting_screen.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/constants/custom_dialog.dart';
import '../../../res/constants/string.dart';
import '../../home_page/comment_screen.dart';
import '../../home_page/widgets/icon_widgets.dart';
import '../../requirement/requirement_owner_details.dart';
import '../timiline_components.dart';
import 'package:tienext/res/extensions/media_query_extensions.dart';
import 'my_profile_edit.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({
    super.key,
  });

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                          'assets/images/mountains.png',
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
                          Color.fromRGBO(0, 0, 0, 0.5), // End color
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
                                radius: 45,
                                backgroundImage:
                                    AssetImage('assets/images/archi.png'),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 42,
                                    width: 62,
                                    child: Card(
                                      color: Colors.white,
                                      margin: const EdgeInsets.all(0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '100K',
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                              letterSpacing: -0.5,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'Followings',
                                            style: GoogleFonts.inter(
                                              letterSpacing: -0.5,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  SizedBox(
                                    height: 42,
                                    width: 62,
                                    child: Card(
                                      color: Colors.white,
                                      margin: const EdgeInsets.all(0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '100K',
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                              letterSpacing: -0.5,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'Followers',
                                            style: GoogleFonts.inter(
                                              letterSpacing: -0.5,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  IconButton(
                                    style: IconButton.styleFrom(
                                      minimumSize: const Size(35, 35),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor: Colors.white,
                                      padding: EdgeInsets.zero,
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down_circle_outlined,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      Get.to(const SettingsScreen());
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // Name
                          Text(
                            'Cristopher Nolen',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),

                          Text(
                            '@cristopher_23',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(181, 0, 0, 1),
                            ),
                          ),
                          const SizedBox(height: 12),

                          Row(
                            children: [
                              const Icon(
                                Icons.work,
                                color: Colors.white,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Entrepreneur',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
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
                                'New York, USA',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
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
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: const Size(101, 33),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 2,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyProfileEdit()));
                      },
                      icon: const Icon(
                        Icons.edit,
                        size: 16,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Edit Profile',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    MomentsSection(),
                    SizedBox(
                      height: 10,
                    ),
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

// Moments Section
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
        const SizedBox(
          height: 10,
        ),
        // Heading and Tabs
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
        const SizedBox(height: 10),
        _selectedTab == 0 ? _buildTodayMoments() : _buildSavedMoments(),
      ],
    );
  }

  Widget _buildTodayMoments() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildMomentItem(
              CustomImageAsset.splashScreenImg, CustomImageAsset.star),
          _buildMomentItem(
              CustomImageAsset.splashScreenImg, CustomImageAsset.heartyMoment),
          _buildMomentItem(
              CustomImageAsset.splashScreenImg, CustomImageAsset.thumb),
          _buildMomentItem(
              CustomImageAsset.splashScreenImg, CustomImageAsset.questionMark),
          _buildMomentItem(
              CustomImageAsset.splashScreenImg, CustomImageAsset.onePlus),
          _buildMomentItem(
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
          _buildMomentItem(
              CustomImageAsset.splashScreenImg, CustomImageAsset.star),
          _buildMomentItem(
              CustomImageAsset.splashScreenImg, CustomImageAsset.onePlus),
          _buildMomentItem(
              CustomImageAsset.splashScreenImg, CustomImageAsset.thumb),
        ],
      ),
    );
  }

  // Moment Item
  Widget _buildMomentItem(String archiImage, String iconImage) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, bottom: 20.0),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(231, 237, 242, 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                iconImage,
                height: 70,
              ),
            ),
            Positioned(
              top: 4,
              left: 4,
              child: Image.asset(
                archiImage,
                height: 30,
                width: 30,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
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
          color: isSelected
              ? Colors.black
              : Colors.grey[300]!, // Black border for unselected
          width: isSelected ? 0 : 1, // Border only for unselected button
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Add rounding to corners
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
  List<Map<String, dynamic>> timelineComponents = [
    {
      "isFirst": true,
      "isCompleted": true,
      "text": 'Mar 1,2022 -> Mar 1,2024',
      "description":
          'The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
    },
    {
      "isCompleted": true,
      "text": 'Preparing',
      "description":
          'The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
    },
  ];

  bool isAddingNewComponent = false;

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
        const SizedBox(height: 10),
        _selectedTab == 0
            ? _buildActivities()
            : _selectedTab == 1
                ? _buildRequirements()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.check_circle_outlined),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Experiences",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black, // Text color
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    isAddingNewComponent = true;
                                  });
                                },
                                icon: const Icon(
                                  Icons.add_circle_outline_outlined,
                                  color: Color.fromRGBO(57, 210, 192, 1),
                                ))
                          ],
                        ),
                        if (isAddingNewComponent) _buildNewTimelineInput(),
                        if (!isAddingNewComponent)
                          ...timelineComponents.map((item) {
                            return TimelineComponent(
                              isFirst: item["isFirst"] ?? false,
                              isCompleted: item["isCompleted"] ?? false,
                              text: item["text"],
                              description: item["description"],
                            );
                          }),
                      ],
                    ),
                  ),
      ],
    );
  }

  Widget _buildNewTimelineInput() {
    final TextEditingController textController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          maxLines: 5,
          controller: textController,
          decoration: const InputDecoration(
            labelText: "What's your experience?",
            labelStyle: TextStyle(
              textBaseline: TextBaseline.alphabetic,
            ),
            alignLabelWithHint: true,
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: AppColors.aquaGreen),
              onPressed: () {
                if (textController.text.isNotEmpty) {
                  setState(() {
                    timelineComponents.add({
                      "isCompleted": false,
                      "text": textController.text,
                    });
                    isAddingNewComponent = false;
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter some text!')),
                  );
                }
              },
              child: Text(
                'Save',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white),
              ),
            ),
            const SizedBox(width: 8),
          ],
        )
      ],
    );
  }

  Widget _buildActivities() {
    return Column(
      children: [
        _buildActivityItem(
          profileImage: CustomImageAsset.splashScreenImg,
          username: 'Archi Maze',
          time: '4 hours ago',
          description:
              'The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
        ),
        _buildActivityItem(
          profileImage: CustomImageAsset.splashScreenImg,
          username: 'Ankit Patel',
          time: '6 hours ago',
          description: 'Another activity description.',
        ),
        _buildActivityItem(
          profileImage: CustomImageAsset.star,
          username: 'Anurag Singh',
          time: '10 hours ago',
          description:
              'The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
        ),
        _buildActivityItem(
          profileImage: CustomImageAsset.splashScreenImg,
          username: 'Rahul Sharma',
          time: '22 hours ago',
          description:
              'The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
        ),
      ],
    );
  }

  Widget _buildActivityItem({
    required String profileImage,
    required String username,
    required String time,
    required String description,
  }) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 19),
        padding: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          color: Colors.transparent,
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
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(
                      time,
                      style: GoogleFonts.inter(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Description
            Text(
              description,
              style: GoogleFonts.albertSans(fontSize: 13),
            ),
            const SizedBox(height: 20),
            // Icons row
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
                    _showCommentsSheet(context);
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
                Padding(
                  padding: const EdgeInsets.only(right: 150),
                  child: GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      CustomImageAsset.linkSvg,
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: IconButton(
                      onPressed: () {
                        showCustomAlertDialog(context);
                      },
                      icon: const Icon(Icons.more_horiz)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void _showCommentsSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    builder: (context) {
      return const CommentsBottomSheet();
    },
  );
}

Widget _buildRequirements() {
  return const Column(
    children: [
      BuildRequirementsItems(),
      BuildRequirementsItems(),
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
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: AppIcons(
                    imagePath: CustomImageAsset.sendSvg,
                    size: 20,
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
