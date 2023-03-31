// To parse this JSON data, do
//
//     final inboxAttributeApplicationModel = inboxAttributeApplicationModelFromJson(jsonString);

import 'dart:convert';

InboxAttributeApplicationModel inboxAttributeApplicationModelFromJson(String str) => InboxAttributeApplicationModel.fromJson(json.decode(str));

String inboxAttributeApplicationModelToJson(InboxAttributeApplicationModel data) => json.encode(data.toJson());

class InboxAttributeApplicationModel {
  InboxAttributeApplicationModel({
    required this.status,
    required this.dbData,
  });

  final String status;
  final List<DbDatum> dbData;

  factory InboxAttributeApplicationModel.fromJson(Map<String, dynamic> json) => InboxAttributeApplicationModel(
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
    required this.reason,
    required this.date,
    required this.inTime,
    required this.outTime,
    required this.accessToken,
    required this.deptId,
    required this.formLabel,
    required this.branchId,
  });

  final dynamic fileUrl;
  final String empId;
  final String reason;
  final String date;
  final String inTime;
  final String outTime;
  final String accessToken;
  final String deptId;
  final String formLabel;
  final String branchId;

  factory FormData.fromJson(Map<String, dynamic> json) => FormData(
    fileUrl: json["file_url"],
    empId: json["emp_id"],
    reason: json["reason"],
    date:(json["date"]),
    inTime: json["in_time"],
    outTime: json["out_time"],
    accessToken: json["access_token"],
    deptId: json["dept_id"],
    formLabel: json["form_label"],
    branchId: json["branch_id"],
  );

  Map<String, dynamic> toJson() => {
    "file_url": fileUrl,
    "emp_id": empId,
    "reason": reason,
    "date": date,
    "in_time": inTime,
    "out_time": outTime,
    "access_token": accessToken,
    "dept_id": deptId,
    "form_label": formLabel,
    "branch_id": branchId,
  };
}

class FormLabels {
  FormLabels({
    required this.timeChangeReqEmpId,
    required this.empId,
    required this.date,
    required this.inTime,
    required this.outTime,
    required this.reason,
  });

  final String timeChangeReqEmpId;
  final dynamic empId;
  final String date;
  final String inTime;
  final String outTime;
  final String reason;

  factory FormLabels.fromJson(Map<String, dynamic> json) => FormLabels(
    timeChangeReqEmpId: json["time_change_req_emp_id"],
    empId: json["emp_id"],
    date: json["date"],
    inTime: json["in_time"],
    outTime: json["out_time"],
    reason: json["reason"],
  );

  Map<String, dynamic> toJson() => {
    "time_change_req_emp_id": timeChangeReqEmpId,
    "emp_id": empId,
    "date": date,
    "in_time": inTime,
    "out_time": outTime,
    "reason": reason,
  };
}
