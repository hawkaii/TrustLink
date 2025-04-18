import 'package:flutter/material.dart';

import '../../res/assets/image_assets.dart';

class CommentsBottomSheet extends StatelessWidget {
  const CommentsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context)
            .viewInsets
            .bottom, // Adjust padding for keyboard
      ),
      child: Container(
        height: size.height * 0.8,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Comments",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            const Divider(), // Divider below "Comments" title
            Expanded(
              child: ListView.builder(
                itemCount: 4, // Number of comments
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10), // Space between comments
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage(CustomImageAsset.splashScreenImg),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Cristopher Nolen",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      "Lorem Ipsum is a text for use in graphic in graphic.",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 44),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Delete",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Divider(), // Divider after the ListView
            // Add comment section with circle image
            Container(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  // Circle image next to the comment input
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(
                      CustomImageAsset.splashScreenImg,
                    ), // Your avatar image
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Add a comment",
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.teal,
                    child: IconButton(
                      onPressed: () {},
                      icon:
                          const Icon(Icons.send, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
