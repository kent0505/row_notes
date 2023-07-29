import 'package:flutter_bloc/flutter_bloc.dart';

class TestCubit extends Cubit<List> {
  TestCubit(super.initialState);

  List widgets = [
    ['text', 'Aa'],
    // ['image', 'assets/logo.png'],
    ['text', 'Bb'],
    ['text', 'Cc'],
    ['text', 'Dd'],
    ['text', 'Ee'],
  ];

  void restoreData() {
    emit(widgets);
  }

  void addToList(String text) {
    if (text != '') {
      widgets.add(['text', text]);
      emit(List.from(widgets));
    }
  }
}
