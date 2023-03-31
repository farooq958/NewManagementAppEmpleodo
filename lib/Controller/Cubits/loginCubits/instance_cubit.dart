import 'package:bloc/bloc.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:meta/meta.dart';

part 'instance_state.dart';

class InstanceCubit extends Cubit<InstanceState> {
  InstanceCubit() : super(InstanceInitial());

  getInstance(appId)
  async {
    print(appId);
    //emit(AttendanceDataInitial());
    emit(InstanceLoading());
    var temp= await Repository().getInstanceLogin(appId);

    if(temp==200) {

      emit(InstanceLoaded());
    }
    else if(temp==10)
    {
      emit(InstanceInternetError());

    }
    else
    {
      emit(InstanceUnknownError(message: "temp"));

    }

  }
}
