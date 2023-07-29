import 'package:flutter/material.dart';

Widget titleTextField(TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    child: TextField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      style: const TextStyle(
        fontSize: 24,
        color: Color(0xffcccccc),
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.only(left: 10),
        border: InputBorder.none,
        hintText: 'Title',
        hintStyle: TextStyle(
          fontSize: 24,
          color: Color(0xff858585),
          fontFamily: 'Raleway',
        ),
      ),
    ),
  );
}
