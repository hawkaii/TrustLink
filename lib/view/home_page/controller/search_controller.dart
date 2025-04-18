import 'package:get/get.dart';

import '../../../models/home/user_model.dart';
import '../../../res/assets/image_assets.dart';


class SearchControllers extends GetxController {
  // Original list of users
  final users = <User>[
    User(
      name: 'Ankit Patel',
      role: 'Flutter Developer',
      location: 'Patna Bihar Saran',
      imageUrl: CustomImageAsset.ankitDp,
    ),
    User(
      name: 'Anurag Singh',
      role: 'Flutter Developer',
      location: 'Uttar Pradesh',
      imageUrl: CustomImageAsset.namaste,
    ),
    User(
      name: 'Archi Maze',
      role: 'Entrepreneur',
      location: 'Noida, Sector-18',
      imageUrl: CustomImageAsset.archi,
    ),
    User(
      name: 'Cristopher\nNolen',
      role: 'Entrepreneur',
      location: 'Noida, Sector-18',
      imageUrl: CustomImageAsset.star,
    ),
    User(
      name: 'John Golfer\nDoze Cristiano',
      role: 'Entrepreneur',
      location: 'Noida, Sector-18',
      imageUrl: CustomImageAsset.onePlus,
    ),
    User(
      name: 'Anushka',
      role: 'Entrepreneur',
      location: 'Noida, Sector-18',
      imageUrl: CustomImageAsset.namaste,
    ),
    User(
      name: 'SonAM haptic',
      role: 'Entrepreneur',
      location: 'Noida, Sector-18',
      imageUrl: CustomImageAsset.questionMark,
    ),
    User(
      name: 'John Golfer',
      role: 'Entrepreneur',
      location: 'Noida, Sector-18',
      imageUrl: CustomImageAsset.ankitDp,
    ),
    User(
      name: 'ANjali',
      role: 'Entrepreneur',
      location: 'Noida, Sector-1',
      imageUrl: CustomImageAsset.star,
    ),
    User(
      name: 'Anuradha Chaubey',
      role: 'Entrepreneur',
      location: 'Gurgram, Sector-18',
      imageUrl: CustomImageAsset.heartyMoment,
    ),
    User(
      name: 'Cristan Ronaldo',
      role: 'Entrepreneur',
      location: 'Noida, Sector-18',
      imageUrl: CustomImageAsset.namaste,
    ),
  ].obs;

  // Filtered users list for search
  final filteredUsers = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize filtered list with all users
    filteredUsers.assignAll(users);
  }

  void searchUser(String query) {
    // Use trim() to avoid spaces affecting searches
    query = query.trim();

    if (query.isEmpty) {
      // Restore full list if search query is empty
      filteredUsers.assignAll(users);
    } else {
      // Filter users by name, case-insensitive
      filteredUsers.assignAll(
        users.where((user) => user.name.toLowerCase().contains(query.toLowerCase())),
      );
    }
  }
}
