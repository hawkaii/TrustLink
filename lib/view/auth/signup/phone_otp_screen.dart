import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trustlink/res/extensions/media_query_extensions.dart';
import 'package:trustlink/view/auth/reset_password/change_password.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/constants/colors.dart';
import '../../../res/constants/string.dart';
import '../../../res/widgets/custom_button_widget.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.fullWidth * 0.07,
            vertical: context.fullHeight * 0.1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(
                    height: context.fullHeight * 0.06,
                    CustomImageAsset.logotrustlinkImage,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: context.height * 0.02),
                  Text(
                    kEnterOtp,
                    style: TextStyle(
                      fontSize: context.width * 0.07,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: context.height * 0.01),
                  Text(
                    kEnterOtpSent,
                    style: TextStyle(
                      fontSize: context.width * 0.04,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: context.height * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) => _buildOTPBox(context)),
              ),
              SizedBox(height: context.fullHeight * 0.09),
              CustomButton(
                text: kNext,
                onPressed: () {
                  Get.to(const ChangePassword());
                },
                fontSize: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOTPBox(BuildContext context) {
    return Container(
      height: context.height * 0.06,
      width: context.width * 0.12,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: TextField(
          onChanged: (value) {
            if (value.isNotEmpty) {
              FocusScope.of(context).nextFocus();
            } else {
              FocusScope.of(context).previousFocus();
            }
          },
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          style: TextStyle(
            fontSize: context.width * 0.06,
            fontWeight: FontWeight.bold,
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
