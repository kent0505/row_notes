import 'package:flutter/material.dart';

Widget categoryField(TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Container(
      decoration: BoxDecoration(
        color: const Color(0xff333333), //
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          fontSize: 16, //
          color: Color(0xffcccccc),
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 10),
          border: InputBorder.none,
          hintText: 'Category',
          hintStyle: TextStyle(
            fontSize: 16, //
            color: Colors.grey[600], //
          ),
        ),
      ),
    ),
  );
}
