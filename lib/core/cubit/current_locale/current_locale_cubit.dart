import 'package:aklk_3ndna/core/cubit/current_locale/current_locale_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentLocaleCubit extends Cubit<CurrentLocaleState> {
  CurrentLocaleCubit() : super(ArabicState());
  void updateLanguage({required bool value}) {
    if (value == false) {
      emit(ArabicState());
    } else {
      emit(EnglishState());
    }
  }
}
