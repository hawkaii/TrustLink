import 'package:flutter/material.dart';

class LoaderBuilder {
  final BuildContext context;

  LoaderBuilder({required this.context});

  bool _isDialogShown = false;

  void showLoader({String title = "Loading..."}) {
    if (!_isDialogShown) {
      _isDialogShown = true;
      showDialog(
        context: context,
        builder: (c) {
          return AlertDialog(
            content: Row(
              children: [
                const CircularProgressIndicator(),
                const SizedBox(width: 10),
                Text(title),
              ],
            ),
          );
        },
      );
    }
  }

  void dismissLoader() {
    if (_isDialogShown) {
      _isDialogShown = false;
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    }
  }
}
