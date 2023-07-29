import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/alerts.dart';
import '../../logic/navigations.dart';
import '../../cubit/note_cubit.dart';
import '../note/widgets/my_button.dart';
import './widgets/category_field.dart';
import './widgets/save_button.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key, required this.category, required this.isNew});

  final String category;
  final bool isNew;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final categoryCon = TextEditingController();
  final navigator = Navigations();
  final alert = Alerts();

  @override
  void initState() {
    categoryCon.text = widget.category;
    super.initState();
  }

  @override
  void dispose() {
    categoryCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NoteCubit>();

    return BlocBuilder<NoteCubit, Map>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          myButton(
                            Icons.arrow_back,
                            () {
                              navigator.pop(context);
                            },
                          ),
                          const Spacer(),
                          // если категория уже существует то будет кнопка для удаления
                          if (widget.isNew == false) ...[
                            myButton(
                              Icons.delete,
                              () {
                                alert.showAlertDialog(
                                  context,
                                  'Delete this category?',
                                  () {
                                    cubit.deleteRow(widget.category);
                                    navigator.navigate(context, '/home');
                                  },
                                );
                              },
                            ),
                          ],
                        ],
                      ),
                    ),
                    categoryField(categoryCon),
                    // если это новая категория
                    if (widget.isNew) ...[
                      saveButton(
                        'Create',
                        () {
                          cubit.addNewRow(categoryCon.text);
                          navigator.navigate(context, '/home');
                        },
                      ),
                    ] else ...[
                      // если это уже существующая категория
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          saveButton(
                            'Edit',
                            () {
                              cubit.editRow(widget.category, categoryCon.text);
                              navigator.navigate(context, '/home');
                            },
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
