import 'package:flutter/material.dart';

Widget momentItem(String archiImage, String iconImage) {
  return Padding(
    padding: const EdgeInsets.only(right: 8.0, bottom: 20.0),
    child: Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(231, 237, 242, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              iconImage,
              height: 70,
            ),
          ),
          Positioned(
            top: 4,
            left: 4,
            child: Image.asset(
              archiImage,
              height: 40,
              width: 40,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    ),
  );
}
