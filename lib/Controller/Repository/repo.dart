
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:empleado_development/Controller/UtilsData/app_constants.dart';
import 'package:empleado_development/Controller/UtilsData/app_preferences.dart';
import 'package:empleado_development/Controller/UtilsData/app_uri.dart';
import 'package:empleado_development/Model/Applications/application_controller.dart';
import 'package:empleado_development/Model/Applications/time_adjustment_model.dart';
import 'package:empleado_development/Model/AttendanceModel/attendance_controller.dart';
import 'package:empleado_development/Model/AttendanceModel/attendance_model.dart';
import 'package:empleado_development/Model/AttendanceModel/last30daysattendance.dart';
import 'package:empleado_development/Model/AttendanceModel/leave_balance_attendance.dart';
import 'package:empleado_development/Model/DashboardModel/dashboard_controller.dart';
import 'package:empleado_development/Model/DashboardModel/dashboard_model.dart';
import 'package:empleado_development/Model/HrPolicyModel/hr_policy_controller.dart';
import 'package:empleado_development/Model/HrPolicyModel/hr_policy_model.dart';
import 'package:empleado_development/Model/InboxModel/inbox_stories_model.dart';
import 'package:empleado_development/Model/InboxModel/inbox_stories_model_controller.dart';
import 'package:empleado_development/Model/LoginModel/final_login_data.dart';

import 'package:empleado_development/Model/LoginModel/list_of_instance.dart';
import 'package:empleado_development/Model/LoginModel/login_controller.dart';
import 'package:empleado_development/Model/imageController.dart';
import 'package:empleado_development/Model/image_change.dart';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
class Repository{

 static var  selectedRadio =0;
static List<String> dataToDropdown=["paid","without_pay"];
static Map<String,String> dataForShow={"paid":"Paid","without_pay":"Un Paid"};
static int onWillCheck=0;
 static  var deviceDetailData={};
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

 load30DaysAttendanceData(String  empId)
 async {

  try{
   var request = http.Request('GET', Uri.parse(last30DaysUri+empId));


   http.StreamedResponse response = await request.send();

   if (response.statusCode == 200) {
    ///print();
    last30daysController=last30DaysModelFromJson(await response.stream.bytesToString());

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
 loadLeaveData(String  empId)
 async {

  try{
   var request = http.Request('GET', Uri.parse(leaveBalanceUri+empId));


   http.StreamedResponse response = await request.send();

   if (response.statusCode == 200) {
    ///print();
    leaveBalanceController=leaveBalanceFromJson(await response.stream.bytesToString());
print(leaveBalanceController.data[0].totalLeaves.toString());
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
 loadHrPolicyData(String  orgId,String policyId)
 async {

  try{
   var request = http.MultipartRequest('POST', Uri.parse(hrPolicyUri));

   request.fields.addAll({
    'id': policyId,
    'org_id': orgId,
    'operation': 'get_emp_policy'
   });
   http.StreamedResponse response = await request.send();

   if (response.statusCode == 200) {
    ///print();
   // print(await response.stream.bytesToString());
    hrPolicyController=hrPolicyModelFromJson(await response.stream.bytesToString());
    //print(leaveBalanceController.data[0].totalLeaves.toString());
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

 changePicture(String userId,String imagePathUri)
 async {
try {
 var request = http.MultipartRequest('POST', Uri.parse(setUri));
 var headers = {
  'content-type': 'multipart/form-data',
  'Accept': 'application/json',
 };
 request.headers.addAll(headers);
//print(imagePath);
 request.fields.addAll({
  'operation': 'set_emp_dp',
  'user_id': userId
 });
 // request.files.add(await http.MultipartFile.fromBytes('emp_dp', await File.fromUri(imagePathUri).readAsBytes(), contentType: new MediaType('image', 'jpeg')));
 request.files.add(await http.MultipartFile.fromPath(
     'emp_dp', imagePathUri, contentType: MediaType('image', 'png')));

 http.StreamedResponse response = await request.send();

 if (response.statusCode == 200) {
  ///print();
  // print(await response.stream.bytesToString());
  changerPic = changePicFromJson(await response.stream.bytesToString());
 // print(changerPic.newDp);
  //print(leaveBalanceController.data[0].totalLeaves.toString());
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


 findUser(emailNumber) async {
try{
  // var headers = {
  //  'Cookie': '_oneIDnigol=4b5ea796bb5d6229e2d163aef33830.05bb56fd081aa5cb8b5b2d7c7e352ff7413ea628; _oneIDEruces=fTAHz23gVS%2BSxsnD283Pz7oyZN6D4Jr39If0RnMIKdhkXFlLUNvFk3Z%2BdMXaDKigxoQIdqRBJ4JWoewp%2FtM6gpFJrSJiCZggZe3QtBBc4PRUDi7B%2FZ4tpV41Ix%2FKF3SbfXU3N1BAvcq1TmJVhu5VNLMm7XEcvQa%2FfstylxIokDrqF%2BsgDWcOoR3UrKgxXEGn8W8%2Bpy1ZyYPPXQq3DIFmmP9cEEt1XgmF9jkGCNyw9tnT%2FIDjb%2FaSpax6C3mdw%2FxNfxIdZZwhRDCxBklBvc7clMJw%2FVDULM4F0VEdEQpfkTCs4O1RaWxkwasuxtHSQCef9g%2FCu3c5wyHTMUhwv0uEQKj4IyTH0s3fViRJOQJojsflwONSzOg4gmYgkqIDuE2NUqNzLZ4ctlQI7yXtFfWIbo0SdBAC1oqXko8PHh8cWecPKLGi9vTCC8oBb9oHlavwcO13NctpVfU3YeEXROwJLE1MH9tk1YmmVA331rYG5pUXLXrAUwA8dBK2%2BeCwkbXyInv2q9yC2dFPQCvWT2GUp7KnU7422zBXdKVq7WrIbDr4cpAhUjz4jRRGyA0QbXVy%2FwBzu0%2F9Mj%2BU2SqpQTfUPUZtXEp9pehdQFQrSA%3D%3D; vt_oneid_portal=5mjnm95gqauj9j2vnafmhddhm9cnnqqm'
  // };
  var request = http.MultipartRequest('GET', Uri.parse(getUser+emailNumber));

  request.headers.addAll(request.headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {

 //  findUserController= findUserByEmailOrPasswordModelFromJson(await response.stream.bytesToString());
   var res= jsonDecode(await response.stream.bytesToString());
   //print(await response.stream.bytesToString());
   if(res["USER"]!=null  ){
findUserStatusController = res["USER"].toString();
//print(findUserStatusController);
   }
  // print(res["USER"]);
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

 loginUser(userName,password) async {
  try{
   // var headers = {
   //  'Cookie': '_oneIDnigol=055389ac05e3e536e5f5b3dfaab2fb.dcc2b93fd1b33cc106ef9ad175183f39db7b85b9; _oneIDEruces=fTAHz23gVS%2BSxsnD283Pz7oyZN6D4Jr39If0RnMIKdhkXFlLUNvFk3Z%2BdMXaDKigxoQIdqlCGahTo%2Bwp%2FtM6gpFJrSJiCZggZe3QtBBc4PRUDi7e4asik0IYOBDHICqbZ3MoOxBR5vOqTRc53sNSL7IN0QEfk3enf%2BZPgAg99jHkF%2BgnEVk3jx36qdsyZjCgq25jvzhfzc3UXgrND5RXnO1JWXIxclGCsD0WKcGkyP%2FT%2FYDjJ%2FaSh61CG3rCw9JNchIkdsQ2aTCxBlpZ9M7flMFw7WmMO80z0UYNLFBegSP295hFaXgBwast1srCVxqDsAjotyss1CHWIUlK51atUJHPRxHiyvL9Wg53KVlxiPmmyopv%2FP08nRMngbIQl16eUqRdD5UbsWEIwQz9WfWIZskRcwsZ%2FriXy40cLEQzdLVFP4OpsOPRMt8sWvgekoCfYe1dC85VVPUmY4sbVdYYbU50b%2FY%2BwoevEh3s2eUU8owQF2HJJWISJh2f%2BtrBlbfIH0fp%2BpuG4vZNIy3mMmaEm4aDVbBH2gpeV6MhmyqQRz79V78Nbw3P%2FiJLsicZRxB07QlukkaiGCOK0wyZVm%2Fq; vt_oneid_portal=3e6hche2dj6spf5mdcpeod8s6gi7vggo'
   // };
   var request = http.MultipartRequest('GET', Uri.parse(getLoginUri(userName, password)));

   request.headers.addAll(request.headers);

   http.StreamedResponse response = await request.send();

   if (response.statusCode == 200) {

    //  findUserController= findUserByEmailOrPasswordModelFromJson(await response.stream.bytesToString());
    var res= jsonDecode(await response.stream.bytesToString());
    //print(await response.stream.bytesToString());
    print(res);
    if(res["AUTHENTICATION"]!=null  ){
     loginUserStatusController = res["AUTHENTICATION"].toString();

    }
    if(res["access_token"] != null )
     {
      accessTokenMultipleInstance=res["access_token"];

     }
    if(res["VERIFICATION"]!=null  ){
     loginUserVerifyStatusController = res["VERIFICATION"].toString();
//print(findUserStatusController);
    }
    if(res["URL"]!=null  ){
     loginUserURLStatusController = res["URL"].toString();
//print(findUserStatusController);
    }
   //print(res["DB_DATA"]);
    if(res["DB_DATA"]!=null)
     {
     // print(res["DB_DATA"]);

    listOfInstances=res["DB_DATA"] ;
    print(listOfInstances);
     }
    // print(res["USER"]);
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

 getLoginFirstData(url) async {
  try{
   // var headers = {
   //  'Cookie': '_oneIDnigol=adaae7674c3d1d84d71e67da81cc1b.aeda6edff5552c1e2128070ef068a059900d1bf5; empleado_webportal=h2u5be6hmndnokc68ag46tnqjvqrchp9'
   // };
   print(url);
   var request = http.Request('GET', Uri.parse(url.toString()));

   request.headers.addAll(request.headers);

   http.StreamedResponse response = await request.send();

   if (response.statusCode == 200) {
finalLoginDataController=finalLoginDataFromJson(await response.stream.bytesToString() );
    //  findUserController= findUserByEmailOrPasswordModelFromJson(await response.stream.bytesToString());
//     var res= jsonDecode(await response.stream.bytesToString());
//     //print(await response.stream.bytesToString());
//     if(res["USER"]!=null  ){
//      findUserStatusController = res["USER"].toString();
// //print(findUserStatusController);
//     }
    // print(res["USER"]);
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

 sendOtpData(username)async{
try {
 // var headers = {
 //  'Cookie': '_oneIDnigol=209377a4010d5199fe0d64bf3d79dd.c69fac52ff39fdac385bcd32cf77e3dffbb2af92; _oneIDEruces=fTAHz23gVS%2BSxsnD283Pz7oyZN6D4Jr39If0RnMIKdhkXFlLUNvFk3Z%2BdMXaDKigxoQIWKlBGZZXoPw1o9YQv5V3lAxiM%2B1PLtS6qBxn2oNMHRfnooYZpVk3FmvFGFqPVU43HRNQg4m7QQcUxNVsAaMP%2BAIcvQe7Z%2BZQsk499i3lBMUCDXIJvhb4gNgzc0GkqmkHiS1juKbRTTeJE79prvZIYFNrZgmd7xNfKdON5a2U6IOGNPS%2FqvRVJV%2Bcw8JZcRAdct0iVx78EUpd99nyvdxzi0zVL%2Fcv0EYNFlJKgh6v4%2B5wNHhewa851sHVQzet9gzovGM4wCHTJRdorEiTYfXTMB3CxN3cRCNxNgFniPrg2r5RpOM8gnA6yLEmjkyjD45yG48en31M%2BxflBve2esgQTT1e%2FqixjI4fMF4bTtZBBpiq8%2FfSE4oHRudGv7j%2FOsBJBNFQMZZ9YeEXV%2BwJLFhKdPFk7KOmVAz47KYDg5IVOiLEHU0sfiup9tzHlpaoRHjr1prn3%2FFBLDasKUqmooPPV6RDyCdnU9BLp0HXQDzPfsgYGjivjDdE7RQXGGNy%2FTxdp0%2F1YhCI9TKZRirLUSN1aXc8gvdIS3pWdiubaRJdzHeP0D0f; vt_oneid_portal=fmuitfes1gvk6v136pqpf3llte522bmh'
 // };
 var request = http.Request('GET', Uri.parse(sendOtp + username));

 request.headers.addAll(request.headers);

 http.StreamedResponse response = await request.send();

 if (response.statusCode == 200) {
  //print(await response.stream.bytesToString());
  var res = jsonDecode(await response.stream.bytesToString());
  loginOTPStatusController = res["VERIFICATION"];
  if (res["VERIFICATION"] == "OTP_SENT") {
   loginOTPResponse = res["OTP_RESPONSE"];
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
 getInstanceLogin(appId)async{

   // var headers = {
   //  'Cookie': '_oneIDnigol=c8d33b6eefa87be5916122bb454e03.c522adfebded01db749bc38cad2c41060d0ac517; _oneIDEruces=fTAHz23gVS%2BSxsnD283Pz7oyZN6D4Jr39If0RnMIKdhkXFlLUNvFk3Z%2BdMXaDKigxoQIdqRBJ4JWoewp%2FtM6gpFJrSJiCZggZe3QtBBc4PRUDi7B%2FZ4tpV41Ix%2FKF3SbfXU3N1BAvcq1TmJVhu5VNLMm7XEcvQa%2FfstylxIokDrqF%2BsgDWcOoR3UrKgxXEGn8W8%2Bpy1ZyYPPXQq3DIFmmP9cEEt1XgmF9jkGCNyw9tnT%2FK73JPa8i6x6C33Vw%2FxFOBIjadMiMTT7BmR4qs3Pg5lw00TXO80kwVINNBldrB7n9MdWNWxn3vAuxt7PQyeuqw%2F%2FnXIs%2BiHVJ3J8v0uEQKj4IyTH0s3fViRJOQJojsflwONSzOg4gmYgkqIDuE2NUqNzLZ4ctlQI7Av5FfaYZo0SdBAC1oqXko8PHh8cWedFKo%2BmsvTsC8oBb9oHlavwcO13NctpVfU3YeEXROwJLE1MH9tk1YmmVA331rYG5pUXLXrAUwAIExea%2BdmQvrjpAkaRwp6T%2FeNsPjr7SEG4wrqVd%2BQ%2F2gZ0S%2Fx0mEPydzXQUbYJaQrWniJS0Q46bn1p4xJlgVP%2BZTG8gx%2FpRXDfA2JGbwkajcVoQklqSA%3D%3D; vt_oneid_portal=fmuitfes1gvk6v136pqpf3llte522bmh'
   // };
  try {
//    var client = http.Client();
//
//    var request = http.Request('GET', Uri.parse('https://oneid.veevotech.com/auth/?grant_type=access_token&api=true&app_id=$appId&parent_app_token'));
//
//    client.send(request).then((response) {
//     if (response.statusCode == 302) {
//      var redirectUrl = response.headers['location'];
//      client.get(Uri.parse(redirectUrl!)).then((newResponse) {
//       print(jsonDecode(newResponse.body.toString()));
//       // Process the new response here
// return newResponse.statusCode;
//      });
//     } else {
//     // return reques;
//      // Process the original response here
//     }
//    });


   appId = Uri.encodeComponent(appId);
   //appId=jsonEncode(appId);
   print(
       "https://oneid.veevotech.com/auth?grant_type=access_token&api=true&app_id=$appId&parent_app_token=""&access_token=$accessTokenMultipleInstance");

   print(accessTokenMultipleInstance);
   // var headers = { 'Authorization': "Accept", "Content-Type" : "application/json" };
   //var request = await http.Request('GET', Uri.parse("https://oneid.veevotech.com/auth/?grant_type=access_token&api=true&app_id=$appId&parent_app_token&one_id=9313992"));

   // var request = http.Request('GET', Uri.parse(
   //     'https://oneid.veevotech.com/auth?grant_type=access_token&api=true&app_id=$appId&parent_app_token=&access_token=$accessTokenMultipleInstance'));
   //final cookie = Cookie('_oneIdEruces', 'cookie-value');
    final client = HttpClient();
//
//    // Create a new cookie
   final cookie = Cookie('_oneIdEruces', 'cookie-value');
final cookie1=Cookie("_oneIDnigol", "cookie-value");
print("instance uri");
print('https://oneid.veevotech.com/auth?app_id=$appId&api=true&parent_app_token=&grant_type=access_token&access_token=$accessTokenMultipleInstance');
  // Create a new HttpClientRequest
//    final req = await client.getUrl(Uri.parse(
//        'https://oneid.veevotech.com/auth?grant_type=access_token&api=true&app_id=$appId&parent_app_token='));
// req.cookies.add(cookie);
// req.cookies.add(cookie1);

   // // Add the cookie to the request
   // req.cookies.add(cookie);
//    req.headers.add("Content-Type", "application/x-www-form-urlencoded");
// req.cookies.add(cookie1);
//
//    // Send the request and wait for the response
//    final response = await req.close();
//
//    // Print the response body
//    await for (var contents in response.transform(utf8.decoder)) {
//     print(contents);
//    }
//
//    // Close the client
//    client.close();

   //http.StreamedResponse response = await request.send();


//    if(response.statusCode==200) {
//      var res = jsonDecode(await response.stream.bytesToString());
//
//
// //  var dio = Dio();
// //
// // //dio.options.baseUrl="https://oneid.veevotech.com/auth/?grant_type=access_token&api=true&app_id=$appId&parent_app_token";
// //    dio.options.followRedirects=false;
// //    dio.interceptors.add(InterceptorsWrapper(
// //     onResponse: (Response response, ResponseInterceptorHandler handler) {
// //      if (response.statusCode == 302) {
// //       var redirectUrl = response.headers.value('location');
// //       print(response.realUri.toString());
// //      // Return a new Future<Response> here
// //      }
// //     // Return the original response if there's no redirect
// //     },
// //    ));
// //    var request = await dio.get("https://oneid.veevotech.com/auth/?grant_type=access_token&api=true&app_id=$appId&parent_app_token");
// // print(request.statusCode);
//
//    //request.headers.addAll(headers);
//
//
//    // http.StreamedResponse response = await request.send();
//   // print(request.statusCode);
//    //http.StreamedResponse response = await request.send();
//
//    // if (request.statusCode == 200) {
//    //  print(request.data);
//    //  print("HERE");
//    //  //  print(await response.stream.bytesToString());
//     //  var res = jsonDecode(await response.stream.bytesToString());
//     //var res = jsonDecode(await response.stream.bytesToString());
//    // var res = jsonDecode(request.data.toString());
//     //print(res);
//     //var res=null;
//     if (res["URL"] != null) {
//      loginUserURLStatusController = res["URL"].toString();
//      print("here 2");
//      print(loginUserURLStatusController);
//     }
//
//    else {
//    // print(request.statusMessage);
//    }}
//    return response.statusCode;
//   }
//    var headers = {
//     'Cookie': '_oneIDnigol=${cookie1.value} '
//    };
//    var headers2 = {
//     'Cookie': '_oneIDEruces=${cookie.value} '
//    };
   var headers3 = { 'Authorization': "Accept", "Content-Type" : "application/json", 'Cookie': '_oneIDEruces=$accessTokenMultipleInstance ' };
   var request = http.Request('GET', Uri.parse('https://oneid.veevotech.com/auth?app_id=$appId&api=true&parent_app_token=&grant_type=access_token&access_token=$accessTokenMultipleInstance'));
   //request.bodyFields = {};
   // request.headers.addAll(headers);
   // request.headers.addAll(headers2);
   request.headers.addAll(headers3);
   request.followRedirects=false;
   request.maxRedirects=10;
 request.persistentConnection=true;
   http.StreamedResponse response = await request.send();
print(request.headers);

   if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
   }
   else {
    print("this or what");
    print(response.statusCode);
    print(response.reasonPhrase);
    print(await response.stream.bytesToString());
   }



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


  redirectUser()
  async {
  try{
   // var headers = {
   //  'Cookie': '_oneIDnigol=834f5bf7998d1f84d1054d6cbd09cc.6053debf55bbe51b129e6452e50b13639a4edbe0; empleado_webportal=bska2knoa24c8bh9oghjn4gfkrtfcbnh'
   // };
   var request = http.MultipartRequest('POST', Uri.parse('https://emp-beta.veevotech.com/api/login.php'));
   request.fields.addAll({
    'session_verify': 'true',
    'session_id': SharedPrefs.generalGetSessionId().toString(),
    'user_id': SharedPrefs.generalGetEmpId().toString()
   });

   request.headers.addAll(request.headers);

   http.StreamedResponse response = await request.send();

   if (response.statusCode == 200) {
  //  print(await response.stream.bytesToString());
    var res = jsonDecode(await response.stream.bytesToString());
    loginRedirectCheck=res["status"];
    print(loginRedirectCheck);
  }
  else {
  print(response.reasonPhrase);
  }
  return response.statusCode;
  } on SocketException catch (e) {
   debugPrint(e.toString());
   debugPrint('Internet connection is down.');
   return 10;
  } on Exception catch (e) {
   debugPrint('sent data api exception: $e');
   return 0;
  }

  }

  sendDeviceDetails() async {
try{
 var deviceId=getDeviceIdHashed();
 var request = http.Request('POST', Uri.parse('https://oneid.veevotech.com/user_device_mgt/add_device_info?device_id=$deviceId&device_type=${Repository.deviceDetailData["device"]}&os_version=${Repository.deviceDetailData["version.baseOS"]}&other_data=${Repository.deviceDetailData["hardware"]}'));

 request.headers.addAll(request.headers);

 http.StreamedResponse response = await request.send();

 if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
   }
   else {
   print(response.reasonPhrase);
   }

}
on SocketException catch (e) {
 debugPrint(e.toString());
 debugPrint('Internet connection is down.');
 return 10;
} on Exception catch (e) {
 debugPrint(e.toString());
 return 0;
}
  }

  getDeviceIdHashed() {

  var stringToHashed="${Repository.deviceDetailData["id"]}|${Repository.deviceDetailData["device"]}|${Repository.deviceDetailData["version.baseOS"]}|${Repository.deviceDetailData["hardware"]}";
   var bytes = utf8.encode(stringToHashed); // convert the string to bytes
   var digest = sha256.convert(bytes);
   print(digest);
return digest.toString();

  }
  getFormId(attributeName,orgId,branchId,deptId) async {

   var request = http.Request('POST', Uri.parse('https://emp-beta.veevotech.com/custom_forms/api/fetch_custom_form.php?access_token=developer_bypass&form_label=$attributeName&org_id=$orgId&branch_id=$branchId&dept_id=$deptId'));

   request.headers.addAll(request.headers);

   http.StreamedResponse response = await request.send();
formId="";
   if (response.statusCode == 200) {
    //print();
    var res=jsonDecode(await response.stream.bytesToString());
    if(res["_id"]!= null)
     {
      formId=res["_id"].toString();
      return formId;
     }

   }
   else {
   print(response.reasonPhrase);
   return formId;
   }

  }

  sendTimeAdjustmentRequest(customFormId,date,inTime,outTime,reoson)
  async {
   try {
    var request = http.MultipartRequest('POST', Uri.parse(
        'https://emp-beta.veevotech.com/custom_forms/api/submit_form.php'));
    request.fields.addAll({
     'emp_id': SharedPrefs.generalGetEmpId().toString(),
     'reason': reoson,
     'date': date,
     'in_time': inTime,
     'out_time': outTime,
     'access_token': 'developer_bypass',
     'dept_id': SharedPrefs.generalGetDepartId().toString(),
     'custom_form_id': customFormId,
     'form_label': 'ATT_TIME_ADJUSTMENT',
     'branch_id': SharedPrefs.generalGetBranchId().toString(),
     'org_id': SharedPrefs.generalGetOrgId().toString()
    });


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
     timeAdjustmentSuccessController = timeAdjustmentSuccessModelFromJson(
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

 sendLeaveRequest(customFormId,subject,appBody,leaveStartDate,leaveEndDate,leave_date,leave_adjust_in,half_day,files)
 async {
  try {
   var request = http.MultipartRequest('POST', Uri.parse(
       'https://emp-beta.veevotech.com/custom_forms/api/submit_form.php'));
   Map<String, String> headers = {'Content-Type': 'application/json'};
   request.fields.addAll({
    'emp_id': SharedPrefs.generalGetEmpId().toString(),
    'app_body': appBody,
    'subject': subject,
    'leave_app_start_date': leaveStartDate,
    'leave_app_end_date': leaveEndDate,
    'access_token': 'developer_bypass',
    'JWT_AUTH_CODE': SharedPrefs.generalGetJwt().toString(),
    'custom_form_id':customFormId ,
    'form_label': 'LEAVE_REQUEST',
    'branch_id': SharedPrefs.generalGetBranchId().toString(),
    'org_id': SharedPrefs.generalGetOrgId().toString(),
    // "leave_date":jsonEncode(leave_date),
    // "leave_adjust_in":jsonEncode(leave_adjust_in),
    // "half_day": jsonEncode(half_day),

   });
   request.headers.addAll(headers);
  // request.fields.addAll({"leave_date[]":leave_date.map((item) => jsonList.add(item.toJson())).toList()});
for(var i=0 ;i<leave_date.length;  i++)
 {
  request.fields.addAll(({"leave_date[$i]":leave_date[i].toString()}));
 }
   for(var i=0 ;i<leave_adjust_in.length;  i++)
   {
    request.fields.addAll(({"leave_adjust_in[$i]":leave_adjust_in[i].toString()}));
   }
   for(var i=0 ;i<half_day.length;  i++)
   {
    request.fields.addAll(({"half_day[$i]":half_day[i].toString()}));
   }
for(var i=0;i<files.length;i++) {
  request.files.add(await http.MultipartFile.fromPath('attachment[$i]', files[i]));
}
   http.StreamedResponse response = await request.send();

   if (response.statusCode == 200) {

   print(await response.stream.bytesToString());
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
getEmployeeLeaveType() async {

 var request = http.MultipartRequest('POST', Uri.parse('https://emp-beta.veevotech.com/api/get_data.php'));
 request.fields.addAll({
 'operation': 'get_emp_leave_type',
 'emp_id': SharedPrefs.generalGetEmpId().toString(),
 'org_id': SharedPrefs.generalGetOrgId().toString()
 });


 http.StreamedResponse response = await request.send();

 if (response.statusCode == 200) {

List<dynamic> data= jsonDecode(await response.stream.bytesToString());
dataToDropdown.clear();
dataForShow.clear();
 dataToDropdown=["paid","without_pay"];
 dataForShow={"paid":"Paid","without_pay":"Un Paid"};
 // print(data);
 for(var i in data)
  {
   dataToDropdown.add(i["value"].toString());
   dataForShow.addAll({i["value"].toString():i["label"].toString()});
  }

 }
 else {
 print(response.reasonPhrase);
 }

}
 loadInboxStoriesData() async{
try{
 var headers = {
  'Authorization': 'Bearer ${SharedPrefs.generalGetJwt()}',
  'Content-Type': 'application/x-www-form-urlencoded'
 };
 var request = http.Request('POST', Uri.parse('http://inbox-api.veevotech.com/list_stories'));
 request.bodyFields = {
  'one_id': SharedPrefs.generalGetOneId().toString(),
  'app_id': '10',
  'org_id': SharedPrefs.generalGetOrgId().toString()
 };
 request.headers.addAll(headers);

 http.StreamedResponse response = await request.send();

 if (response.statusCode == 200) {
  //print(await response.stream.bytesToString());
  inboxStoriesController = inboxStoriesModelFromJson(
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
}