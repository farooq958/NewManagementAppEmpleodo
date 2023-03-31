// To parse this JSON data, do
//
//     final leaveBalance = leaveBalanceFromJson(jsonString);

import 'dart:convert';

LeaveBalance leaveBalanceFromJson(String str) => LeaveBalance.fromJson(json.decode(str));

String leaveBalanceToJson(LeaveBalance data) => json.encode(data.toJson());

class LeaveBalance {
  LeaveBalance({
    required this.data,
  });

  final List<Datum> data;

  factory LeaveBalance.fromJson(Map<String, dynamic> json) => LeaveBalance(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.leaveId,
    required this.empId,
    required this.totalLeaves,
    required this.availed,
    required this.entryDate,
    required this.initiatedDate,
    required this.maturityDate,
    required this.expiry,
    required this.nextRun,
    required this.expiryR,
    required this.initiatedDateR,
    required this.maturityDateR,
    required this.leaveData,
  });

  final String id;
  final String leaveId;
  final String empId;
  final String totalLeaves;
  final String availed;
  final String entryDate;
  final String initiatedDate;
  final String maturityDate;
  final String expiry;
  final String nextRun;
  final String expiryR;
  final String initiatedDateR;
  final String maturityDateR;
  final LeaveData leaveData;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    leaveId: json["leave_id"],
    empId: json["emp_id"],
    totalLeaves: json["total_leaves"],
    availed: json["availed"],
    entryDate: json["entry_date"],
    initiatedDate: json["initiated_date"],
    maturityDate: json["maturity_date"],
    expiry: json["expiry"],
    nextRun: json["next_run"],
    expiryR: json["expiry_r"],
    initiatedDateR: json["initiated_date_r"],
    maturityDateR: json["maturity_date_r"],
    leaveData: LeaveData.fromJson(json["leaveData"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "leave_id": leaveId,
    "emp_id": empId,
    "total_leaves": totalLeaves,
    "availed": availed,
    "entry_date": entryDate,
    "initiated_date": initiatedDate,
    "maturity_date": maturityDate,
    "expiry": expiry,
    "next_run": nextRun,
    "expiry_r": expiryR,
    "initiated_date_r": initiatedDateR,
    "maturity_date_r": maturityDateR,
    "leaveData": leaveData.toJson(),
  };
}

class LeaveData {
  LeaveData({
    required this.id,
    required this.title,
    required this.quantity,
    required this.carryForward,
  });

  final String id;
  final String title;
  final String quantity;
  final String carryForward;

  factory LeaveData.fromJson(Map<String, dynamic> json) => LeaveData(
    id: json["id"],
    title: json["title"],
    quantity: json["quantity"],
    carryForward: json["carry_forward"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "quantity": quantity,
    "carry_forward": carryForward,
  };
}
