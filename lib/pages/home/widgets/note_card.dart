import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../note/note_page.dart';

Widget noteCard(
  BuildContext context,
  int id,
  String title,
  String desc,
  String category,
) {
  String formattedDate = DateFormat('E, d MMM').format(
    DateTime.fromMillisecondsSinceEpoch(id * 1000),
  );

  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return NotePage(
              id: id,
              title: title,
              desc: desc,
              category: category,
              isNew: false,
            );
          },
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 110,
          width: 110,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xff252525), //
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title.isNotEmpty) ...[
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xff858585),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
              const SizedBox(height: 4),
              Text(
                desc,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xff858585),
                  fontSize: 14,
                ),
              ),
              const Expanded(child: SizedBox()),
              Text(
                formattedDate,
                style: const TextStyle(
                  color: Color(0xff464646),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
