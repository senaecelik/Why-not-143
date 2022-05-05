import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(BuildContext context, String text) {
  Fluttertoast.showToast(
    msg: text,
    gravity: ToastGravity.TOP,
  );
}
