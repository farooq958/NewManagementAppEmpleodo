import 'package:bloc/bloc.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:empleado_development/Views/Utils/Data/utils.dart';
import 'package:meta/meta.dart';

part 'leave_send_state.dart';

class LeaveSendCubit extends Cubit<LeaveSendState> {
  LeaveSendCubit() : super(LeaveSendInitial());
  sendLeave(customFormId, subject, appBody, leaveFromDate, leaveEndDate, List<Leave> leaveRawData,files)
  async {
    var leave_adjust_in=[];
    var leave_date=[];
    var half_day=[];
    for(var i in leaveRawData)
      {
        leave_adjust_in.add(i.leaveType.toString());
        leave_date.add(("${i.adjustData.year}-${AppUtils.formatStringForMonths( i.adjustData.month)}-${i.adjustData.day}"));
        half_day.add(i.isHalfDay);
      }
    print(leave_date);

    print(leave_date);
    print(leave_adjust_in);
    print(half_day);
    emit(LeaveLoading());
    var temp= await Repository().sendLeaveRequest(customFormId, subject, appBody, leaveFromDate, leaveEndDate,leave_date,leave_adjust_in,half_day,files);
    if(temp==200) {

      emit(LeaveLoaded());
    }
    else if(temp==10)
    {
      emit(LeaveInternetError());

    }
    else
    {
      emit(LeaveUnknownError());

    }
  }
}
