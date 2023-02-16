//snack bars //toast bar for ui

import 'package:empleado_development/Controller/UtilsData/app_controllers.dart';
import 'package:flutter/material.dart';

class AppUtils{

 static getString(int month) {
    if (month == 1) {
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

static parseDateFromString(String dateToEvaluate){
   DateTime dateTimeCreatedAt = DateTime.parse(dateToEvaluate);
  // print("$dateTimeCreatedAt check");
   return dateTimeCreatedAt;

 }
 static getDifferenceInTwoDate({required DateTime firstDate,required DateTime secondDate})
 {

   final differenceInDays = secondDate.difference(firstDate).inDays;
  // print('$differenceInDays');
   return differenceInDays;

 }
static List<DateTime> getDatesList()
{

  final items = List<DateTime>.generate( AppUtils.getDifferenceInTwoDate
    (firstDate: AppUtils.parseDateFromString(AppControllers.leaveFromController.text)
      , secondDate:AppUtils.parseDateFromString(AppControllers.leaveUpToController.text))+1, (i) =>
      AppUtils.parseDateFromString(AppControllers.leaveFromController.text).add(Duration(days: i)));
  //print(items);
  return items;
}

}