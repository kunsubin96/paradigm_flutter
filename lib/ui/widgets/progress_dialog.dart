import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {

  const ProgressDialog();

  static show(context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const ProgressDialog();
      },
    );
  }

  static hide(context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Container(
            width: 70.0,
            height: 70.0,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            ),
            child: Stack(
              children: [
                Center(
                    child: SizedBox(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                  ),
                  height: 50.0,
                  width: 50.0,
                )),
                Center(
                    child: Image.asset(
                  "assets/images/logo.png",
                  width: 25.0,
                  height: 25.0,
                ))
              ],
            )),
      ),
    );
  }
}