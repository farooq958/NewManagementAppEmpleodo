import 'package:bloc/bloc.dart';
import 'package:empleado_development/Controller/Repository/inbox_repo.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:meta/meta.dart';

part 'inbox_application_details_state.dart';

class InboxApplicationDetailsCubit extends Cubit<InboxApplicationDetailsState> {
  InboxApplicationDetailsCubit() : super(InboxApplicationDetailsInitial());
  loadInboxApplicationDetails(typeRef,bool type)
  async {
    //emit(AttendanceDataInitial());
    emit(InboxApplicationDetailsLoading());
    var temp= await InboxRepo().loadInboxDetailsData(typeRef,type);
    if(temp==200) {

      emit(InboxApplicationDetailsLoaded());
    }
    else if(temp==10)
    {
      emit(InboxApplicationDetailsInternetError());

    }
    else
    {
      emit(InboxApplicationDetailsUnknownError());

    }

  }

}
