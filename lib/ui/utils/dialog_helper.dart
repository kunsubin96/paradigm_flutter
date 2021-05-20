import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogHelper {
  static show(context, Widget dialog, {barrierDismissible}) {
    showDialog(
      barrierDismissible: barrierDismissible ?? false,
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }
  static hide(context) {
    Navigator.of(context).pop();
  }
}
