import 'package:flutter/material.dart';

Widget textField(TextEditingController controller, bool isEnabled) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: TextField(
      controller: controller,
      enabled: isEnabled,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.multiline,
      minLines: 20,
      maxLines: null,
      style: const TextStyle(
        fontSize: 16,
        color: Color(0xff858585),
      ),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.only(left: 10),
        border: InputBorder.none,
        hintText: 'Description...',
        hintStyle: TextStyle(
          fontSize: 16,
          color: Color(0xff858585),
        ),
      ),
    ),
  );
}
