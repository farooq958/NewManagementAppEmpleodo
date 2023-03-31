import 'package:bloc/bloc.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:meta/meta.dart';

part 'hr_policy_state.dart';

class HrPolicyCubit extends Cubit<HrPolicyState> {
  HrPolicyCubit() : super(HrPolicyInitial());


  loadHrPolicyData(orgId,policyId)
  async {
    //emit(AttendanceDataInitial());
    var temp= await Repository().loadHrPolicyData(orgId,policyId);
    if(temp==200) {

      emit(HrPolicyLoaded());
    }
    else if(temp==10)
    {
      emit(HrPolicyInternetError());

    }
    else
    {
      emit(HrPolicyUnknownError());

    }

  }
}
