import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trustlink/res/extensions/media_query_extensions.dart';
import 'package:trustlink/res/extensions/validation_extensions.dart';
import 'package:trustlink/res/extensions/widget_extensions.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/constants/buttom_nav.dart';
import '../../../res/constants/colors.dart';
import '../../../res/constants/string.dart';
import '../../../res/constants/text_theme.dart';
import '../../../res/widgets/custom_button_widget.dart';
import '../../../res/widgets/custom_text_field.dart';
import 'controller/change_pass_controller.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final ChangePasswordController controller =
        Get.put(ChangePasswordController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.08),
              Image.asset(
                height: context.fullHeight * 0.06,
                CustomImageAsset.logotrustlinkImage,
                fit: BoxFit.contain,
              ),
              SizedBox(height: context.fullHeight * 0.03),
              const Text(kDecideNewPass,
                  style: TextStyle(
                      fontSize: 25, color: AppColors.onBoardingBtnColor2)),
              SizedBox(height: context.fullHeight * 0.03),
              Obx(
                () => CustomTextField(
                  controller: controller.newPasswordController,
                  hintText: kOldPassword,
                  suffixicon: controller.isPasswordVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                  obscureText: !controller.isPasswordVisible.value,
                ),
              ),
              SizedBox(height: context.fullHeight * 0.07),
              CustomButton(
                text: kSavePass,
                onPressed: () {
                  Get.to(const ButtonNavigation());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
