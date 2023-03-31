import 'package:bloc/bloc.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:meta/meta.dart';

part 'change_dp_state.dart';

class ChangeDpCubit extends Cubit<ChangeDpState> {
  ChangeDpCubit() : super(ChangeDpInitial());

  changeDp(empId,imagePath)
  async {
    //emit(AttendanceDataInitial());
    var temp= await Repository().changePicture(empId,imagePath);
    if(temp==200) {

      emit(ChangeDpLoaded());
    }
    else if(temp==10)
    {
      emit(ChangeDpInternetError());

    }
    else
    {
      emit(ChangeDpUnknownError());

    }

  }

}
