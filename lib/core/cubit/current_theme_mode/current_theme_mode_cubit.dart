import 'package:aklk_3ndna/core/cubit/current_theme_mode/current_theme_mode_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentThemeCubit extends Cubit<CurrentThemeState> {
  CurrentThemeCubit() : super(DarkState());
  static CurrentThemeCubit get(context) => BlocProvider.of(context);

  void changeThemeMode({required bool value}) {
    if (value == true) {
      emit(DarkState());
    } else {
      emit(LightState());
    }
  }
}
