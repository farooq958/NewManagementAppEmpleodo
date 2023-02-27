
import 'dart:io';

import 'package:empleado_development/Controller/UtilsData/app_uri.dart';
import 'package:empleado_development/Model/AttendanceModel/attendance_controller.dart';
import 'package:empleado_development/Model/AttendanceModel/attendance_model.dart';
import 'package:empleado_development/Model/DashboardModel/dashboard_controller.dart';
import 'package:empleado_development/Model/DashboardModel/dashboard_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class Repository{

 static var  selectedRadio =0;
static int onWillCheck=0;

 static Future<int> onWillPopCheck(int toReturn) async {
  onWillCheck = toReturn;
  //print("${onWillCheck}check");
  Future.delayed(const Duration(seconds: 4),(){
   onWillCheck=0;
  // print(onWillCheck);
   return onWillCheck;
  });


  return onWillCheck;


 }

 loadDashboardData(String  empId,String month,String year)
 async {

  try{
   var request = http.Request('GET', Uri.parse(getDashboardUri(userId: empId, month: month, year: year)));


   http.StreamedResponse response = await request.send();

   if (response.statusCode == 200) {
    ///print();
    dashboardData=dashboardModelFromJson(await response.stream.bytesToString());

   }
   else {
    print(response.reasonPhrase);
   }



   return response.statusCode;
  }on SocketException catch (e) {
   debugPrint(e.toString());
   debugPrint('Internet connection is down.');
   return 10;
  } on Exception catch (e) {
   debugPrint('sent data api exception: $e');
   return 0;
  }




 }
 loadAttendanceData(String  empId,String month,String year)
 async {

  try{
   var request = http.Request('GET', Uri.parse(getAttendanceUri(userId: empId, month: month, year: year)));


   http.StreamedResponse response = await request.send();

   if (response.statusCode == 200) {
    ///print();
    attendanceController=attendanceModelFromJson(await response.stream.bytesToString());

   }
   else {
    print(response.reasonPhrase);
   }



   return response.statusCode;
  }on SocketException catch (e) {
   debugPrint(e.toString());
   debugPrint('Internet connection is down.');
   return 10;
  } on Exception catch (e) {
   debugPrint('sent data api exception: $e');
   return 0;
  }




 }

}