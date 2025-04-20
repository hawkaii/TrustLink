import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trustlink/view/profile/donation/donatin_sucess/tranjection_sleep.dart';

class DonationSuccessPage extends StatelessWidget {
  const DonationSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Icon(Icons.check_circle, size: 200, color: Colors.green),
              const SizedBox(height: 30),
              const Text(
                "Thank You!",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "We appreciate your support and generosity.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                      Get.back();
                      Get.back();
                    },
                    child: const Text(
                      "Back",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => const TransactionDetailsPage());
                    },
                    child: const Text(
                      "View tranjection",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
