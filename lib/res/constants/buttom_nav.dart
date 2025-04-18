import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tienext/res/extensions/media_query_extensions.dart';
import 'package:tienext/view/chat_screen/chat_list_page.dart';
import 'package:tienext/view/sharing/sharing_screen.dart';
import '../../view/home_page/home_screen.dart';
import '../../view/home_page/search_screen.dart';
import '../../view/profile/user_profile/user_profile_page.dart';
import '../../view/requirement/requirement_screen.dart';
import '../assets/image_assets.dart';

class ButtonNavigation extends StatefulWidget {
  const ButtonNavigation({super.key});

  @override
  _ButtonNavigationState createState() => _ButtonNavigationState();
}

class _ButtonNavigationState extends State<ButtonNavigation>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;

  final List<Color> colors = [
    Colors.yellow,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.pink
  ];

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 5, vsync: this);
    tabController.animation!.addListener(() {
      final value = tabController.animation!.value.round();
      if (value != currentPage && mounted) {
        changePage(value);
      }
    });
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color unselectedColor = colors[currentPage].computeLuminance() < 0.5
        ? Colors.white
        : Colors.white;

    return Scaffold(
      body: BottomBar(
        fit: StackFit.expand,
        icon: (width, height) => Center(
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: null,
            icon: Icon(
              Icons.arrow_upward_rounded,
              color: unselectedColor,
              size: width,
            ),
          ),
        ),
        borderRadius: BorderRadius.circular(400),
        duration: const Duration(seconds: 1),
        curve: Curves.decelerate,
        showIcon: true,
        width: context.fullWidth * 0.8,
        barColor: colors[currentPage].computeLuminance() > 0.5
            ? Colors.black
            : Colors.black,
        start: 2,
        end: 0,
        barAlignment: Alignment.bottomCenter,
        reverse: false,
        hideOnScroll: true,
        scrollOpposite: false,
        body: (context, controller) => TabBarView(
          controller: tabController,
          dragStartBehavior: DragStartBehavior.down,
          physics: const BouncingScrollPhysics(),
          children: [
            HomePage(scrollController: controller),
            RequirementScreen(scrollController: controller),
            SharingScreen(scrollController: controller),
            ChatListScreen(scrollController: controller),
            UserProfilePage(scrollController: controller),
          ],
        ),
        child: currentPage != 2
            ? TabBar(
                indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                controller: tabController,
                dividerHeight: 0,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: colors[currentPage],
                    width: 4,
                  ),
                  insets: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                ),
                tabs: [
                  // Tab 0
                  SizedBox(
                    height: 60,
                    width: 40,
                    child: Center(
                      child: SvgPicture.asset(
                        CustomImageAsset.homeSvg,
                        color: currentPage == 0 ? colors[0] : unselectedColor,
                      ),
                    ),
                  ),
                  // Tab 1
                  SizedBox(
                    height: 60,
                    width: 40,
                    child: Center(
                      child: SvgPicture.asset(
                        CustomImageAsset.requirementSvg,
                        color: currentPage == 1 ? colors[1] : unselectedColor,
                      ),
                    ),
                  ),
                  // Tab 2
                  SizedBox(
                    height: 60,
                    width: 40,
                    child: Center(
                      child: SvgPicture.asset(
                        CustomImageAsset.addSvg,
                        color: currentPage == 2 ? colors[2] : unselectedColor,
                      ),
                    ),
                  ),
                  // Tab 3
                  SizedBox(
                    height: 60,
                    width: 40,
                    child: Center(
                      child: SvgPicture.asset(
                        CustomImageAsset.messageSvg,
                        color: currentPage == 3 ? colors[3] : unselectedColor,
                      ),
                    ),
                  ),
                  // Tab 4
                  SizedBox(
                    height: 60,
                    width: 50,
                    child: Center(
                      child: SvgPicture.asset(
                        CustomImageAsset.personSvg,
                        color: currentPage == 4 ? colors[4] : unselectedColor,
                      ),
                    ),
                  ),
                ],
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                indicatorColor: colors[currentPage],
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
