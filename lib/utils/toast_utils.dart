import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static showErrorToast(String message) {
    return Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
    );
  }
}
