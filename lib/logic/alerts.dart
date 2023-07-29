import 'package:flutter/material.dart';

class Alerts {
  showAlertDialog(BuildContext context, String text, VoidCallback yes) {
    Widget cancelButton = TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        'Cancel',
        style: TextStyle(
          color: Colors.grey[400],
          fontWeight: FontWeight.w600,
        ),
      ),
    );

    Widget continueButton = TextButton(
      onPressed: yes,
      child: Text(
        'Yes',
        style: TextStyle(
          color: Colors.grey[400],
          fontWeight: FontWeight.w600,
        ),
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
          actions: [
            cancelButton,
            continueButton,
          ],
        );
      },
    );
  }
}
