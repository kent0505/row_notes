import 'package:flutter/material.dart';

Widget bottomBar(String date, String time) {
  return Container(
    color: const Color(0xff333333),
    height: 50,
    child: Row(
      children: [
        const SizedBox(width: 14),
        // date
        Text(
          date,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        const Spacer(),
        // time
        Text(
          time,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 14),
      ],
    ),
  );
}
