import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trustlink/res/extensions/media_query_extensions.dart';
import '../../view/home_page/comment_screen.dart';
import '../constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDialogHelper {
  void showEditDialog(BuildContext context, String fieldName) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.only(left: 15, right: 15),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.gray100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12, top: 10),
                      child: Text(
                        'Wanna change the $fieldName?',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20.w, top: 5),
                      width: 30.r,
                      height: 25.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                          width: 2.5,
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.close_rounded,
                          size: 20.sp,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.fullHeight * 0.001),
                const Divider(),
                // Dialog Content
                Column(
                  children: [
                    SizedBox(height: context.fullHeight * 0.01),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter new $fieldName',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: context.fullHeight * 0.01),
                    const Divider(),
                    SizedBox(height: context.fullHeight * 0.02),
                    // Save Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(180, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: AppColors.aquaGreen,
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        // Add your save logic here
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Save',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: context.fullHeight * 0.02),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showCommentsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) {
        return const CommentsBottomSheet();
      },
    );
  }
}
