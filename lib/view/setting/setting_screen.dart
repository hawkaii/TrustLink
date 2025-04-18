import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienext/res/extensions/media_query_extensions.dart';
import 'package:tienext/view/auth/login/login_page.dart';
import 'package:tienext/view/mention/mention_setting.dart';
import 'package:tienext/view/profile/my_profile/my_profile_edit.dart';
import 'package:tienext/view/setting/privacy_policy.dart';
import '../../res/constants/text_theme.dart';
import '../auth/reset_password/change_password.dart';
import '../notification/notification_screen.dart';
import 'message_setting.dart';
import 'monotisation_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Settings & Preferences'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.fullWidth * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.fullHeight * 0.02),
              _sectionTitle("My Account"),
              _menuItem(
                icon: Icons.account_circle_outlined,
                title: "Account Center",
                onTap: () {
                  Get.to(const MyProfileEdit());
                },
              ),
              _menuItem(
                icon: Icons.monetization_on_outlined,
                title: "Monetization",
                onTap: () {
                  Get.to(const MonetizationScreen());
                },
              ),
              _sectionTitle("Usage Preferences"),
              _menuItem(
                icon: Icons.notifications_none,
                title: "Notifications",
                onTap: () {
                  Get.to(NotificationSettingsScreen());
                },
              ),
              _menuItem(
                icon: Icons.message_outlined,
                title: "Messages",
                onTap: () {
                  Get.to(MessageSettingsScreen());
                },
              ),
              _menuItem(
                icon: Icons.alternate_email,
                title: "Mentions",
                onTap: () {
                  Get.to(MentionSettingsScreen());
                },
              ),
              SizedBox(height: context.fullHeight * 0.01),
              _sectionTitle("Policies & Terms"),
              _menuItem(
                icon: Icons.privacy_tip_outlined,
                title: "Privacy Centre",
                onTap: () {
                  Get.to(const PrivacyCentreScreen());
                },
              ),
              _sectionTitle("Account Info"),
              _menuItem(
                icon: Icons.lock_outline,
                title: "Reset Password",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangePassword(),
                      ));
                },
              ),
              _menuItem(
                icon: Icons.logout,
                title: "Log Out",
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Section Title Widget
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: AppTextTheme.setting,
      ),
    );
  }

  Widget _menuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.grey[700], size: 24),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
