import 'package:fluttertoast/fluttertoast.dart';

extension ValidationExtensions on String {

  double toDouble() => double.parse(this);
  int toInt() => int.parse(this);
  Uri toUri() => Uri.parse(this);

  Future<bool?> showToast() => Fluttertoast.showToast(msg: this);

  String? defaultValidator() {
    if (isEmpty) {
      return "This field is required";
    } else {
      return null;
    }
  }

  String? emailValidator() {
    if (isEmpty) {
      return 'Email is Required';
    }
    if (!RegExp(
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(this)) {
      return 'Please enter a valid email Address';
    }
    return null;
  }

  String? phoneValidator() {
    if (length <= 9) {
      return "Please enter a valid number";
    } else {
      return null;
    }
  }

  static var pinRegExp = RegExp("[1-9][0-9]{5}");
  String? pinCodeValidator() {
    if (!pinRegExp.hasMatch(this)) {
      return "Please enter a valid pin code";
    } else {
      return null;
    }
  }

  String? ageValidator() {
    if (isEmpty) {
      return "Please enter age";
    } else {
      return null;
    }
  }

  // Password Validation
  String? passwordValidator() {
    if (isEmpty) {
      return "Password is required";
    }
    if (length < 6) {
      return "Password must be at least 6 characters long";
    }
    if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(this)) {
      return "Password must contain at least one uppercase letter";
    }
    if (!RegExp(r'^(?=.*?[a-z])').hasMatch(this)) {
      return "Password must contain at least one lowercase letter";
    }
    if (!RegExp(r'^(?=.*?[0-9])').hasMatch(this)) {
      return "Password must contain at least one number";
    }
    if (!RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(this)) {
      return "Password must contain at least one special character";
    }
    return null;
  }
}
