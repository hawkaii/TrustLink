import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../models/home/user_model.dart';
import 'controller/search_controller.dart';

class SearchPage extends StatelessWidget {
  final ScrollController scrollController;
  const SearchPage({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final SearchControllers searchController = Get.put(SearchControllers());

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) {
        return Scaffold(
          body: CustomScrollView(
            controller: scrollController,
            slivers: [
              const SliverAppBar(
                floating: false,
                pinned: true,
                title: Text('Search People'),
              ),
              // Search Field
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
                  child: TextField(
                    onChanged: searchController.searchUser,
                    decoration: InputDecoration(
                      hintText: 'Search here...',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Color(0xffE7EDF2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              // Section Title: In Your Chats
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5),
                  child: Text(
                    'In your chats',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // Horizontal ListView for Chat Avatars
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 100.h,
                  child: Obx(() {
                    if (searchController.filteredUsers.isEmpty) {
                      return const Center(child: Text('No users found.'));
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: searchController.filteredUsers.length,
                      itemBuilder: (context, index) {
                        return ChatAvatarWidget(
                          user: searchController.filteredUsers[index],
                        );
                      },
                    );
                  }),
                ),
              ),
              // User List in SliverList
              Obx(() {
                if (searchController.filteredUsers.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text('No results found',
                            style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  );
                }
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return UserCardWidget(
                        user: searchController.filteredUsers[index],
                      );
                    },
                    childCount: searchController.filteredUsers.length,
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}

// Chat Avatar Widget
class ChatAvatarWidget extends StatelessWidget {
  final User user;

  const ChatAvatarWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage(user.imageUrl),
          ),
          const SizedBox(height: 5),
          Text(
            user.name,
            style: const TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

// User Card Widget
class UserCardWidget extends StatelessWidget {
  final User user;

  const UserCardWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28.r,
                backgroundImage: AssetImage(user.imageUrl),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(Icons.work, size: 16.sp, color: Colors.grey),
                      SizedBox(width: 4.w),
                      Text(user.role,
                          style: TextStyle(
                              fontSize: 12.sp, color: Color(0xff000000))),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16.sp, color: Colors.grey),
                      SizedBox(width: 4.w),
                      Text(user.location,
                          style: TextStyle(
                              fontSize: 12.sp, color: Color(0xff000000))),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: Color(0xffC4C4C4),
        )
      ],
    );
  }
}
