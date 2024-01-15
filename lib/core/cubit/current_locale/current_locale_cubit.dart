import 'package:aklk_3ndna/core/cubit/current_locale/current_locale_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentLocaleCubit extends Cubit<CurrentLocaleState> {
  CurrentLocaleCubit() : super(ArabicState());

  static CurrentLocaleCubit get(context) => BlocProvider.of(context);

  bool isEnglish = false;

  void updateLanguage({required bool value}) {
    isEnglish = !isEnglish;

    if (value == true) {
      emit(ArabicState());
    } else {
      emit(EnglishState());
    }
  }

  bool darkMode = false;

  void changeColorApp({required bool value}) {
    darkMode = !darkMode;
    if (value == true)
      emit(ChangeColorAppSuccessState());
    else
      emit(ChangeColorAppErrorState());
  }
}
