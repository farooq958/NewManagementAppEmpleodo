// To parse this JSON data, do
//
//     final attendanceModel = attendanceModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AttendanceModel attendanceModelFromJson(String str) => AttendanceModel.fromJson(json.decode(str));

String attendanceModelToJson(AttendanceModel data) => json.encode(data.toJson());

class AttendanceModel {
  AttendanceModel({
    required this.data,
    required this.error,
  });

  final Data data;
  final String error;

  factory AttendanceModel.fromJson(Map<String, dynamic> json) => AttendanceModel(
    data: Data.fromJson(json["data"]),
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "error": error,
  };
}

class Data {
  Data({
    required this.expectedHours,
    required this.holidays,
    required this.completedHours,
    required this.completedHoursInSecond,
    required this.lateComings,
    required this.overTimeInSecond,
    required this.overTime,
    required this.absentees,
    required this.allowedLeaves,
    required this.leaveAvailed,
    required this.totalAdjustedLateMin,
    required this.attendance,
    required this.allowedLateMin,
    required this.usedLateMin,
  });

  final int expectedHours;
  final int holidays;
  final int completedHours;
  final int completedHoursInSecond;
  final int lateComings;
  final int overTimeInSecond;
  final int overTime;
  final int absentees;
  final int allowedLeaves;
  final int leaveAvailed;
  final int totalAdjustedLateMin;
  final List<Attendance> attendance;
  final dynamic allowedLateMin;
  final int usedLateMin;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    expectedHours: json["expected_hours"],
    holidays: json["holidays"],
    completedHours: json["completed_hours"],
    completedHoursInSecond: json["completed_hours_in_second"],
    lateComings: json["late_comings"],
    overTimeInSecond: json["over_time_in_second"],
    overTime: json["over_time"],
    absentees: json["absentees"],
    allowedLeaves: json["allowed_leaves"],
    leaveAvailed: json["leave_availed"],
    totalAdjustedLateMin: json["total_adjusted_late_min"],
    attendance: List<Attendance>.from(json["attendance"].map((x) => Attendance.fromJson(x))),
    allowedLateMin: json["allowed_late_min"],
    usedLateMin: json["used_late_min"],
  );

  Map<String, dynamic> toJson() => {
    "expected_hours": expectedHours,
    "holidays": holidays,
    "completed_hours": completedHours,
    "completed_hours_in_second": completedHoursInSecond,
    "late_comings": lateComings,
    "over_time_in_second": overTimeInSecond,
    "over_time": overTime,
    "absentees": absentees,
    "allowed_leaves": allowedLeaves,
    "leave_availed": leaveAvailed,
    "total_adjusted_late_min": totalAdjustedLateMin,
    "attendance": List<dynamic>.from(attendance.map((x) => x.toJson())),
    "allowed_late_min": allowedLateMin,
    "used_late_min": usedLateMin,
  };
}

class Attendance {
  Attendance({
    required this.day,
    required this.hours,
  });

  final int day;
  final int hours;

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
    day: json["day"],
    hours: json["hours"],
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "hours": hours,
  };
}
