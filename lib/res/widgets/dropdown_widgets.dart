import 'package:flutter/material.dart';

class DropdownWidgets {
  static Widget appDropDownView(List<String> items,
      {required void Function(dynamic)? onChanged, String? hintText}) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
      items: items
          .map((item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      ))
          .toList(),
      onChanged: onChanged,
    );
  }
}
