import 'package:bloc/bloc.dart';



class LoginRadiobuttonCubit extends Cubit<int?> {
  LoginRadiobuttonCubit() : super(0);

  changeRadio(int? radioValue)
  {
    emit(radioValue);

  }

}
