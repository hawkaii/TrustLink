import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tienext/res/constants/string.dart';
import 'package:tienext/res/extensions/int_extensions.dart';
import 'package:tienext/res/extensions/media_query_extensions.dart';
import 'package:tienext/res/extensions/validation_extensions.dart';
import 'package:tienext/res/widgets/custom_button_widget.dart';
import 'package:tienext/res/widgets/custom_text_field.dart';
import 'package:tienext/view/auth/signup/signup_2.dart';
import 'package:tienext/view/setting/privacy_policy.dart';
import '../../../provider/auth_provider.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/builders/date_time_builder.dart';
import '../../../res/constants/colors.dart';
import '../../../res/constants/text_theme.dart';
import '../login/login_page.dart';
import 'controller/signup1_controller.dart';

class SignUpScreen1 extends StatefulWidget {
  const SignUpScreen1({super.key});

  @override
  State<SignUpScreen1> createState() => _SignUpScreen1State();
}

class _SignUpScreen1State extends State<SignUpScreen1> {
  final SignUp1Controller controller = Get.put(SignUp1Controller());
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailPhoneController.dispose();
    passwordController.dispose();
    birthdayController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controller.getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.fullWidth * 0.1),
          child: Column(
            children: [
              SizedBox(height: context.fullHeight * 0.05),
              Image.asset(
                CustomImageAsset.logoTieNextImage,
                fit: BoxFit.contain,
              ),
              SizedBox(height: context.fullHeight * 0.03),
              const Text(kLetsJourney,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const Text(kCreateAccount,
                  style: TextStyle(fontSize: 16, color: AppColors.grey500)),
              SizedBox(height: context.fullHeight * 0.02),
              CustomTextField(
                controller: fullNameController,
                hintText: kName,
                onChanged: (value) => controller.name.value = value,
              ),
              CustomTextField(
                controller: emailPhoneController,
                hintText: kEnterPhone,
                onChanged: (value) => controller.emailOrPhone.value = value,
              ),
              Consumer<AuthProvider>(
                builder: (context, authProvider, child) {
                  return CustomTextField(
                    controller: passwordController,
                    hintText: kPassword,
                    obscureText: !authProvider.isPasswordVisible,
                    suffixIcon: IconButton(
                      icon: Icon(authProvider.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: authProvider.togglePasswordVisibility,
                    ),
                  );
                },
              ),
              Obx(
                () => CustomTextField(
                  hintText: kDOB,
                  controller: TextEditingController(
                    text: controller.selectedDateOfBirth.value,
                  ),
                  readOnly: true,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () async {
                      final dateTimeBuilder = DateTimeBuilder(context: context);
                      DateTime? pickedDate =
                          await dateTimeBuilder.showDatePickerView(
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        controller.updateDateOfBirth(
                          '${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}',
                        );
                      }
                    },
                  ),
                ),
              ),
              10.height,
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  kGender,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GenderRadioButton(
                      label: kMale,
                      isSelected: controller.selectedGender.value == kMale,
                      onTap: () => controller.updateGender(kMale),
                    ),
                    GenderRadioButton(
                      label: kFemale,
                      isSelected: controller.selectedGender.value == kFemale,
                      onTap: () => controller.updateGender(kFemale),
                    ),
                    GenderRadioButton(
                      label: kOthers,
                      isSelected: controller.selectedGender.value == kOthers,
                      onTap: () => controller.updateGender(kOthers),
                    ),
                  ],
                ),
              ),
              20.height,
              CustomButton(
                text: kNext,
                onPressed: () async {
                  if (fullNameController.text.isEmpty ||
                      emailPhoneController.text.isEmpty ||
                      controller.selectedGender.value.isEmpty ||
                      passwordController.text.isEmpty ||
                      controller.selectedDateOfBirth.value.isEmpty) {
                    "All fields are required".showToast();
                    return;
                  }
                  final dob = DateTime.parse(controller.selectedDateOfBirth.value);
                  final currentDate = DateTime.now();
                  final age = currentDate.year - dob.year -
                      ((currentDate.month < dob.month ||
                          (currentDate.month == dob.month && currentDate.day < dob.day)) ? 1 : 0);
                  if (age < 12) {
                    "You must be at least 12 years old to create an account.".showToast();
                    return;
                  }
                  Get.to(
                        () => SignUpScreen2(
                      email: emailPhoneController.text,
                      password: passwordController.text,
                      fullName: fullNameController.text,
                      gender: controller.selectedGender.value,
                      birthday: controller.selectedDateOfBirth.value,
                    ),
                    transition: Transition.rightToLeft,
                  );
                },
              ),
              SizedBox(height: context.fullHeight * 0.03),
              GestureDetector(
                onTap: () {
                  Get.to(const PrivacyCentreScreen());
                },
                child: Text.rich(
                  TextSpan(
                    text: kAgreeTienext,
                    style: AppTextTheme.bodySmall,
                    children: [
                      const TextSpan(
                        text: kTermsUse,
                        style: AppTextTheme.bodySmallred,
                      ),
                      const TextSpan(
                        text: kAcknowledge,
                        style: AppTextTheme.bodySmall,
                      ),
                      const TextSpan(
                        text: kPrivacyPolicy,
                        style: AppTextTheme.bodySmallred,
                      ),
                      TextSpan(
                        text: ".",
                        style: TextStyle(
                          fontSize: context.fullHeight * 0.015,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              20.height,
              GestureDetector(
                onTap: () {
                  Get.to(const LoginScreen());
                },
                child: const Text.rich(
                  TextSpan(
                    text: kAlreadyHaveAccount,
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: kLogin,
                        style: TextStyle(
                            color: AppColors.redColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GenderRadioButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderRadioButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Radio(
            value: label,
            groupValue: isSelected ? label : null,
            onChanged: (_) => onTap(),
          ),
          Text(label),
        ],
      ),
    );
  }
}
