import 'package:flutter/material.dart';

import '../../category/category_page.dart';

Widget categoryText(BuildContext context, String category) {
  return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return CategoryPage(category: category, isNew: false);
            },
          ),
        );
      },
      child: Text(
        category,
        style: const TextStyle(
          color: Color(0xff858585),
        ),
      ),
    ),
  );
}
