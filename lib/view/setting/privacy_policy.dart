import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/constants/colors.dart';

class PrivacyCentreScreen extends StatelessWidget {
  const PrivacyCentreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text(
          'Privacy Centre',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _faqContainer(
                child: _faqItem(
                  title: "What is privacy policy and what does it cover?",
                  content:
                      "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested",
                ),
              ),
              const SizedBox(height: 10),
              _faqContainer(
                child: _faqItem(
                  title:
                      "What information does Tienext collect & how it is used?",
                  content:
                      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\n\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.",
                ),
              ),
              const SizedBox(height: 10),
              _faqContainer(
                child: _faqItem(
                  title:
                      "How can you manage your information and exercise your rights?",
                  content:
                      "You can manage your information by following the privacy policy and exercising your rights by visiting our website, engaging with our customer support team, or contacting our privacy department. For more information, please review our privacy policy.",
                ),
              ),
              const SizedBox(height: 10),
              _faqContainer(
                child: _faqItem(
                  title: "What are the terms of usage?",
                  content:
                      "The terms of usage for Tienext are available on our website. Please review them before using our website.",
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // FAQ Item Widget
  Widget _faqItem({
    required String title,
    String? content,
  }) {
    return ExpansionTile(
      collapsedIconColor: Colors.black54,
      iconColor: Colors.teal,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      children: [
        if (content != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              content,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
                height: 1.5,
              ),
            ),
          ),
      ],
    );
  }

  // Container Wrapper for FAQ Item
  Widget _faqContainer({
    required Widget child,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
        ),
      ),
      child: child,
    );
  }
}
