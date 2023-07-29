import 'package:flutter/material.dart';

Widget myButton(IconData icon, VoidCallback func) {
  return Material(
    elevation: 1,
    borderRadius: BorderRadius.circular(10),
    child: InkWell(
      borderRadius: BorderRadius.circular(10),
      splashFactory: InkRipple.splashFactory,
      radius: 500,
      onTap: func,
      child: Ink(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff333333),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    ),
  );
}
