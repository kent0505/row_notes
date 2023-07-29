import 'package:flutter/material.dart';

import './widgets/pincode_field.dart';
import './widgets/number_button.dart';

class PincodePage extends StatefulWidget {
  const PincodePage({super.key});

  @override
  State<PincodePage> createState() => _PincodePageState();
}

class _PincodePageState extends State<PincodePage> {
  final pinCon = TextEditingController();

  @override
  void dispose() {
    pinCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 270,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  pincodeField(pinCon, '1'),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: numberButton('', () {}),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  numberButton('1', () {}),
                  numberButton('2', () {}),
                  numberButton('3', () {}),
                ],
              ),
              Row(
                children: [
                  numberButton('4', () {}),
                  numberButton('5', () {}),
                  numberButton('6', () {}),
                ],
              ),
              Row(
                children: [
                  numberButton('7', () {}),
                  numberButton('8', () {}),
                  numberButton('9', () {}),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  numberButton('0', () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
