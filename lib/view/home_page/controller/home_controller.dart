// import 'package:get/get.dart';
// import '../../../data/response/status.dart';
// import '../../../models/home/user_list_model.dart';
// import '../../../repository/home_repo/home_repository.dart';
//
// class HomeController extends GetxController {
//   final _api = HomeRepository();
//
//   final rxRequestStatus = Status.LOADING.obs;
//   final userList = UserListModel().obs;
//   RxString error = ''.obs;
//
//   void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
//   void setUserList(UserListModel value) => userList.value = value;
//   void setError(String value) => error.value = value;
//
//   void userListApi() {
//     //  setRxRequestStatus(Status.LOADING);
//
//     _api.userListApi().then((value) {
//       setRxRequestStatus(Status.COMPLETED);
//       setUserList(value);
//     }).onError((error, stackTrace) {
//       setError(error.toString());
//       setRxRequestStatus(Status.ERROR);
//     });
//   }
//
//   void refreshApi() {
//     setRxRequestStatus(Status.LOADING);
//
//     _api.userListApi().then((value) {
//       setRxRequestStatus(Status.COMPLETED);
//       setUserList(value);
//     }).onError((error, stackTrace) {
//       setError(error.toString());
//       setRxRequestStatus(Status.ERROR);
//     });
//   }
// }
