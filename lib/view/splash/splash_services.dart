// import 'dart:async';
// import 'package:get/get.dart';
//
// import '../../routes/routes_name.dart';
// import '../controller/user_pref_controller.dart';
//
// class SplashServices {
//   UserPreference userPreference = UserPreference();
//
//   void isLogin() {
//     userPreference.getUser().then((value) {
//
//       if (value?.isLogin == false || value?.isLogin.toString() == 'null') {
//         Timer(
//             const Duration(seconds: 3), () => Get.toNamed(RouteName.loginView));
//       } else {
//         Timer(
//             const Duration(seconds: 3), () => Get.toNamed(RouteName.homeView));
//       }
//     });
//   }
// }
