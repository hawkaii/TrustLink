import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienext/res/extensions/widget_extensions.dart';
import '../../res/assets/image_assets.dart';
import '../../res/constants/buttom_nav.dart';
import '../../res/constants/string.dart';
import '../../res/widgets/custom_button_widget.dart';
import 'controller/interest_controller.dart';

class InterestsScreen extends StatelessWidget {
  InterestsScreen({super.key});

  final List<Map<String, dynamic>> interests = [
    {"title": "Fashion, Beauty etc.", "color": Colors.lightBlueAccent},
    {"title": "Business & Corporate", "color": Colors.pinkAccent},
    {"title": "Music, Melodies etc.", "color": Colors.lightGreen},
    {
      "title": "Filmmaking, Cinematography, Acting, Movies etc.",
      "color": Colors.blueAccent
    },
    {
      "title": "Entertainment, Cooking, Comedy, Others",
      "color": Colors.purple.shade200
    },
    {"title": "E-sports & Gaming", "color": Colors.purpleAccent},
    {"title": "Tech, Science etc.", "color": Colors.pink.shade200},
    {"title": "Sports, Athletes, Fitness etc.", "color": Colors.green},
    {"title": "Arts & Craft, Paintings etc.", "color": Colors.pinkAccent},
    {"title": "Fashion, Beauty etc.", "color": Colors.lightBlueAccent},
    {"title": "Business & Corporate", "color": Colors.pink.shade200},
  ];

  final InterestController controller = Get.put(InterestController());

  @override
  Widget build(BuildContext context) {
    controller.initializeSelection(interests.length);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            floating: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(image: AssetImage(CustomImageAsset.splashScreenImg)),
            ),
            expandedHeight: 90,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 16, bottom: 1),
              title: Text(
                "What’s your top interests?",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "This helps us in filtering the feed to pick the best & relatable contents to show you.",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 2.2,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Obx(() => InterestBox(
                        title: interests[index]['title'],
                        color: interests[index]['color'],
                        isSelected: controller.selectedInterests[index],
                        onTap: () => controller.toggleSelection(index),
                      ));
                },
                childCount: interests.length,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: CustomButton(
                text: kNext,
                onPressed: () {
                  Get.to(const ButtonNavigation());
                },
              ).center(),
            ),
          ),
        ],
      ),
    );
  }
}

class InterestBox extends StatelessWidget {
  final String title;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const InterestBox({
    super.key,
    required this.title,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.transparent,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Checkbox(
                value: isSelected,
                onChanged: (_) => onTap(),
                checkColor: Colors.white,
                activeColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
