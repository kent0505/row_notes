import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

// // state
// abstract class NoteState {}

// class NoteInitial extends NoteState {
//   Map notes = {'My category': []};
// }

// class NoteLoading extends NoteState {}

// class NoteLoaded extends NoteState {
//   late Map notes;
//   NoteLoaded(this.notes);
// }

// class NoteError extends NoteState {
//   late String error;
//   NoteError(this.error);
// }

// cubit
class NoteCubit extends Cubit<Map> {
  NoteCubit(super.initialState);

  List categories = [
    [1, 'Aa', 'Aaa', 'English'],
    [2, 'Bb', 'Bbb', 'Flutter'],
    [3, 'Cc', 'Ccc', 'English'],
  ];

  Map notes = {'My category': []};
  final myBox = Hive.box('mybox');

  Future loadData() async {
    if (myBox.get('NOTES') == null) {
      print('Null!');
      return;
    }
    notes = await myBox.get('NOTES');
  }

  Future updateDatabase() async {
    await myBox.put('NOTES', notes);
  }

  void restoreData() async {
    await loadData();
  }

  void addNewRow(String rowName) async {
    await loadData();
    List newRow = [];
    for (String key in notes.keys) {
      if (key == rowName) {
        return;
      }
    }
    if (rowName != '') {
      notes[rowName] = newRow;
      await updateDatabase();
    }
  }

  void editRow(String rowName, String newName) async {
    await loadData();
    for (String key in notes.keys) {
      if (key == rowName) {
        Map modifiedNotes = {};
        notes.forEach((key, value) {
          String modifiedKey = key.replaceAll(rowName, newName);
          modifiedNotes[modifiedKey] = value;
        });
        notes = modifiedNotes;
        await updateDatabase();
        return;
      }
    }
  }

  void deleteRow(String rowName) async {
    await loadData();
    for (String key in notes.keys) {
      if (key == rowName) {
        notes.remove(rowName);
        await updateDatabase();
        return;
      }
    }
  }

  void addItemToRow(
    int id,
    String title,
    String desc,
    String category,
    bool isNew,
  ) async {
    await loadData();
    if (isNew) {
      DateTime now = DateTime.now();
      int timestampInSeconds = now.millisecondsSinceEpoch ~/ 1000;
      List row = notes[category];
      if (title != '' || desc != '') {
        row.add([timestampInSeconds, title, desc]);
        await updateDatabase();
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
          await updateDatabase();
          return;
        }
      }
    }
  }

  void removeById(int id, String category) async {
    await loadData();
    List row = notes[category];
    row.removeWhere((note) => note[0] == id);
    await updateDatabase();
  }
}
