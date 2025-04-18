import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/notification_controller.dart';

class NotificationSettingsScreen extends StatelessWidget {
  final NotificationController controller = Get.put(NotificationController());

  NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Notification Settings",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.notifications_none, color: Colors.black54),
                    SizedBox(width: 10),
                    Text(
                      "Wanna receive Push\n notification",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: screenWidth * 0.25,
                  child: Obx(
                    () => DropdownButtonFormField<String>(
                      value: controller.dropdownValue.value,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      items: ["Yes", "No"].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        controller.toggleDropdown(newValue!);
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                "Decide if you want to receive\n push notifications.",
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => _buildSwitchRow(
                title: "Receive push notification for\n messages",
                value: controller.messagesNotification.value,
                onChanged: controller.toggleMessagesNotification,
              ),
            ),
            Obx(
              () => _buildSwitchRow(
                title:
                    "Receive push notification for\n follows, likes, mentions etc.",
                value: controller.followsNotification.value,
                onChanged: controller.toggleFollowsNotification,
              ),
            ),
            Obx(
              () => _buildSwitchRow(
                title: "Receive push notification for\n other info",
                value: controller.otherNotification.value,
                onChanged: controller.toggleOtherNotification,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Switch Row Widget
  Widget _buildSwitchRow({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
          ),
          Switch(
            value: value,
            activeColor: Colors.teal,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
