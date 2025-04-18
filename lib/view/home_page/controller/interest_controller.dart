import 'package:get/get.dart';

class InterestController extends GetxController {
  RxList<bool> selectedInterests = <bool>[].obs;

  void initializeSelection(int length) {
    selectedInterests.value = List.generate(length, (_) => false);
  }

  void toggleSelection(int index) {
    selectedInterests[index] = !selectedInterests[index];
  }
}
