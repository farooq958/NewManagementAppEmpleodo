import 'package:bloc/bloc.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:meta/meta.dart';

part 'attendance_data_state.dart';

class AttendanceDataCubit extends Cubit<AttendanceDataState> {
  AttendanceDataCubit() : super(AttendanceDataInitial());


  loadAttendanceData(empId,month,year)
  async {
    //emit(AttendanceDataInitial());
    var temp= await Repository().loadAttendanceData(empId,month,year);
    if(temp==200) {

      emit(AttendanceDataLoaded());
    }
    else if(temp==10)
    {
      emit(AttendanceDataInternetError());

    }
    else
    {
      emit(AttendanceDataUnknownError());

    }

  }
}
