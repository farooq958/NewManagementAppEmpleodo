import 'package:bloc/bloc.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:meta/meta.dart';

part 'login_user_final_data_state.dart';

class LoginUserFinalDataCubit extends Cubit<LoginUserFinalDataState> {
  LoginUserFinalDataCubit() : super(LoginUserFinalDataInitial());


  getFinalLoginUserData(url)
  async {
    //emit(AttendanceDataInitial());
    // emit(LoginUserLoading());
    emit(LoginUserFinalDataLoading());
    var temp= await Repository().getLoginFirstData(url);

    if(temp==200) {

      emit(LoginUserFinalDataLoaded());
    }
    else if(temp==10)
    {
      emit(LoginUserFinalDataInternetError());

    }
    else
    {
      emit(LoginUserFinalDataUnknownError());

    }

  }
}
