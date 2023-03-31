// To parse this JSON data, do
//
//     final finalLoginData = finalLoginDataFromJson(jsonString);

import 'dart:convert';

FinalLoginData finalLoginDataFromJson(String str) => FinalLoginData.fromJson(json.decode(str));

String finalLoginDataToJson(FinalLoginData data) => json.encode(data.toJson());

class FinalLoginData {
  FinalLoginData({
    required this.status,
    required this.role,
    this.sessionId,
    required this.userData,
  });

  final String status;
  final String role;
  final dynamic sessionId;
  final UserData userData;

  factory FinalLoginData.fromJson(Map<String, dynamic> json) => FinalLoginData(
    status: json["STATUS"],
    role: json["role"],
    sessionId: json["session_id"],
    userData: UserData.fromJson(json["USER_DATA"]),
  );

  Map<String, dynamic> toJson() => {
    "STATUS": status,
    "role": role,
    "session_id": sessionId,
    "USER_DATA": userData.toJson(),
  };
}

class UserData {
  UserData({
    required this.oneid,
    required this.orgOneid,
    required this.orgName,
    required this.fullUsername,
    required this.fullDp,
    required this.recordId,
    required this.accessToken,
    required this.aud,
    required this.roleId,
    required this.roleDbId,
    this.otherPermissions,
    required this.allowedAppToken,
    required this.iat,
    required this.exp,
    required this.orgData,
    required this.jwt,
    required this.birthday,
    required this.adminPrivileges,
    required this.timezone,
    required this.countryId,
    required this.id,
    required this.empSessionId,
    required this.empUserId,
    required this.empUserName,
    required this.empOrgId,
    required this.empDp,
    required this.empBranchId,
    required this.empDepartmentId,
    required this.empPortalLoggedIn,
    required this.isSuperAdmin,
  });

  final String oneid;
  final String orgOneid;
  final String orgName;
  final String fullUsername;
  final String fullDp;
  final String recordId;
  final String accessToken;
  final String aud;
  final String roleId;
  final String roleDbId;
  final dynamic otherPermissions;
  final String allowedAppToken;
  final int iat;
  final int exp;
  final OrgData orgData;
  final String jwt;
  final bool birthday;
  final String adminPrivileges;
  final String timezone;
  final String countryId;
  final String id;
  final String empSessionId;
  final String empUserId;
  final String empUserName;
  final String empOrgId;
  final String empDp;
  final String empBranchId;
  final String empDepartmentId;
  final bool empPortalLoggedIn;
  final bool isSuperAdmin;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    oneid: json["oneid"],
    orgOneid: json["org_oneid"],
    orgName: json["org_name"],
    fullUsername: json["full_username"],
    fullDp: json["full_dp"],
    recordId: json["record_id"],
    accessToken: json["access_token"],
    aud: json["aud"],
    roleId: json["role_id"],
    roleDbId: json["role_db_id"],
    otherPermissions: json["other_permissions"],
    allowedAppToken: json["allowed_app_token"],
    iat: json["iat"],
    exp: json["exp"],
    orgData: OrgData.fromJson(json["org_data"]),
    jwt: json["JWT"],
    birthday: json["birthday"],
    adminPrivileges: json["admin_privileges"],
    timezone: json["timezone"],
    countryId: json["country_id"],
    id: json["id"],
    empSessionId: json["emp_session_id"],
    empUserId: json["emp_user_id"],
    empUserName: json["emp_user_name"],
    empOrgId: json["emp_org_id"],
    empDp: json["emp_dp"],
    empBranchId: json["emp_branch_id"],
    empDepartmentId: json["emp_department_id"],
    empPortalLoggedIn: json["emp_portal_logged_in"],
    isSuperAdmin: json["is_super_admin"],
  );

  Map<String, dynamic> toJson() => {
    "oneid": oneid,
    "org_oneid": orgOneid,
    "org_name": orgName,
    "full_username": fullUsername,
    "full_dp": fullDp,
    "record_id": recordId,
    "access_token": accessToken,
    "aud": aud,
    "role_id": roleId,
    "role_db_id": roleDbId,
    "other_permissions": otherPermissions,
    "allowed_app_token": allowedAppToken,
    "iat": iat,
    "exp": exp,
    "org_data": orgData.toJson(),
    "JWT": jwt,
    "birthday": birthday,
    "admin_privileges": adminPrivileges,
    "timezone": timezone,
    "country_id": countryId,
    "id": id,
    "emp_session_id": empSessionId,
    "emp_user_id": empUserId,
    "emp_user_name": empUserName,
    "emp_org_id": empOrgId,
    "emp_dp": empDp,
    "emp_branch_id": empBranchId,
    "emp_department_id": empDepartmentId,
    "emp_portal_logged_in": empPortalLoggedIn,
    "is_super_admin": isSuperAdmin,
  };
}

class OrgData {
  OrgData({
    required this.id,
    required this.userOneid,
    required this.orgName,
    required this.orgType,
    required this.ntnNo,
    required this.orgBrfIntro,
    required this.userContact,
    required this.email,
    required this.address,
    required this.countryId,
    required this.cityId,
    required this.countryCode,
  });

  final int id;
  final int userOneid;
  final String orgName;
  final int orgType;
  final String ntnNo;
  final String orgBrfIntro;
  final String userContact;
  final String email;
  final String address;
  final int countryId;
  final int cityId;
  final String countryCode;

  factory OrgData.fromJson(Map<String, dynamic> json) => OrgData(
    id: json["_id"],
    userOneid: json["user_oneid"],
    orgName: json["org_name"],
    orgType: json["org_type"],
    ntnNo: json["ntn_no"],
    orgBrfIntro: json["org_brf_intro"],
    userContact: json["user_contact"],
    email: json["email"],
    address: json["address"],
    countryId: json["country_id"],
    cityId: json["city_id"],
    countryCode: json["country_code"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user_oneid": userOneid,
    "org_name": orgName,
    "org_type": orgType,
    "ntn_no": ntnNo,
    "org_brf_intro": orgBrfIntro,
    "user_contact": userContact,
    "email": email,
    "address": address,
    "country_id": countryId,
    "city_id": cityId,
    "country_code": countryCode,
  };
}
