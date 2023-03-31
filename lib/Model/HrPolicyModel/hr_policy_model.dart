// To parse this JSON data, do
//
//     final hrPolicyModel = hrPolicyModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HrPolicyModel hrPolicyModelFromJson(String str) => HrPolicyModel.fromJson(json.decode(str));

String hrPolicyModelToJson(HrPolicyModel data) => json.encode(data.toJson());

class HrPolicyModel {
  HrPolicyModel({
    required this.the0,
    required this.the1,
    required this.the2,
    required this.the3,
    required this.the4,
    required this.the5,
    required this.the6,
    required this.the7,
    required this.the8,
    required this.the9,
    required this.the10,
    required this.the11,
    required this.the12,
    required this.the13,
    required this.the14,
    required this.the15,
    required this.the16,
    required this.the17,
    required this.the18,
    required this.the19,
    required this.the20,
    required this.the21,
    required this.the22,
    required this.the23,
    required this.the24,
    required this.the25,
    required this.the26,
    required this.the27,
    required this.id,
    required this.orgId,
    required this.branchId,
    required this.depttId,
    required this.leaveGroupId,
    required this.policyName,
    required this.payroll,
    required this.minRestPeriod,
    required this.overtimePay,
    required this.overtimeDueMinutes,
    required this.discartPrevOt,
    required this.overtimeMinMinutes,
    required this.forceTimeout,
    required this.startingTime,
    required this.leniencyTime,
    required this.earlyArrival,
    required this.earlyArrivalMaxTime,
    required this.closingTime,
    required this.workingDays,
    required this.workingHours,
    required this.workingMin,
    required this.timeoutPolicy,
    required this.lateTimeInMinutes,
    required this.lateComersPenalty,
    required this.allowedOffs,
    required this.creationTime,
    required this.status,
    required this.useMultiDevices,
    required this.leaveGroup,
    required this.dailyTimings,
    required this.overtimeRules,
    required this.payMonth,
    required this.swapPolicy,
    required this.percentageRules,
  });

  final String the0;
  final String the1;
  final String the2;
  final String the3;
  final String the4;
  final String the5;
  final String the6;
  final String the7;
  final String the8;
  final String the9;
  final String the10;
  final String the11;
  final String the12;
  final String the13;
  final String the14;
  final String the15;
  final String the16;
  final String the17;
  final String the18;
  final String the19;
  final String the20;
  final String the21;
  final String the22;
  final String the23;
  final String the24;
  final String the25;
  final String the26;
  final String the27;
  final String id;
  final String orgId;
  final String branchId;
  final String depttId;
  final String leaveGroupId;
  final String policyName;
  final String payroll;
  final String minRestPeriod;
  final String overtimePay;
  final String overtimeDueMinutes;
  final String discartPrevOt;
  final String overtimeMinMinutes;
  final String forceTimeout;
  final String startingTime;
  final String leniencyTime;
  final String earlyArrival;
  final String earlyArrivalMaxTime;
  final String closingTime;
  final String workingDays;
  final String workingHours;
  final String workingMin;
  final String timeoutPolicy;
  final String lateTimeInMinutes;
  final String lateComersPenalty;
  final String allowedOffs;
  final String creationTime;
  final String status;
  final String useMultiDevices;
  final String leaveGroup;
  final List<dynamic> dailyTimings;
  final OvertimeRules overtimeRules;
  final String payMonth;
  final List<dynamic> swapPolicy;
  final List<dynamic> percentageRules;

  factory HrPolicyModel.fromJson(Map<String, dynamic> json) => HrPolicyModel(
    the0: json["0"],
    the1: json["1"],
    the2: json["2"],
    the3: json["3"],
    the4: json["4"],
    the5: json["5"],
    the6: json["6"],
    the7: json["7"],
    the8: json["8"],
    the9: json["9"],
    the10: json["10"],
    the11: json["11"],
    the12: json["12"],
    the13: json["13"],
    the14: json["14"],
    the15: json["15"],
    the16: json["16"],
    the17: json["17"],
    the18: json["18"],
    the19: json["19"],
    the20: json["20"],
    the21: json["21"],
    the22: json["22"],
    the23: json["23"],
    the24: json["24"],
    the25: json["25"],
    the26: json["26"],
    the27: json["27"],
    id: json["id"],
    orgId: json["org_id"],
    branchId: json["branch_id"],
    depttId: json["deptt_id"],
    leaveGroupId: json["leave_group_id"],
    policyName: json["policy_name"],
    payroll: json["payroll"],
    minRestPeriod: json["min_rest_period"],
    overtimePay: json["overtime_pay"],
    overtimeDueMinutes: json["overtime_due_minutes"],
    discartPrevOt: json["discart_prev_ot"],
    overtimeMinMinutes: json["overtime_min_minutes"],
    forceTimeout: json["force_timeout"],
    startingTime: json["starting_time"],
    leniencyTime: json["leniency_time"],
    earlyArrival: json["early_arrival"],
    earlyArrivalMaxTime: json["early_arrival_max_time"],
    closingTime: json["closing_time"],
    workingDays: json["working_days"],
    workingHours: json["working_hours"],
    workingMin: json["working_min"],
    timeoutPolicy: json["timeout_policy"],
    lateTimeInMinutes: json["late_time_in_minutes"],
    lateComersPenalty: json["late_comers_penalty"],
    allowedOffs: json["allowed_offs"],
    creationTime: json["creation_time"],
    status: json["status"],
    useMultiDevices: json["use_multi_devices"],
    leaveGroup: json["leave_group"],
    dailyTimings: List<dynamic>.from(json["daily_timings"].map((x) => x)),
    overtimeRules: OvertimeRules.fromJson(json["overtime_rules"]),
    payMonth: json["pay_month"],
    swapPolicy: List<dynamic>.from(json["swap_policy"].map((x) => x)),
    percentageRules: List<dynamic>.from(json["percentage_rules"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "0": the0,
    "1": the1,
    "2": the2,
    "3": the3,
    "4": the4,
    "5": the5,
    "6": the6,
    "7": the7,
    "8": the8,
    "9": the9,
    "10": the10,
    "11": the11,
    "12": the12,
    "13": the13,
    "14": the14,
    "15": the15,
    "16": the16,
    "17": the17,
    "18": the18,
    "19": the19,
    "20": the20,
    "21": the21,
    "22": the22,
    "23": the23,
    "24": the24,
    "25": the25,
    "26": the26,
    "27": the27,
    "id": id,
    "org_id": orgId,
    "branch_id": branchId,
    "deptt_id": depttId,
    "leave_group_id": leaveGroupId,
    "policy_name": policyName,
    "payroll": payroll,
    "min_rest_period": minRestPeriod,
    "overtime_pay": overtimePay,
    "overtime_due_minutes": overtimeDueMinutes,
    "discart_prev_ot": discartPrevOt,
    "overtime_min_minutes": overtimeMinMinutes,
    "force_timeout": forceTimeout,
    "starting_time": startingTime,
    "leniency_time": leniencyTime,
    "early_arrival": earlyArrival,
    "early_arrival_max_time": earlyArrivalMaxTime,
    "closing_time": closingTime,
    "working_days": workingDays,
    "working_hours": workingHours,
    "working_min": workingMin,
    "timeout_policy": timeoutPolicy,
    "late_time_in_minutes": lateTimeInMinutes,
    "late_comers_penalty": lateComersPenalty,
    "allowed_offs": allowedOffs,
    "creation_time": creationTime,
    "status": status,
    "use_multi_devices": useMultiDevices,
    "leave_group": leaveGroup,
    "daily_timings": List<dynamic>.from(dailyTimings.map((x) => x)),
    "overtime_rules": overtimeRules.toJson(),
    "pay_month": payMonth,
    "swap_policy": List<dynamic>.from(swapPolicy.map((x) => x)),
    "percentage_rules": List<dynamic>.from(percentageRules.map((x) => x)),
  };
}

class OvertimeRules {
  OvertimeRules({
    required this.id,
    required this.policyId,
    required this.dailyOtRate,
    required this.dailyOtVal,
    required this.holidayOtRate,
    required this.holidayOtVal,
    required this.hOtOtherAmount,
  });

  final String id;
  final String policyId;
  final String dailyOtRate;
  final String dailyOtVal;
  final String holidayOtRate;
  final String holidayOtVal;
  final String hOtOtherAmount;

  factory OvertimeRules.fromJson(Map<String, dynamic> json) => OvertimeRules(
    id: json["id"],
    policyId: json["policy_id"],
    dailyOtRate: json["daily_ot_rate"],
    dailyOtVal: json["daily_ot_val"],
    holidayOtRate: json["holiday_ot_rate"],
    holidayOtVal: json["holiday_ot_val"],
    hOtOtherAmount: json["h_ot_other_amount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "policy_id": policyId,
    "daily_ot_rate": dailyOtRate,
    "daily_ot_val": dailyOtVal,
    "holiday_ot_rate": holidayOtRate,
    "holiday_ot_val": holidayOtVal,
    "h_ot_other_amount": hOtOtherAmount,
  };
}
