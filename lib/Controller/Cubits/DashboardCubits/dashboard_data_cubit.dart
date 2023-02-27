import 'package:bloc/bloc.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:meta/meta.dart';

part 'dashboard_data_state.dart';

class DashboardDataCubit extends Cubit<DashboardDataState> {
  DashboardDataCubit() : super(DashboardDataInitial());

  loadDashboardData(empId,month,year)
  async {
    emit(DashboardDataInitial());
    var temp= await Repository().loadDashboardData(empId,month,year);
    if(temp==200) {

      emit(DashboardDataLoaded());
    }
    else if(temp==10)
    {
      emit(DashboardDataInternetError());

    }
    else
    {
      emit(DashboardDataUnknownError());

    }

  }

}
