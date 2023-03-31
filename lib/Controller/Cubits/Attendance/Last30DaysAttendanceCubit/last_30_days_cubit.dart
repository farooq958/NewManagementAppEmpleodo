import 'package:bloc/bloc.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:meta/meta.dart';

part 'last_30_days_state.dart';

class Last30DaysCubit extends Cubit<Last30DaysState> {
  Last30DaysCubit() : super(Last30DaysInitial());
  loadLast30DaysAttendanceData(empId)
  async {
    //emit(AttendanceDataInitial());
    var temp= await Repository().load30DaysAttendanceData(empId);
    if(temp==200) {

      emit(Last30DaysLoaded());
    }
    else if(temp==10)
    {
      emit(Last30DaysInternetError());

    }
    else
    {
      emit(Last30DaysUnknownError());

    }

  }
}
