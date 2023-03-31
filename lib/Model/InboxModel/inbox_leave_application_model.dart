// To parse this JSON data, do
//
//     final inboxLeaveApplicationModel = inboxLeaveApplicationModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

InboxLeaveApplicationModel inboxLeaveApplicationModelFromJson(String str) => InboxLeaveApplicationModel.fromJson(json.decode(str));

String inboxLeaveApplicationModelToJson(InboxLeaveApplicationModel data) => json.encode(data.toJson());

class InboxLeaveApplicationModel {
  InboxLeaveApplicationModel({
    required this.status,
    required this.dbData,
  });

  final String status;
  final List<DbDatum> dbData;

  factory InboxLeaveApplicationModel.fromJson(Map<String, dynamic> json) => InboxLeaveApplicationModel(
    status: json["STATUS"],
    dbData: List<DbDatum>.from(json["DB_DATA"].map((x) => DbDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "STATUS": status,
    "DB_DATA": List<dynamic>.from(dbData.map((x) => x.toJson())),
  };
}

class DbDatum {
  DbDatum({
    required this.id,
    required this.appId,
    required this.oneId,
    required this.afTemplate,
    required this.orgId,
    required this.formId,
    required this.formData,
    required this.status,
    required this.webhookUpdateStatus,
    required this.webhookUpdateTime,
    required this.entryTime,
    required this.formLabels,
    required this.userName,
    required this.dp,
    required this.department,
    required this.formName,
    required this.approvalMembers,
  });

  final int id;
  final int appId;
  final int oneId;
  final int afTemplate;
  final int orgId;
  final int formId;
  final FormData formData;
  final int status;
  final int webhookUpdateStatus;
  final int webhookUpdateTime;
  final int entryTime;
  final FormLabels formLabels;
  final String userName;
  final String dp;
  final String department;
  final String formName;
  final List<ApprovalMember> approvalMembers;

  factory DbDatum.fromJson(Map<String, dynamic> json) => DbDatum(
    id: json["_id"],
    appId: json["app_id"],
    oneId: json["one_id"],
    afTemplate: json["af_template"],
    orgId: json["org_id"],
    formId: json["form_id"],
    formData: FormData.fromJson(json["form_data"]),
    status: json["status"],
    webhookUpdateStatus: json["webhook_update_status"],
    webhookUpdateTime: json["webhook_update_time"],
    entryTime: json["entry_time"],
    formLabels: FormLabels.fromJson(json["form_labels"]),
    userName: json["user_name"],
    dp: json["dp"],
    department: json["department"],
    formName: json["form_name"],
    approvalMembers: List<ApprovalMember>.from(json["approval_members"].map((x) => ApprovalMember.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "app_id": appId,
    "one_id": oneId,
    "af_template": afTemplate,
    "org_id": orgId,
    "form_id": formId,
    "form_data": formData.toJson(),
    "status": status,
    "webhook_update_status": webhookUpdateStatus,
    "webhook_update_time": webhookUpdateTime,
    "entry_time": entryTime,
    "form_labels": formLabels.toJson(),
    "user_name": userName,
    "dp": dp,
    "department": department,
    "form_name": formName,
    "approval_members": List<dynamic>.from(approvalMembers.map((x) => x.toJson())),
  };
}

class ApprovalMember {
  ApprovalMember({
    required this.id,
    required this.orgId,
    required this.templateId,
    required this.level,
    required this.levelId,
    required this.approvalIndex,
    required this.oneid,
    required this.status,
    required this.entryTime,
    required this.approvedBy,
    required this.lastUpdateTime,
    required this.approvedName,
    required this.statusLbl,
  });

  final String id;
  final String orgId;
  final String templateId;
  final String level;
  final String levelId;
  final String approvalIndex;
  final String oneid;
  final String status;
  final String entryTime;
  final String approvedBy;
  final String lastUpdateTime;
  final String approvedName;
  final String statusLbl;

  factory ApprovalMember.fromJson(Map<String, dynamic> json) => ApprovalMember(
    id: json["id"],
    orgId: json["org_id"],
    templateId: json["template_id"],
    level: json["level"],
    levelId: json["level_id"],
    approvalIndex: json["approval_index"],
    oneid: json["oneid"],
    status: json["status"],
    entryTime: json["entry_time"],
    approvedBy: json["approved_by"],
    lastUpdateTime: json["last_update_time"],
    approvedName: json["approved_name"],
    statusLbl: json["status_lbl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "org_id": orgId,
    "template_id": templateId,
    "level": level,
    "level_id": levelId,
    "approval_index": approvalIndex,
    "oneid": oneid,
    "status": status,
    "entry_time": entryTime,
    "approved_by": approvedBy,
    "last_update_time": lastUpdateTime,
    "approved_name": approvedName,
    "status_lbl": statusLbl,
  };
}

class FormData {
  FormData({
    required this.fileUrl,
    required this.empId,
    required this.appBody,
    required this.subject,
    required this.leaveAppStartDate,
    required this.leaveAppEndDate,
    required this.accessToken,
    required this.formLabel,
    required this.branchId,
    required this.leaveDate,
    required this.leaveAdjustIn,
    required this.halfDay,
  });

  final dynamic fileUrl;
  final String empId;
  final String appBody;
  final String subject;
  final String leaveAppStartDate;
  final DateTime leaveAppEndDate;
  final String accessToken;
  final String formLabel;
  final String branchId;
  final List<String> leaveDate;
  final List<String> leaveAdjustIn;
  final List<String> halfDay;

  factory FormData.fromJson(Map<String, dynamic> json) => FormData(
    fileUrl: json["file_url"],
    empId: json["emp_id"],
    appBody: json["app_body"],
    subject: json["subject"],
    leaveAppStartDate: json["leave_app_start_date"],
    leaveAppEndDate: DateTime.parse(json["leave_app_end_date"]),
    accessToken: json["access_token"],
    formLabel: json["form_label"],
    branchId: json["branch_id"],
    leaveDate: List<String>.from(json["leave_date"].map((x) => x)),
    leaveAdjustIn: List<String>.from(json["leave_adjust_in"].map((x) => x)),
    halfDay: List<String>.from(json["half_day"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "file_url": fileUrl,
    "emp_id": empId,
    "app_body": appBody,
    "subject": subject,
    "leave_app_start_date": leaveAppStartDate,
    "leave_app_end_date": "${leaveAppEndDate.year.toString().padLeft(4, '0')}-${leaveAppEndDate.month.toString().padLeft(2, '0')}-${leaveAppEndDate.day.toString().padLeft(2, '0')}",
    "access_token": accessToken,
    "form_label": formLabel,
    "branch_id": branchId,
    "leave_date": List<dynamic>.from(leaveDate.map((x) => x)),
    "leave_adjust_in": List<dynamic>.from(leaveAdjustIn.map((x) => x)),
    "half_day": List<dynamic>.from(halfDay.map((x) => x)),
  };
}

class FormLabels {
  FormLabels({
    required this.subject,
    required this.appBody,
    required this.leaveAppStartDate,
    required this.leaveAppEndDate,
    required this.generateLeaveDates,
    required this.customFile,
  });

  final String subject;
  final String appBody;
  final String leaveAppStartDate;
  final String leaveAppEndDate;
  final String generateLeaveDates;
  final String customFile;

  factory FormLabels.fromJson(Map<String, dynamic> json) => FormLabels(
    subject: json["subject"],
    appBody: json["app_body"],
    leaveAppStartDate: json["leave_app_start_date"],
    leaveAppEndDate: json["leave_app_end_date"],
    generateLeaveDates: json["generate_leave_dates"],
    customFile: json["customFile[]"],
  );

  Map<String, dynamic> toJson() => {
    "subject": subject,
    "app_body": appBody,
    "leave_app_start_date": leaveAppStartDate,
    "leave_app_end_date": leaveAppEndDate,
    "generate_leave_dates": generateLeaveDates,
    "customFile[]": customFile,
  };
}
