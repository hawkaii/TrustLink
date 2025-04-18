import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../res/constants/colors.dart';

class ChatDetailsScreen extends StatefulWidget {
  final String name;

  const ChatDetailsScreen({
    super.key,
    required this.name,
  });

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/img.png'),
            ),
            const SizedBox(width: 20),
            Text(widget.name, style: const TextStyle(color: Colors.white)),
          ],
        ),
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        actions: [
          // Popup menu added here
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (String value) {},
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'Option 1',
                  child: Row(
                    children: [
                      Icon(Icons.delete_forever_outlined, color: Colors.red),
                      Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text('Delete message'),
                      ),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Option 2',
                  child: Row(
                    children: [
                      Icon(Icons.delete_forever_outlined, color: Colors.red),
                      Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text('Delete this chat'),
                      ),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Option 3',
                  child: Row(
                    children: [
                      Icon(Icons.block, color: Colors.red),
                      Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text('Block this user'),
                      ),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 45, top: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundImage:
                                    AssetImage('assets/images/img.png'),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Christopher Nolan",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "just a moment ago",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "The generated Lorem Ipsum is therefore always f......",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          // Image Section
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/download.jpg',
                              width: double.infinity,
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Footer: Timestamp and Activity
                          const Row(
                            children: [
                              Text(
                                "2 days ago",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.circle, size: 4, color: Colors.green),
                              SizedBox(width: 8),
                              Text(
                                "Shared an activity",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, right: 20),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset(
                            'assets/images/dynamic.jpg',
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const ChatBubbles(
                          message:
                              "Lorem Ipsum is a text for use in graphic in graphic.",
                          link: "tienext.com",
                          time: "2 days ago",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const MessageInputField(),
        ],
      ),
    );
  }
}

class MessageInputField extends StatelessWidget {
  const MessageInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade700, width: 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Type the message...",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              margin: const EdgeInsets.all(4),
              width: 50,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.onBoardingBtnColor2,
                borderRadius: BorderRadius.circular(14.0),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/navigation.svg',
                  height: 30,
                  width: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChatBubbles extends StatelessWidget {
  final String message;
  final String link;
  final String time;

  const ChatBubbles({
    super.key,
    required this.message,
    required this.link,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 118, top: 10),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent.withOpacity(0.5), // Bubble color
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: message,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ' $link',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
