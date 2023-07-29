import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../cubit/test_cubit.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final textCon = TextEditingController();

  Future<File?> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return null;

    return File(pickedFile.path);
  }

  @override
  void dispose() {
    textCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestCubit, List>(
      builder: (context, state) {
        final cubit = context.read<TestCubit>();

        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cubit.widgets.length,
                  itemBuilder: (BuildContext context, int index) {
                    final widgetType = cubit.widgets[index][0];
                    final widgetData = cubit.widgets[index][1];

                    if (widgetType == 'text') {
                      return GestureDetector(
                        onTap: () {
                          print(index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(widgetData),
                        ),
                      );
                    } else if (widgetType == 'image') {
                      return Image.asset(widgetData);
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              textField(textCon),
              addButton(() {
                cubit.addToList(textCon.text);
                textCon.clear();
              }),
              addImage(() async {
                _pickImage();
              }),
            ],
          ),
        );
      },
    );
  }

  Widget textField(TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        color: Colors.grey[800],
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget addButton(VoidCallback func) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Builder(builder: (context) {
        return MaterialButton(
          onPressed: func,
          color: Colors.redAccent,
          child: const Text('Add'),
        );
      }),
    );
  }

  Widget addImage(VoidCallback func) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Builder(builder: (context) {
        return MaterialButton(
          onPressed: func,
          color: Colors.greenAccent,
          child: const Text('Add'),
        );
      }),
    );
  }
}
