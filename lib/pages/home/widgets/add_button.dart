import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../note/note_page.dart';

Widget addButton(BuildContext context, String category) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return NotePage(
              id: 0,
              title: '',
              desc: '',
              category: category,
              isNew: true,
            );
          },
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
      child: DottedBorder(
        color: Colors.grey[700]!,
        borderType: BorderType.RRect,
        radius: const Radius.circular(10),
        dashPattern: const [6, 8],
        child: SizedBox(
          height: 90,
          width: 90,
          child: Center(
            child: Icon(
              Icons.add_rounded,
              color: Colors.grey[700], //
              size: 40,
            ),
          ),
        ),
      ),
    ),
  );
}
