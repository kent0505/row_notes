import 'package:flutter/material.dart';

class Navigations {
  void navigate(BuildContext context, String route) {
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }

  void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
