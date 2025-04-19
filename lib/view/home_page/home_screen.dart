import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienext/res/extensions/media_query_extensions.dart';
import 'package:tienext/view/home_page/search_screen.dart';
import 'package:tienext/view/home_page/widgets/icon_widgets.dart';
import 'package:tienext/view/home_page/widgets/post_widgets.dart';
import 'package:tienext/view/profile/user_profile/widgets/moments_item.dart';
import '../../models/home/user_model.dart';
import '../../res/assets/image_assets.dart';
import '../setting/setting_screen.dart';

class HomePage extends StatefulWidget {
  final ScrollController scrollController;

  const HomePage({super.key, required this.scrollController});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Image.asset(
          CustomImageAsset.splashScreenImg,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(SearchPage(scrollController: widget.scrollController));
            },
            child: const AppIcons(
              imagePath: CustomImageAsset.search,
              showBorder: true,
              size: 16,
            ),
          ),
          const AppIcons(
              imagePath: CustomImageAsset.bellIcon, showBorder: true, size: 16),
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
        controller: widget.scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Recent Moment",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Albert Sans",
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            buildTodayMoments(),
            SizedBox(
              height: context.fullHeight * 0.005,
            ),
            FutureBuilder<List<Post>>(
              future: _postsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No posts available.'));
                }
                final posts = snapshot.data!;
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return UserPost(
                      scrollController: widget.scrollController,
                      post: posts[index],
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: context.fullHeight * 0.01,
            ),
          ],
        ),
      ),
    );
  }
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
        momentItem(CustomImageAsset.splashScreenImg, CustomImageAsset.onePlus),
        momentItem(CustomImageAsset.splashScreenImg, CustomImageAsset.namaste),
      ],
    ),
  );
}
