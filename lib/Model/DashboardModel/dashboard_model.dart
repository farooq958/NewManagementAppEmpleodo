// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) => DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  DashboardModel({
    required this.status,
    required this.attendance,
    required this.personalInfo,
    required this.notifications,
    required this.notices,
    required this.tasks,
    required this.payrollInfo,
    required this.extraDuties,
  });

  final String status;
  final DashboardModelAttendance attendance;
  final PersonalInfo personalInfo;
  final String notifications;
  final List<Notice> notices;
  final List<dynamic> tasks;
  final PayrollInfo payrollInfo;
  final List<dynamic> extraDuties;

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
    status: json["status"],
    attendance: DashboardModelAttendance.fromJson(json["attendance"]),
    personalInfo: PersonalInfo.fromJson(json["personal_info"]),
    notifications: json["notifications"],
    notices: List<Notice>.from(json["notices"].map((x) => Notice.fromJson(x))),
    tasks: List<dynamic>.from(json["tasks"].map((x) => x)),
    payrollInfo: PayrollInfo.fromJson(json["payroll_info"]),
    extraDuties: List<dynamic>.from(json["extra_duties"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "attendance": attendance.toJson(),
    "personal_info": personalInfo.toJson(),
    "notifications": notifications,
    "notices": List<dynamic>.from(notices.map((x) => x.toJson())),
    "tasks": List<dynamic>.from(tasks.map((x) => x)),
    "payroll_info": payrollInfo.toJson(),
    "extra_duties": List<dynamic>.from(extraDuties.map((x) => x)),
  };
}

class DashboardModelAttendance {
  DashboardModelAttendance({
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
  final List<AttendanceElement> attendance;
  final String allowedLateMin;
  final int usedLateMin;

  factory DashboardModelAttendance.fromJson(Map<String, dynamic> json) => DashboardModelAttendance(
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
    attendance: List<AttendanceElement>.from(json["attendance"].map((x) => AttendanceElement.fromJson(x))),
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

class AttendanceElement {
  AttendanceElement({
    required this.day,
    required this.hours,
  });

  final int day;
  final int hours;

  factory AttendanceElement.fromJson(Map<String, dynamic> json) => AttendanceElement(
    day: json["day"],
    hours: json["hours"],
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "hours": hours,
  };
}

class Notice {
  Notice({
    required this.title,
    required this.description,
    required this.date,
  });

  final String title;
  final String description;
  final String date;

  factory Notice.fromJson(Map<String, dynamic> json) => Notice(
    title: json["title"],
    description: json["description"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "date": date,
  };
}

class PayrollInfo {
  PayrollInfo({
    required this.basicSalary,
    required this.currentSalary,
    required this.overtimeRate,
    required this.increments,
  });

  final String basicSalary;
  final String currentSalary;
  final String overtimeRate;
  final List<Increment> increments;

  factory PayrollInfo.fromJson(Map<String, dynamic> json) => PayrollInfo(
    basicSalary: json["basic_salary"],
    currentSalary: json["current_salary"],
    overtimeRate: json["overtime_rate"],
    increments: List<Increment>.from(json["increments"].map((x) => Increment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "basic_salary": basicSalary,
    "current_salary": currentSalary,
    "overtime_rate": overtimeRate,
    "increments": List<dynamic>.from(increments.map((x) => x.toJson())),
  };
}

class Increment {
  Increment({
    required this.incAmount,
    required this.detail,
    required this.date,
  });

  final String incAmount;
  final String detail;
  final String date;

  factory Increment.fromJson(Map<String, dynamic> json) => Increment(
    incAmount: json["inc_amount"],
    detail: json["detail"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "inc_amount": incAmount,
    "detail": detail,
    "date": date,
  };
}

class PersonalInfo {
  PersonalInfo({
    required this.designationId,
    required this.designation,
    required this.department,
    required this.mobileAttendance,
    required this.signedIn,
    required this.todayAttStatus,
    required this.webAttStatus,
    required this.expensePocStatus,
    required this.hrPolicy,
    required this.hrPolicyId,
    required this.hrPolicyType,
    required this.dp,
    required this.name,
    required this.salary,
    required this.empId,
    required this.dutyHours,
    required this.dutyTimings,
    required this.joinDate,
    required this.branchAddress,
    required this.branchId,
    required this.jobDescription,
    required this.serviceDuration,
  });

  final String designationId;
  final String designation;
  final String department;
  final bool mobileAttendance;
  final bool signedIn;
  final TodayAttStatus todayAttStatus;
  final String webAttStatus;
  final bool expensePocStatus;
  final String hrPolicy;
  final String hrPolicyId;
  final String hrPolicyType;
  final String dp;
  final String name;
  final String salary;
  final int empId;
  final int dutyHours;
  final String dutyTimings;
  final String joinDate;
  final String branchAddress;
  final String branchId;
  final String jobDescription;
  final String serviceDuration;

  factory PersonalInfo.fromJson(Map<String, dynamic> json) => PersonalInfo(
    designationId: json["designation_id"],
    designation: json["designation"],
    department: json["department"],
    mobileAttendance: json["mobile_attendance"],
    signedIn: json["signed_in"],
    todayAttStatus: TodayAttStatus.fromJson(json["todayAttStatus"]),
    webAttStatus: json["web_att_status"],
    expensePocStatus: json["expense_POC_status"],
    hrPolicy: json["hr_policy"],
    hrPolicyId: json["hr_policy_id"],
    hrPolicyType: json["hr_policy_type"],
    dp: json["dp"],
    name: json["name"],
    salary: json["salary"],
    empId: json["emp_id"],
    dutyHours: json["duty_hours"],
    dutyTimings: json["duty_timings"],
    joinDate: json["join_date"],
    branchAddress: json["branch_address"],
    branchId: json["branch_id"],
    jobDescription: json["job_description"],
    serviceDuration: json["service_duration"],
  );

  Map<String, dynamic> toJson() => {
    "designation_id": designationId,
    "designation": designation,
    "department": department,
    "mobile_attendance": mobileAttendance,
    "signed_in": signedIn,
    "todayAttStatus": todayAttStatus.toJson(),
    "web_att_status": webAttStatus,
    "expense_POC_status": expensePocStatus,
    "hr_policy": hrPolicy,
    "hr_policy_id": hrPolicyId,
    "hr_policy_type": hrPolicyType,
    "dp": dp,
    "name": name,
    "salary": salary,
    "emp_id": empId,
    "duty_hours": dutyHours,
    "duty_timings": dutyTimings,
    "join_date": joinDate,
    "branch_address": branchAddress,
    "branch_id": branchId,
    "job_description": jobDescription,
    "service_duration": serviceDuration,
  };
}

class TodayAttStatus {
  TodayAttStatus({
    required this.currentStatus,
    required this.workingStatus,
    required this.loginTime,
    required this.mobileAttendance,
    required this.signedIn,
  });

  final String currentStatus;
  final String workingStatus;
  final String loginTime;
  final bool mobileAttendance;
  final int signedIn;  ///this was changed from bool to int

  factory TodayAttStatus.fromJson(Map<String, dynamic> json) => TodayAttStatus(
    currentStatus: json["current_status"],
    workingStatus: json["working_status"],
    loginTime: json["login_time"],
    mobileAttendance: json["mobile_attendance"],
    signedIn: json["signed_in"],
  );

  Map<String, dynamic> toJson() => {
    "current_status": currentStatus,
    "working_status": workingStatus,
    "login_time": loginTime,
    "mobile_attendance": mobileAttendance,
    "signed_in": signedIn,
  };
}
