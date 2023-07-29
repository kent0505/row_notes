import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NoteCubit extends Cubit<Map> {
  NoteCubit(super.initialState);

  Map notes = {'My category': []};
  final myBox = Hive.box('mybox');

  Future loadData() async {
    // если бд пустая то ничего не делает
    if (myBox.get('NOTES') == null) {
      print('Null!');
      return;
    }
    // если не пустая то добавляет в переменную
    notes = await myBox.get('NOTES');
  }

  Future updateDatabase() async {
    await myBox.put('NOTES', notes);
  }

  void restoreData() async {
    // это функция выполняется когда приложение меняет стейт
    await loadData(); // загружает данные
  }

  void addNewRow(String rowName) async {
    await loadData(); // загружает данные
    List newRow = [];
    for (String key in notes.keys) {
      if (key == rowName) {
        return;
      }
    }
    if (rowName != '') {
      notes[rowName] = newRow;
      await updateDatabase(); // обновляет базу данных
    }
  }

  void editRow(String rowName, String newName) async {
    await loadData(); // загружает данные
    for (String key in notes.keys) {
      if (key == rowName) {
        Map modifiedNotes = {};
        notes.forEach((key, value) {
          String modifiedKey = key.replaceAll(rowName, newName);
          modifiedNotes[modifiedKey] = value;
        });
        notes = modifiedNotes;
        await updateDatabase(); // обновляет базу данных
        return;
      }
    }
  }

  void deleteRow(String rowName) async {
    await loadData(); // загружает данные
    for (String key in notes.keys) {
      if (key == rowName) {
        notes.remove(rowName);
        await updateDatabase(); // обновляет базу данных
        return;
      }
    }
  }

  void addItemToRow(int id, String title, String desc, String category, bool isNew) async {
    await loadData(); // загружает данные
    if (isNew) {
      DateTime now = DateTime.now();
      int timestampInSeconds = now.millisecondsSinceEpoch ~/ 1000;
      List row = notes[category];
      if (title != '' || desc != '') {
        row.add([timestampInSeconds, title, desc]);
        await updateDatabase(); // обновляет базу данных
      }
    } else {
      for (var row in notes[category]) {
        if (row[1] == title && row[2] == desc) {
          print('Not saved!');
          return;
        } else if (row[0] == id) {
          row[1] = title;
          row[2] = desc;
          print('Saved data!');
          await updateDatabase(); // обновляет базу данных
          return;
        }
      }
    }
  }

  void removeById(int id, String category) async {
    await loadData(); // загружает данные
    List row = notes[category]; // выбирает нужную категорию
    row.removeWhere((note) => note[0] == id); // из этой категории убирает заметку по заданному айди
    await updateDatabase(); // обновляет базу данных
  }
}
