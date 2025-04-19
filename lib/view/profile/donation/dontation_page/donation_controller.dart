import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trustlink/view/profile/donation/donatin_sucess/don_sucess.dart';

class DonationController extends GetxController {
  final amountController = TextEditingController();
  var selectedMethod = 'UPI'.obs;
  final List<String> paymentMethods = ['UPI', 'Card', 'NetBanking'];

  void donate() {
    final amount = amountController.text.trim();
    if (amount.isEmpty || double.tryParse(amount) == null) {
      Get.snackbar("Invalid Amount", "Please enter a valid amount.",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    Get.defaultDialog(
      title: "Confirm Donation",
      content: Column(
        children: [
          Text("You're about to donate ₹$amount"),
          const SizedBox(height: 10),
          Text("Method: ${selectedMethod.value}"),
        ],
      ),
      textCancel: "Cancel",
      textConfirm: "Donate",
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back();
        Get.to(() => const DonationSuccessPage());
      },
    );
  }
}
