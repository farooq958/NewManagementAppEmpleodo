import 'package:bloc/bloc.dart';


class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false);

  void switchTheme(bool themeState) {

   emit(themeState);
  }
}

