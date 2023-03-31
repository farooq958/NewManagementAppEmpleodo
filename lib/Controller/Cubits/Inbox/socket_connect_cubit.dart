import 'package:bloc/bloc.dart';
import 'package:empleado_development/Controller/Repository/inbox_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketConnectCubit extends Cubit<bool> {
  SocketConnectCubit() : super(false);

  connectSocket(BuildContext context,storyId)
  {

  //   var temp = InboxRepo().initSocket( context, storyId);
  // if(temp==200)
  //   {
  //     emit(true);
  //   }
  // else{
  //
  //   emit(false);
  // }
  }

}
