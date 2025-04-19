// import 'package:flutter/material.dart';
// import 'package:simple_floating_bottom_nav_bar/floating_bottom_nav_bar.dart';
// import 'package:simple_floating_bottom_nav_bar/floating_item.dart';
// import 'package:trustlink/view/requirement/requirement_screen.dart';
// import 'package:trustlink/view/sharing/sharing_screen.dart';
// import '../chat_screen/chat_list_page.dart';
// import '../home_page/home_screen.dart';
// import '../profile/user_profile/user_profile_page.dart';
//
// class ButtonNavigation extends StatefulWidget {
//   const ButtonNavigation({super.key});
//
//   @override
//   State<ButtonNavigation> createState() => _ButtonNavigationState();
// }
//
// class _ButtonNavigationState extends State<ButtonNavigation> {
//   final List<FloatingBottomNavItem> bottomNavItems = const [
//     FloatingBottomNavItem(
//       inactiveIcon: Icon(Icons.home_outlined, color: Colors.grey),
//       activeIcon: Icon(Icons.home, color: Colors.white),
//     ),
//     FloatingBottomNavItem(
//       inactiveIcon: Icon(Icons.event_note, color: Colors.grey),
//       activeIcon: Icon(Icons.event_note, color: Colors.white),
//     ),
//     FloatingBottomNavItem(
//       inactiveIcon:
//           Icon(Icons.add_circle_outline, color: Colors.grey, size: 40),
//       activeIcon: Icon(Icons.add_circle, color: Colors.white, size: 40),
//     ),
//     FloatingBottomNavItem(
//       inactiveIcon: Icon(Icons.message, color: Colors.grey),
//       activeIcon: Icon(Icons.message, color: Colors.white),
//     ),
//     FloatingBottomNavItem(
//       inactiveIcon: Icon(Icons.person_outline, color: Colors.grey),
//       activeIcon: Icon(Icons.person, color: Colors.white),
//     ),
//   ];
//
//   // Define screens for each bottom navigation item
//   final List<Widget> pages = [
//     // const HomePage(),
//     // const RequirementScreen(),
//     // SharingScreen(),
//     // const ChatListScreen(),
//     // const UserProfilePage(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FloatingBottomNavBar(
//         pages: pages,
//         items: bottomNavItems,
//         initialPageIndex: 0,
//         backgroundColor: Colors.black,
//         bottomPadding: 5,
//         elevation: 0,
//         radius: 30,
//         width: 300,
//         height: 65,
//       ),
//     );
//   }
// }
