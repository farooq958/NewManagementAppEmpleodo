import 'package:bloc/bloc.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:meta/meta.dart';

part 'leave_balancecubit_state.dart';

class LeaveBalancecubitCubit extends Cubit<LeaveBalancecubitState> {
  LeaveBalancecubitCubit() : super(LeaveBalancecubitInitial());


  loadLeaveBalanceData(empId)
  async {
    //emit(AttendanceDataInitial());
    var temp= await Repository().loadLeaveData(empId);
    if(temp==200) {

      emit(LeaveBalanceLoaded());
    }
    else if(temp==10)
    {
      emit(LeaveBalanceInternetError());

    }
    else
    {
      emit(LeaveBalanceUnknownError());

    }

  }

}
