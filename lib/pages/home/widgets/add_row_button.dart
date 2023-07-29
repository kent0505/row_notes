import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../category/category_page.dart';

Widget addRowButton(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const CategoryPage(category: '', isNew: true);
          },
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      child: DottedBorder(
        color: Colors.grey[700]!,
        borderType: BorderType.RRect,
        radius: const Radius.circular(10),
        dashPattern: const [6, 8],
        child: SizedBox(
          height: 90,
          width: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 25),
              SizedBox(
                child: Icon(
                  Icons.add,
                  color: Colors.grey[700], //
                  size: 40,
                ),
              ),
              SizedBox(
                height: 25,
                child: Text(
                  'Category',
                  style: TextStyle(
                    color: Colors.grey[700], //
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
