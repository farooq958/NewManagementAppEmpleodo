import 'package:bloc/bloc.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:meta/meta.dart';

part 'redirect_status_state.dart';

class RedirectStatusCubit extends Cubit<RedirectStatusState> {
  RedirectStatusCubit() : super(RedirectStatusInitial());

  redirectUser()
  async {
    //emit(AttendanceDataInitial());
    //emit(SendOtpLoading());
    var temp= await Repository().redirectUser();

    if(temp==200) {

      emit(RedirectStatusLoaded());
    }
    else if(temp==10)
    {
      emit(RedirectStatusInternetError());

    }
    else
    {
      emit(RedirectStatusUnknownError());

    }

  }
}
