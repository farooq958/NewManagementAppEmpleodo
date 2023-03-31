import 'package:bloc/bloc.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:meta/meta.dart';

part 'send_otp_state.dart';

class SendOtpCubit extends Cubit<SendOtpState> {
  SendOtpCubit() : super(SendOtpInitial());
  getOTP(userName)
  async {
    //emit(AttendanceDataInitial());
    emit(SendOtpLoading());
    var temp= await Repository().sendOtpData(userName);

    if(temp==200) {

      emit(SendOtpLoaded());
    }
    else if(temp==10)
    {
      emit(SendOtpInternetError());

    }
    else
    {
      emit(SendOtpUnknownError());

    }

  }

}
