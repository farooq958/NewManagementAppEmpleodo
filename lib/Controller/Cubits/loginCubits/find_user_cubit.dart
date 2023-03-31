import 'package:bloc/bloc.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:meta/meta.dart';

part 'find_user_state.dart';

class FindUserCubit extends Cubit<FindUserState> {
  FindUserCubit() : super(FindUserInitial());


  getUser(emailNumber)
  async {
    //emit(AttendanceDataInitial());
    emit(FindUserLoading());
    var temp= await Repository().findUser(emailNumber);

    if(temp==200) {

      emit(FindUserLoaded());
    }
    else if(temp==10)
    {
      emit(FindUserInternetError());

    }
    else
    {
      emit(FindUserUnknownError());

    }

  }
}
