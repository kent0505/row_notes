import 'package:flutter/material.dart';

Widget myDrawer() {
  return Drawer(
    backgroundColor: const Color(0xff252525),
    child: ListView(
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Color(0xff1e1e1e),
          ),
          child: Column(
            children: [
              const SizedBox(height: 15),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/logo2.png', height: 70),
              ),
              const SizedBox(height: 15),
              const Text(
                'Row Notes',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Raleway',
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
