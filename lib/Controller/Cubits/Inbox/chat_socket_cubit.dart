import 'package:bloc/bloc.dart';
import 'package:empleado_development/Controller/Repository/inbox_repo.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'chat_socket_state.dart';

class ChatSocketCubit extends Cubit<ChatSocketState> {
  ChatSocketCubit() : super(ChatSocketInitial());


  loadInboxChat(storyId)
  async {
    //emit(AttendanceDataInitial());
    //emit(InboxStoriesLoading());
    var temp= await InboxRepo().getChatsData(storyId);
    if(temp==200) {

      emit(ChatSocketLoaded());
    }
    else if(temp==10)
    {
      emit(ChatSocketInternetError());

    }
    else
    {
      emit(ChatSocketUnknownError());

    }

  }

}
