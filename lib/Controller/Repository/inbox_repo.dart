import 'dart:io';
import 'package:empleado_development/Controller/Cubits/Inbox/chat_socket_cubit.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:empleado_development/Controller/UtilsData/app_controllers.dart';
import 'package:empleado_development/Controller/UtilsData/app_preferences.dart';
import 'package:empleado_development/Model/InboxModel/inbox_chat_model.dart';
import 'package:empleado_development/Model/InboxModel/inbox_leave_application_model.dart';
import 'package:empleado_development/Model/InboxModel/inbox_stories_model_controller.dart';
import 'package:empleado_development/Model/InboxModel/inbox_timeadjustment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart' as http;

class InboxRepo{
static late  IO.Socket socket;

  initSocket( BuildContext context,storyId)
  {
try{
 socket = IO.io("wss://inbox-api.veevotech.com", <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,

    });

    socket.connect();
    socket.onConnect((_) {
      print('connected to websocket');

      socket.emit("join room", storyId);
    });

// socket.on("message received", (data)  {
//
//   print("here");
//
//   //context.read<ChatSocketCubit>().loadInboxChat(storyId);
//   //BlocProvider.of<ChatSocketCubit>(context,listen: false).loadInboxChat(storyId);
//
// });
 // socket.on("message send", (data)  {
 //
 //
 //   context.read<ChatSocketCubit>().loadInboxChat(storyId);
 //
 // });

return 200;
  }
on SocketException catch (e) {
  debugPrint(e.toString());
  debugPrint('Internet connection is down.');
  return 10;
} on Exception catch (e) {
  debugPrint("error check $e");
  return 0;
}
  }
getChatsData(storyId) async{
  try{
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST', Uri.parse('http://inbox-api.veevotech.com/list_story_messages'));
    request.bodyFields = {
      'one_id': SharedPrefs.generalGetOneId().toString(),
      'app_id': '10',
      'org_id': SharedPrefs.generalGetOrgId().toString(),
      'story_id':storyId
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      inboxChatController = inboxChatModelFromJson(
          await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
    return response.statusCode;
  }
  on SocketException catch (e) {
    debugPrint(e.toString());
    debugPrint('Internet connection is down.');
    return 10;
  } on Exception catch (e) {
    debugPrint('sent data api exception: $e');
    return 0;
  }



}
sendChatsData(storyId,BuildContext context) async{
  try{
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST', Uri.parse('http://inbox-api.veevotech.com/send_message'));
    request.bodyFields = {
      'one_id': SharedPrefs.generalGetOneId().toString(),
      'app_id': '10',
      'org_id': SharedPrefs.generalGetOrgId().toString(),
      'story_id':storyId,
      'message':AppControllers.chatMessageController.text
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      print(
          await response.stream.bytesToString());
      //context.read<ChatSocketCubit>().loadInboxChat(storyId);
      socket.emit("send message",{
        'one_id': SharedPrefs.generalGetOneId().toString(),
        'app_id': '10',
        'org_id': SharedPrefs.generalGetOrgId().toString(),
        'story_id':storyId,
        'message':AppControllers.chatMessageController.text
      });
      AppControllers.chatMessageController.clear();
    }
    else {
      print(response.reasonPhrase);
    }
    return response.statusCode;
  }
  on SocketException catch (e) {
    debugPrint(e.toString());
    debugPrint('Internet connection is down.');
    return 10;
  } on Exception catch (e) {
    debugPrint('sent data api exception: $e');
    return 0;
  }



}

  loadInboxDetailsData(typeRef,type) async{
    try{
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded'
      };
      var request = http.Request('POST', Uri.parse('https://emp-beta.veevotech.com/custom_forms/api/submitted_form_data.php'));
      request.bodyFields = {
        'org_id': SharedPrefs.generalGetOrgId().toString(),
        'user_id': SharedPrefs.generalGetOneId().toString(),
        'CF_submission_id': typeRef.toString(),
        'access_token': 'developer_bypass'
      };
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
      //  print();

        if (type==true)
          {
            inboxTimeAdjustmentController=inboxAttributeApplicationModelFromJson(await response.stream.bytesToString());

          }
        else
          {
            inboxLeaveApplicationController=inboxLeaveApplicationModelFromJson(await response.stream.bytesToString());

          }
      }
      else {

        print(response.reasonPhrase);
      }

return response.statusCode;
    }
    on SocketException catch (e) {
      debugPrint(e.toString());
      debugPrint('Internet connection is down.');
      return 10;
    } on Exception catch (e) {
      debugPrint('sent data api exception: $e');
      return 0;
    }

  }


}