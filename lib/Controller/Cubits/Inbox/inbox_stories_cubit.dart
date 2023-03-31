import 'package:bloc/bloc.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:meta/meta.dart';

part 'inbox_stories_state.dart';

class InboxStoriesCubit extends Cubit<InboxStoriesState> {
  InboxStoriesCubit() : super(InboxStoriesInitial());

  loadInboxStories()
  async {
    //emit(AttendanceDataInitial());
    emit(InboxStoriesLoading());
    var temp= await Repository().loadInboxStoriesData();
    if(temp==200) {

      emit(InboxStoriesLoaded());
    }
    else if(temp==10)
    {
      emit(InboxStoriesInternetError());

    }
    else
    {
      emit(InboxStoriesUnknownError());

    }

  }
}
