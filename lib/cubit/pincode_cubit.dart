import 'package:flutter_bloc/flutter_bloc.dart';

class PincodeCubit extends Cubit<String> {
  PincodeCubit(super.initialState);

  String pincode = '';

  void enterNumber(String number) {
    emit(pincode = number);
  }
}
