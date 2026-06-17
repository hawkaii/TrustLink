import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trustlink/network/api_url/api_url.dart';
import 'package:trustlink/res/assets/image_assets.dart';

import '../auth/signup/controller/signup1_controller.dart';

class SharingScreen extends StatefulWidget {
  final ScrollController scrollController;
  SharingScreen({super.key, required this.scrollController});

  final SignUp1Controller controllers = Get.put(SignUp1Controller());

  @override
  _SharingScreenState createState() => _SharingScreenState();
}

class _SharingScreenState extends State<SharingScreen> {
  int _selectedIndex = 0;
  final TextEditingController _textController = TextEditingController();
  bool _isPosting = false;

  final List<String> _tabs = ['Activity', 'Requirement', 'Moment'];

  Future<void> _createTextPost() async {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    setState(() => _isPosting = true);
    try {
      final response = await dio.post(
        ApiEndpoints.feed,
        data: {'text': text},
      );
      log('Post created: ${response.statusCode}');
      _textController.clear();
      Get.snackbar('Posted!', 'Your post is live.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } on DioException catch (e) {
      final msg = e.response?.data is Map
          ? (e.response?.data['error']?['message'] ?? 'Failed to post')
          : 'Failed to post';
      Get.snackbar('Error', msg,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      setState(() => _isPosting = false);
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: SafeArea(
            child: _buildHeader(),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Divider(color: Colors.grey.shade300, height: 1),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _tabs[_selectedIndex],
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.black, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                      ),
                      onPressed: _isPosting ? null : _createTextPost,
                      child: _isPosting
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                  strokeWidth: 2, color: Colors.black))
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "Share",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                SvgPicture.asset(
                                  CustomImageAsset.shareArrow,
                                  height: 16,
                                )
                              ],
                            ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.grey.shade300, height: 1),
              const SizedBox(height: 10),
              _buildCurrentScreen(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 5),
          Text(
            "Share Something Interesting",
            style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentScreen() {
    switch (_selectedIndex) {
      case 0:
        return _buildActivityScreen();
      case 1:
        return _buildRequirementScreen();
      case 2:
        return _buildMomentScreen();
      default:
        return _buildActivityScreen();
    }
  }

  Widget _buildActivityScreen() {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          _buildTextField(),
          const SizedBox(height: 20),
          _buildIconRow(),
          const SizedBox(height: 20),
          _buildImageRow(),
        ],
      ),
    );
  }

  Widget _buildRequirementScreen() {
    return SizedBox(
      height: 600,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Requirement Title',
                hintStyle: GoogleFonts.inter(color: Colors.grey, fontSize: 16),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Describe your requirement in a few words...',
                hintStyle: GoogleFonts.inter(color: Colors.grey, fontSize: 16),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Location',
                hintStyle: GoogleFonts.inter(color: Colors.grey, fontSize: 16),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Profession',
                hintStyle: GoogleFonts.inter(color: Colors.grey, fontSize: 16),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMomentScreen() {
    return SizedBox(
      height: 600,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(
                width: 391,
                height: 158,
                child: Card(
                  color: Colors.grey.shade400,
                  child: const Row(
                    children: [
                      Icon(Icons.add),
                      Text("Archi Maze has achieved a gold medal in\nolmpics")
                    ],
                  ),
                )),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Requirement Title',
                hintStyle: GoogleFonts.inter(color: Colors.grey, fontSize: 16),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: _textController,
        maxLines: 5,
        decoration: InputDecoration(
          hintText: 'Write something interesting here...',
          hintStyle: TextStyle(color: Colors.grey.shade600),
        ),
      ),
    );
  }

  Widget _buildIconRow() {
    final List<IconData> iconPaths = [
      Icons.photo_outlined,
      Icons.camera_alt_outlined,
      Icons.file_copy,
      Icons.link,
      Icons.person_2_outlined,
      Icons.visibility,
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: iconPaths.map((iconPath) {
          return Container(
            margin: const EdgeInsets.all(4),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: Center(
              child: Icon(iconPath, color: Colors.black),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildImageRow() {
    final List<String> imagePaths = [
      CustomImageAsset.mountains,
      CustomImageAsset.kishorSinger,
      CustomImageAsset.splashScreenImg,
      CustomImageAsset.splashScreenImg,
    ];

    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14.0),
              child: Image.asset(
                imagePaths[index],
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 56,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(50.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _tabs.asMap().entries.map((entry) {
          int index = entry.key;
          String text = entry.value;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Text(
              text,
              style: GoogleFonts.inter(
                color: _selectedIndex == index ? Colors.white : Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
