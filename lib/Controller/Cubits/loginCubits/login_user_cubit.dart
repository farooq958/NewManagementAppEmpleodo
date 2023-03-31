import 'package:bloc/bloc.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:meta/meta.dart';

part 'login_user_state.dart';

class LoginUserCubit extends Cubit<LoginUserState> {
  LoginUserCubit() : super(LoginUserInitial());

  getLoginUser(userName,password)
  async {
    //emit(AttendanceDataInitial());
    emit(LoginUserLoading());
    var temp= await Repository().loginUser(userName,password);

    if(temp==200) {

      emit(LoginUserLoaded());
    }
    else if(temp==10)
    {
      emit(LoginUserInternetError());

    }
    else
    {
      emit(LoginUserUnknownError());

    }

  }
}
