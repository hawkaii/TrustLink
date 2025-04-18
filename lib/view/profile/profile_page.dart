import 'package:flutter/material.dart';

import '../../res/constants/text_theme.dart';
import '../../res/widgets/moment_scroll.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedMomentsTab = 0;
  int _selectedActivitiesTab = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profilewidget(width: width, height: height),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: height * 0.05,
                width: width * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFE7EDF2)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Attached Link"),
                        Text("http//tinnext.com")
                      ],
                    ),
                    Icon((Icons.arrow_forward))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  const Text(
                    "Moments",
                    style: AppTextTheme.bodyMedium,
                  ),
                  _buildTabButton(
                    label: "Moments",
                    isSelected: _selectedMomentsTab == 0,
                    onTap: () => setState(() => _selectedMomentsTab = 0),
                  ),
                  _buildTabButton(
                    label: "Saved",
                    isSelected: _selectedMomentsTab == 1,
                    onTap: () => setState(() => _selectedMomentsTab = 1),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _selectedMomentsTab == 0
                ? MomentScroll(height: height, width: width)
                : _buildSavedContent(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  _buildTabButton(
                    label: "Activities",
                    isSelected: _selectedActivitiesTab == 0,
                    onTap: () => setState(() => _selectedActivitiesTab = 0),
                  ),
                  _buildTabButton(
                    label: "Requirements",
                    isSelected: _selectedActivitiesTab == 1,
                    onTap: () => setState(() => _selectedActivitiesTab = 1),
                  ),
                  _buildTabButton(
                    label: "About",
                    isSelected: _selectedActivitiesTab == 2,
                    onTap: () => setState(() => _selectedActivitiesTab = 2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _selectedActivitiesTab == 0
                  ? _buildActivitiesSection()
                  : _selectedActivitiesTab == 1
                      ? _buildRequirementsSection()
                      : _buildAboutSection(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivitiesSection() {
    return const Center(
      child: Text(
        "Activities Section",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildRequirementsSection() {
    return const Center(
      child: Text(
        "Requirements Section",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildAboutSection() {
    return const Center(
      child: Text(
        "About Section",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

Widget _buildTabButton({
  required String label,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey.shade200,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

Widget _buildSavedContent() {
  return const Center(
    child: Text(
      "No saved moments.",
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}
