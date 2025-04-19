import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienext/view/profile/donation/donatin_sucess/don_sucess.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({super.key});

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  final TextEditingController _amountController = TextEditingController();
  final List<String> paymentMethods = ['UPI', 'Card', 'NetBanking'];
  String selectedMethod = 'UPI';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Donate"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Support our mission by donating any amount.\nYour help matters ❤️",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),

            // Amount Field
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter amount (₹)",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.currency_rupee),
              ),
            ),

            const SizedBox(height: 20),

            // Payment Method
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select Payment Method",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: paymentMethods.map((method) {
                return ChoiceChip(
                  label: Text(method),
                  selected: selectedMethod == method,
                  onSelected: (_) {
                    setState(() => selectedMethod = method);
                  },
                );
              }).toList(),
            ),

            const Spacer(),

            // Donate Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.volunteer_activism),
                label: const Text("Donate Now"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.teal,
                ),
                onPressed: _donate,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _donate() {
    final amount = _amountController.text.trim();
    if (amount.isEmpty || double.tryParse(amount) == null) {
      Get.snackbar("Invalid Amount", "Please enter a valid donation amount.",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    Get.defaultDialog(
      title: "Confirm Donation",
      content: Column(
        children: [
          Text("You're about to donate ₹$amount"),
          const SizedBox(height: 10),
          Text("Payment Method: $selectedMethod"),
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
