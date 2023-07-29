import 'package:flutter/material.dart';

Widget numberButton(String number, VoidCallback func) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashFactory: InkRipple.splashFactory,
        radius: 500,
        onTap: func,
        child: Ink(
          height: 50,
          width: 70,
          decoration: BoxDecoration(
            color: number != '' ? Colors.grey[850] : Colors.grey[900],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: number != ''
                ? Text(
                    number,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[400],
                    ),
                  )
                : const Icon(
                    Icons.backspace,
                    size: 20,
                  ),
          ),
        ),
      ),
    ),
  );
}
