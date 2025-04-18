import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../notification/controller/notification_controller.dart';

class MessageSettingsScreen extends StatelessWidget {
  final NotificationController controller = Get.put(NotificationController());

  MessageSettingsScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Message Settings",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.lock, color: Colors.black54),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          "Who can message you?",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.30,
                  child: Obx(
                        () => DropdownButtonFormField<String>(
                      value: controller.mentionDropdownValue.value,
                      decoration: InputDecoration(
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      items: ["Nobody", "Everyone"].map((String value) {
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
            const Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 13),
                      child: Text(
                        "Decide who can see the",
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 33),
                      child: Text(
                        "message button on your profile",
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      ),
                    ),
                    Text(
                      "and directly message you",
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
