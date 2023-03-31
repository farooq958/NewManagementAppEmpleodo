import 'package:bloc/bloc.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:meta/meta.dart';

part 'time_adjustment_state.dart';

class TimeAdjustmentCubit extends Cubit<TimeAdjustmentState> {
  TimeAdjustmentCubit() : super(TimeAdjustmentInitial());

  sendTimeAdjustment(customFormId, date, inTime, outTime, reoson)
  async {
    emit(TimeAdjustmentLoading());
  var temp= await Repository().sendTimeAdjustmentRequest(customFormId, date, inTime, outTime, reoson);
  if(temp==200) {

    emit(TimeAdjustmentLoaded());
  }
  else if(temp==10)
  {
    emit(TimeAdjustmentInternetError());

  }
  else
  {
    emit(TimeAdjustmentUnknownError());

  }
  }
}
