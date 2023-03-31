import 'package:bloc/bloc.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:meta/meta.dart';



class GetFormStructCubit extends Cubit<String> {
  GetFormStructCubit() : super("");

  getTheFormId({attributeName,orgId,branchId,deptId})
  async {
var formId= await  Repository().getFormId(attributeName, orgId, branchId, deptId);
if(formId!="") {
  print(formId);
  emit(formId);
}
else
  {
    emit("Something went wrong ");

  }
  }
}
