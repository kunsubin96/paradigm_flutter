import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetUtils {
  static void showDialogInfo(context, String title, String content) {
    // set up the AlertDialog
    if (!Platform.isIOS) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: (title != null && title.length > 0)
                ? Text(title, style: TextStyle(fontSize: 18.0))
                : null,
            content: Text(content, style: TextStyle(fontSize: 17.0)),
            contentPadding: EdgeInsets.only(
                top: 24.0, left: 24.0, right: 24.0, bottom: 5.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            actions: [
              FlatButton(
                child: Text(
                  "OK",
                  style: TextStyle(fontSize: 17.0),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // todo : showDialog for ios
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: (title != null && title.length > 0)
              ? Text(title, style: TextStyle(fontSize: 18.0))
              : null,
          content: Text(content, style: TextStyle(fontSize: 17.0)),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(
                "OK",
                style: TextStyle(fontSize: 17.0),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }
}
