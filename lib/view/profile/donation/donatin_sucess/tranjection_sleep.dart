import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionDetailsPage extends StatelessWidget {
  const TransactionDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
            Get.back();
          },
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.yellow,
                  radius: 10,
                  child: Text('🐤', style: TextStyle(fontSize: 12)),
                ),
                SizedBox(width: 6),
                Text(
                  "Chirpy Chick",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              "0x07D9...51C8",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Center(
              child: Text(
                "Sepolia",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),

            /// Send Icon + Amount Info
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade700,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.send, color: Colors.black),
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Send 1.0 STRK",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "To: 0x0394...6E83",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "April 20, 2025 at 12:02 AM",
                      style: TextStyle(fontSize: 13, color: Colors.black),
                    ),
                  ],
                )
              ],
            ),

            const SizedBox(height: 30),

            /// Token Info Card
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 214, 212, 212),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(
                        "https://seeklogo.com/vector-logo/610287/starknet-strk-icon"), // replace with local asset if needed
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Starknet",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "-1.0 STRK",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "\$0.13",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// Tx Status & Tx Details
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 214, 212, 212),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tx Status", style: TextStyle(color: Colors.black)),
                      Text("Success", style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tx Details", style: TextStyle(color: Colors.black)),
                      Text("0x02eB...e15a",
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
