import 'package:bloc/bloc.dart';
import 'package:empleado_development/Controller/UtilsData/app_constants.dart';



class LoginRadiobuttonCubit extends Cubit<int?> {
  LoginRadiobuttonCubit() : super(0);

  changeRadio(int? radioValue)
  {
    print(radioValue);

    if(radioValue==0)
      {
        grantType="password";
      }
    else if(radioValue==1){

grantType="otp";
    }
    print(grantType);
    emit(radioValue);

  }

}
