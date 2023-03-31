//snack bars //toast bar for ui

import 'package:empleado_development/Controller/UtilsData/app_controllers.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppUtils{

 static getString(int month) {
    if (month == 1 || month == 01) {
      return "January";
    } else if (month == 2) {
      return "February";
    } else if (month == 3) {
      return "March";
    } else if (month == 4) {
      return "April";
    } else if (month == 5) {
      return "May";
    } else if (month == 6) {
      return "June";
    } else if (month == 7) {
      return "July";
    } else if (month == 8) {
      return "August";
    } else if (month == 9) {
      return "September";
    } else if (month == 10) {
      return "October";
    } else if (month == 11) {
      return "November";
    } else if (month == 12) {
      return "December";
    }
  }
 static List<String> selectedFilesLeaves = [];

static formatStringForMonths(int month){

   if(month<10)
   {

     return "0$month";
   }
   else
   {
     return month.toString();
   }
 }
 static String parseStringFromDate(String dateToEvaluate)
 {
   List<String> dateParts = dateToEvaluate.split('-');

   if (dateParts[2].length == 1) {
     dateParts[2] = '0${dateParts[2]}';
   }

   String correctedDateString = dateParts.join('-');
   return correctedDateString;
 }

static DateTime parseDateFromString(String dateToEvaluate){
   print(dateToEvaluate);
   List<String> dateParts = dateToEvaluate.split('-');

   if (dateParts[2].length == 1) {
     dateParts[2] = '0${dateParts[2]}';
   }

   String correctedDateString = dateParts.join('-');
   DateTime dateTimeCreatedAt = DateTime.parse(correctedDateString);
  // print("$dateTimeCreatedAt check");
   return dateTimeCreatedAt;

 }
 static  getDifferenceInTwoDate({required DateTime firstDate,required DateTime secondDate})
 {

   final differenceInDays = secondDate.difference(firstDate).inDays;
  // print('$differenceInDays');
   return differenceInDays;

 }
 static String leaveType="paid";
 static bool isHalfDay=false;
static List<Leave> getDatesList()
{

  final items = List<Leave>.generate( AppUtils.getDifferenceInTwoDate
    (firstDate: AppUtils.parseDateFromString(AppControllers.leaveFromController.text)
      , secondDate:AppUtils.parseDateFromString(AppControllers.leaveUpToController.text))+1, (i) =>
  Leave(adjustData: (AppUtils.parseDateFromString(AppControllers.leaveFromController.text).add(Duration(days: i))), leaveType: AppUtils.leaveType, isHalfDay: isHalfDay==true?1:0));
      //AppUtils.parseDateFromString(AppControllers.leaveFromController.text).add(Duration(days: i)));
  //print(items);

 // final listOfHalfDays=List<dynamic>.generate(items.length, (index) => null);
  return items;
}
static List<Leave> leaveData=getDatesList();

 static showCustomSnackBar({
   required BuildContext context,
   required String message,
   required Color color
   //required bool theme,
 }) {
   final customSnackBar = SnackBar(
     duration: const Duration(milliseconds: 800),
     content: Text(
       message,
       style: GoogleFonts.poppins(
         fontSize: 15.sp,
         color: Colors.white.withOpacity(0.8),
         fontWeight: FontWeight.w400,
       ),
     ),
     backgroundColor: color,
     behavior: SnackBarBehavior.floating,
   );

   ScaffoldMessenger.of(context)
     ..hideCurrentSnackBar()
     ..showSnackBar(customSnackBar);
 }
 static ThemeData blueTheme() {
   return ThemeData(






   );
 }

static ThemeData blueDarkTheme() {
   return ThemeData(
     cardColor: AppColors.purpleColor,
     brightness: Brightness.dark,
     primaryColor: const  Color(0XffF3F6FC),





     colorScheme:  ColorScheme.dark(
       primary: const Color(0xFFC9E4CA),
       secondary: AppColors.blueContainerColor,
       background: AppColors.purpleColor,
       tertiaryContainer: AppColors.purpleColor
     ),
   );
 }

 static getTimeFromEpoch(timestamp)
 {


   var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000,isUtc: false);

   return date;

 }
 static formatTimeForString(String time1,check)
 {
  DateTime date= getTimeFromEpoch(int.parse(time1));
  if(check ==false)
    {
      return "${date.hour}:${date.minute}";
    }
  else {
    return "${date.hour}hrs:${date.minute} min";
  }
 }
 static formatSecondsToMinutes(seconds)

 {
 int returnVar = (seconds/60).toInt();
 return "$returnVar min";

 }
 static formatEarnedHours(timeInSeconds)
 {
   var d = Duration(seconds:timeInSeconds);

   return "${d.inHours} hrs:${d.inMinutes.remainder(60)} min";

 }

 static String  formatDateFromEpoch(String date)
 {
  DateTime dateData= AppUtils.getTimeFromEpoch(int.parse(date));


  return "${dateData.year}-${dateData.month}-${dateData.day}";

 }
static String convertToUtcAndGetDurationTime(String time1, String time2) {
   final time1Parts = time1.split(':');
   final time2Parts = time2.split(':');

   // Get the current date in the UTC timezone
   final now = DateTime.now().toUtc();

   // Create DateTime objects for time1 and time2
   final time1UTC = DateTime.utc(now.year, now.month, now.day, int.parse(time1Parts[0]), int.parse(time1Parts[1]));
   final time2UTC = DateTime.utc(now.year, now.month, now.day, int.parse(time2Parts[0]), int.parse(time2Parts[1]));

   // Calculate the time difference in minutes
   final diff = time2UTC.difference(time1UTC).inMinutes.abs();

   // Format the result as hours and minutes
   final hours = (diff / 60).floor();
   final minutes = diff % 60;
   final diffString = '$hours hrs and $minutes mins';

   return diffString;
 }
static String addThumbToImageUrl(String url) {
   RegExp exp = RegExp(r'(?<=/images/)([^]+)');
  // print(url.replaceFirst(exp, '${exp.stringMatch(url)}/thumb_'));
   return url.replaceFirst(exp, '${exp.stringMatch(url)}/thumb_');
 }
 static String formatDateForInbox(DateTime dt){

   DateTime date = DateTime.parse(dt.toString());
   List<String> weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
   List<String> months = [  'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',  'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
   String result = '${weekdays[date.weekday ]} ${months[date.month - 1]} ${date.day} ${date.year}';
   //print(result); // Output: wed mar 22
return result;
 }
}


class Leave {
  final DateTime adjustData;
    String leaveType;
   int isHalfDay;

  Leave({
    required this.adjustData,
    required this.leaveType,
    required this.isHalfDay,
  });

  factory Leave.fromJson(Map<String, dynamic> json) {
    return Leave(
      adjustData: json['adjustData'],
      leaveType: json['leaveType'],
      isHalfDay: json['isHalfDay'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adjustData': adjustData,
      'leaveType': leaveType,
      'isHalfDay': isHalfDay,
    };
  }
}
