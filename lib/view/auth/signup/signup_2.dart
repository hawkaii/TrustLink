import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:trustlink/res/extensions/int_extensions.dart';
import 'package:trustlink/res/extensions/media_query_extensions.dart';
import '../../../provider/auth_provider.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/constants/string.dart';
import '../../../res/constants/text_theme.dart';
import '../../../res/widgets/custom_button_widget.dart';
import '../../../res/widgets/custom_text_field.dart';
import '../../../res/widgets/dropdown_widgets.dart';
import 'controller/signup1_controller.dart';

class SignUpScreen2 extends StatefulWidget {
  final String fullName;
  final String email;
  final String password;
  final String birthday;
  final String gender;

  const SignUpScreen2(
      {super.key,
      required this.fullName,
      required this.email,
      required this.password,
      required this.birthday,
      required this.gender});

  @override
  State<SignUpScreen2> createState() => _SignUpScreen2State();
}

class _SignUpScreen2State extends State<SignUpScreen2> {
  final SignUp1Controller controller = Get.put(SignUp1Controller());
  final TextEditingController userNameController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.fullWidth * 0.1),
          child: Column(
            children: [
              SizedBox(height: context.fullHeight * 0.06),
              Image.asset(
                CustomImageAsset.logotrustlinkImage,
                fit: BoxFit.contain,
              ),
              SizedBox(height: context.fullHeight * 0.04),
              const Text(kDecide, style: AppTextTheme.displayMediumAlt),
              const Text(kUserProLocation, style: AppTextTheme.authtextreq),
              SizedBox(height: context.fullHeight * 0.03),
              CustomTextField(
                controller: userNameController,
                hintText: kUserName,
                suffixicon: Icons.check_box_rounded,
              ),
              Obx(() {
                return CustomTextField(
                  hintText: kLocation,
                  suffixicon: Icons.location_on,
                  controller: TextEditingController(
                    text: controller.location.value.isNotEmpty
                        ? controller.location.value
                        : 'Please wait, location is fetching...',
                  ),
                );
              }),
              15.height,
              Obx(() {
                return DropdownWidgets.appDropDownView(
                  controller.professions,
                  hintText: kSelectProfession,
                  onChanged: controller.updateSelectedProfession,
                );
              }),
              SizedBox(height: context.fullHeight * 0.07),
              CustomButton(
                text: kNext,
                onPressed: () async {
                  if (userNameController.text.isEmpty ||
                      controller.selectedProfession.value.isEmpty) {
                    Get.snackbar('Error', 'All fields are required.');
                    return;
                  }
                  if (controller.location.value.isEmpty) {
                    Get.snackbar('Error', 'Please fetch your location.');
                    return;
                  }

                  await AuthProvider.signUp(
                    fullName: widget.fullName,
                    email: widget.email,
                    password: widget.password,
                    birthday: widget.birthday,
                    userName: userNameController.text,
                    profession: controller.selectedProfession.value,
                    context: context,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
