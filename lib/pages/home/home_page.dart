import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/note_cubit.dart';
import '../drawer/my_drawer.dart';
import '../note/widgets/my_button.dart';
import './widgets/add_button.dart';
import './widgets/add_row_button.dart';
import './widgets/category_text.dart';
import './widgets/note_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NoteCubit>();

    return Scaffold(
      drawer: myDrawer(),
      body: SafeArea(
        // используется stack чтобы кнопка drawer был сверху контента
        child: Stack(
          children: [
            BlocBuilder<NoteCubit, Map>(
              builder: (context, state) {
                return InteractiveViewer.builder(
                  maxScale: 1.0,
                  minScale: 1.0,
                  builder: (context, viewport) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // высота 80 потому что есть кнопка drawer
                          const SizedBox(height: 80),
                          // делает for loop всех категорий
                          for (var category in cubit.notes.keys) ...[
                            categoryText(context, category),
                            Row(
                              children: [
                                // делает for loop чтобы показать заметок в ряд по категориям
                                for (var index in cubit.notes[category]) ...[
                                  noteCard(context, index[0], index[1], index[2], category)
                                ],
                                // в конце ряда будет кнопка для добавления новых заметок в этот же ряд
                                addButton(context, category),
                                const SizedBox(width: 110, height: 110),
                              ],
                            ),
                          ],
                          // в конце всех рядов будет кнопка для добавления нового ряда (категория)
                          addRowButton(context),
                          const SizedBox(width: 110, height: 110),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            // используется builder чтобы можно было открывать drawer через код
            Builder(
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: myButton(
                      Icons.menu,
                      () {
                        // открывает drawer
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
