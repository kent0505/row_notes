import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../logic/alerts.dart';
import '../../logic/navigations.dart';
import '../../cubit/note_cubit.dart';
import './widgets/my_button.dart';
import './widgets/text_field.dart';
import './widgets/title_text_field.dart';
import './widgets/bottom_bar.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key, required this.id, required this.title, required this.desc, required this.category, required this.isNew});

  final int id;
  final String title;
  final String desc;
  final String category;
  final bool isNew;

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final titleCon = TextEditingController();
  final descCon = TextEditingController();

  Alerts alert = Alerts();
  Navigations navigator = Navigations();

  // id это timestamp, если конвертировать timestamp то получим дату создания
  late String formattedDate = DateFormat('E, d MMM').format(
    DateTime.fromMillisecondsSinceEpoch(widget.id * 1000),
  );
  late String formattedTime = DateFormat.Hm().format(
    DateTime.fromMillisecondsSinceEpoch(widget.id * 1000),
  );

  // получить текущую дату
  DateTime now = DateTime.now();
  // форматировать эту дату для нужного для нас отображения
  late String currentDate = DateFormat('E, d MMM').format(now);
  late String currentTime = DateFormat.Hm().format(now);

  @override
  void initState() {
    titleCon.text = widget.title;
    descCon.text = widget.desc;
    super.initState();
  }

  @override
  void dispose() {
    titleCon.dispose();
    descCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NoteCubit>();

    return BlocBuilder<NoteCubit, Map>(
      builder: (context, state) {
        return WillPopScope(
          // если нажать на кнопку назад на устройстве, то измененные заметки сохранятся
          onWillPop: () async {
            cubit.addItemToRow(widget.id, titleCon.text, descCon.text, widget.category, widget.isNew);
            navigator.navigate(context, '/home');
            // если false то возвращаться назад можно только через навигатор
            return false;
          },
          child: Scaffold(
            bottomNavigationBar: bottomBar(
              // если создать новую заметку то появится текущая дата и время
              // если изменить существующую заметку то будет показываться дата и время этой заметки
              widget.isNew ? currentDate : formattedDate,
              widget.isNew ? currentTime : formattedTime,
            ),
            body: SafeArea(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        // высота должна быть 70 так как там будут кнопки
                        const SizedBox(height: 70),
                        titleTextField(titleCon),
                        // в будещем true будет меняться, если будет false то TextField будет не доступным и пользователю будет удобно читать заметки
                        textField(descCon, true),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          myButton(
                            Icons.arrow_back,
                            () {
                              // кнопка назад вызывается ту же функцию как и on will pop
                              cubit.addItemToRow(widget.id, titleCon.text, descCon.text, widget.category, widget.isNew);
                              navigator.navigate(context, '/home');
                            },
                          ),
                          const Spacer(),
                          // если заметка уже существует то будет кнопка для удаления
                          if (widget.isNew == false) ...[
                            myButton(
                              Icons.delete,
                              () {
                                // перед удалением показывается окошко где нужно поддтвердить удаление
                                alert.showAlertDialog(
                                  context,
                                  'Delete this note?',
                                  () {
                                    cubit.removeById(
                                      widget.id,
                                      widget.category,
                                    );
                                    navigator.navigate(context, '/home');
                                  },
                                );
                              },
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
