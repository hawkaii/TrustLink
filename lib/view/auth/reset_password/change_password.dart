import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trustlink/res/extensions/media_query_extensions.dart';
import 'package:trustlink/res/extensions/validation_extensions.dart';
import 'package:trustlink/res/extensions/widget_extensions.dart';
import 'package:trustlink/view/auth/reset_password/forget_password.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/constants/buttom_nav.dart';
import '../../../res/constants/colors.dart';
import '../../../res/constants/string.dart';
import '../../../res/constants/text_theme.dart';
import '../../../res/widgets/custom_button_widget.dart';
import '../../../res/widgets/custom_text_field.dart';
import 'controller/change_pass_controller.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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

              // Old Password Field
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

              // New Password Field
              Obx(
                () => CustomTextField(
                  controller: controller.confirmPasswordController,
                  hintText: kNewPassword,
                  suffixicon: controller.isPasswordVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                  obscureText: !controller.isPasswordVisible.value,
                ),
              ),

              SizedBox(height: context.fullHeight * 0.02),
              const Text(kForgetPass, style: AppTextTheme.forgotPassword).onTap(
                () => Get.to(const ForgetPassword()),
              ),
              SizedBox(height: context.fullHeight * 0.05),
              CustomButton(
                text: kSavePass,
                onPressed: () {
                  if (controller.validatePasswords()) {
                    Get.to(const ButtonNavigation());
                  } else {
                    controller.validationMessage.value.showToast();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
