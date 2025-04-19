import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trustlink/res/assets/image_assets.dart';
import 'package:trustlink/view/profile/donation/donatin_sucess/don_sucess.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({super.key});

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text("Donate"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Container(
              height: 100,
              width: 100,
              child: const CircleAvatar(
                backgroundImage: AssetImage(
                  CustomImageAsset.mountains,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Anurag singh",
              // "Support our mission by donating any amount.\nYour help matters ❤️",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)),
                child: const Padding(
                  padding:
                      EdgeInsets.only(left: 10.0, right: 10, top: 5, bottom: 5),
                  child: Text("To:0x0394...6E83"),
                )),
            const SizedBox(height: 20),

            // Amount Field
            Container(
              width: 100,
              child: Center(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500), // 👈 Large text
                  decoration: const InputDecoration(
                    hintText: " 0.00",

                    //border: OutlineInputBorder(),
                    prefixIcon: Icon(FontAwesomeIcons.dollarSign),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 0.0,
                    ),

                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            //const Spacer(),

            // Donate Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.volunteer_activism,
                  color: Colors.white,
                  size: 20,
                ),
                label: const Text(
                  "Donate Now",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 11),
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
          snackPosition: SnackPosition.TOP, colorText: Colors.black);
      return;
    }

    Get.defaultDialog(
      title: "Confirm Donation",
      content: Column(
        children: [
          Text("You're about to donate \$$amount"),
          const SizedBox(height: 10),
          const Text("Payment Method: starknet"),
        ],
      ),
      textCancel: "Cancel",
      textConfirm: "Donate",
      backgroundColor: const Color.fromARGB(255, 147, 218, 211),
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back();
        Get.to(() => const DonationSuccessPage());
      },
    );
  }
}
