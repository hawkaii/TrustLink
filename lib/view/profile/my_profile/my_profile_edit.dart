import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:image_picker/image_picker.dart'; // Import the image_picker package
import 'dart:io';

import 'package:trustlink/res/constants/colors.dart';
import 'package:trustlink/res/extensions/media_query_extensions.dart';
import 'package:trustlink/res/helpers/dialog_helper.dart';

import '../../../res/assets/image_assets.dart'; // For File type

class MyProfileEdit extends StatefulWidget {
  const MyProfileEdit({super.key});

  @override
  State<MyProfileEdit> createState() => _MyProfileEditState();
}

class _MyProfileEditState extends State<MyProfileEdit> {
  // State variable to store the background image
  File? _backgroundImage;

  // Method to pick an image from the gallery
  Future<void> _pickImageFromGallery() async {
    // final ImagePicker picker = ImagePicker();
    // final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    // if (image != null) {
    //   setState(() {
    //     _backgroundImage = File(image.path); // Update the background image
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: context.fullWidth,
                    height: context.fullHeight * 0.27 + 2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: _backgroundImage != null
                            ? FileImage(
                                _backgroundImage!) // Use the picked image
                            : const AssetImage(
                                CustomImageAsset.mountains, // Default image
                              ) as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Gradient overlay
                  Container(
                    width: context.fullWidth,
                    height: context.fullHeight * 0.27 + 2,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(255, 255, 255, 0.6), // Start color
                          Color.fromRGBO(177, 177, 177, 0.6), // Middle color
                          Color.fromRGBO(0, 0, 0, 0.6), // End color
                        ],
                        stops: [0.0, 0.031, 0.9999], // Gradient stops
                      ),
                    ),
                  ),
                  // Main content
                  Positioned(
                    top: 65,
                    left: 0,
                    right: 200,
                    child: InkWell(
                      onTap: () {
                        // Add your edit logic here
                      },
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(
                                  CustomImageAsset.splashScreenImg,
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 48,
                                    width: 72,
                                    child: Card(
                                      margin: const EdgeInsets.all(0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '100K',
                                            style: GoogleFonts.inter(
                                              fontSize: 18,
                                              letterSpacing: -0.5,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'Followings',
                                            style: GoogleFonts.inter(
                                              letterSpacing: -0.5,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  SizedBox(
                                    height: 48,
                                    width: 72,
                                    child: Card(
                                      margin: const EdgeInsets.all(0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '100K',
                                            style: GoogleFonts.inter(
                                              fontSize: 18,
                                              letterSpacing: -0.5,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'Followers',
                                            style: GoogleFonts.inter(
                                              letterSpacing: -0.5,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  IconButton(
                                    style: IconButton.styleFrom(
                                      minimumSize: const Size(30, 30),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor: Colors.white,
                                      padding: EdgeInsets.zero,
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down_circle_outlined,
                                      size: 18,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // Name with Edit Button
                          Row(
                            children: [
                              Text(
                                'Cristopher Nolen',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  AppDialogHelper()
                                      .showEditDialog(context, 'Name');
                                },
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8), // Consistent spacing
                          Row(
                            children: [
                              Text(
                                '@cristopher_23',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(181, 0, 0, 1),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  AppDialogHelper()
                                      .showEditDialog(context, 'UserName');
                                },
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                              height:
                                  12), // Consistent spacing between sections
                          // Work Role with Edit Button
                          Row(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.work,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Entrepreneur',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 1),
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  AppDialogHelper()
                                      .showEditDialog(context, 'Work Role');
                                },
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8), // Consistent spacing
                          // Location with Edit Button
                          Row(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'New York, USA',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 1),
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  AppDialogHelper()
                                      .showEditDialog(context, 'Location');
                                },
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        TextButton(
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(0.0),
                                backgroundColor: AppColors.gray100,
                                minimumSize: const Size(160, 39),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14))),
                            onPressed: () {},
                            child: Text(
                              "Attached link \nhttp://muziplex.com/re...",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500, fontSize: 12),
                            )),
                        InkWell(
                          onTap: () {
                            AppDialogHelper()
                                .showEditDialog(context, 'Location');
                          },
                          child: const Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        children: [
                          Image.asset(
                            CustomImageAsset.mountains,
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            CustomImageAsset.dynamic,
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: _pickImageFromGallery,
                            child: Container(
                              height: 80,
                              width: 80,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: AppColors.gray,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.image_outlined),
                                  Text(
                                    'Choose from Gallery',
                                    style: GoogleFonts.inter(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
