import 'package:get/get.dart';

class NotificationController extends GetxController {
  var dropdownValue = "Yes".obs;
  var mentionDropdownValue = "Nobody".obs;

  var messagesNotification = true.obs;
  var followsNotification = true.obs;
  var otherNotification = true.obs;

  void toggleDropdown(String value) {
    dropdownValue.value = value;
  }

  void toggleMessagesNotification(bool value) {
    messagesNotification.value = value;
  }

  void toggleFollowsNotification(bool value) {
    followsNotification.value = value;
  }

  void toggleOtherNotification(bool value) {
    otherNotification.value = value;
  }
}
