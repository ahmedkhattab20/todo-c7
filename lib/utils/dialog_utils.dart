import 'package:flutter/material.dart';

class DialogUtils {
  static void ShowLoadingDialog(BuildContext context, String message,
      {bool isDismissible = false}) {
    showDialog(
        context: context,
        builder: (buildeContext) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  width: 10,
                ),
                Text(message),
              ],
            ),
          );
        },
        barrierDismissible: false);
  }

  static void ShowMessage(BuildContext context, String message,
      {String? posActiontitle,
      VoidCallback? posAction,
      String? negActiontitle,
      VoidCallback? negAction}) {
    showDialog(
        context: context,
        builder: (buildContext) {
          List<Widget> actions = [];
          if (posActiontitle != null) {
            actions.add(TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (posAction != null) {
                    posAction();
                  }
                },
                child: Text(posActiontitle)));
          }
          if (negActiontitle != null) {
            actions.add(TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (negAction != null) {
                    negAction();
                  }
                },
                child: Text(negActiontitle)));
          }
          return AlertDialog(
            content: Text(message),
            actions: actions,
          );
        });
  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
