import 'package:flutter/material.dart';

Widget pincodeField(TextEditingController controller, String pincode) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: Container(
      height: 50,
      width: 260,
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          enabled: false,
          obscureText: true,
          style: const TextStyle(
            fontSize: 20,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 30),
          ),
        ),
      ),
    ),
  );
}
