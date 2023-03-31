import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  /// reference of Shared Preferences
  static SharedPreferences? _preferences;

  /// Initialization of Shared Preferences
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();


  static Future generalSetEmpId({required String? empId}) async =>
      await _preferences?.setString(
          "emp_id", empId ?? 'no_id');
  static String? generalGetEmpId() =>
      _preferences!.getString("emp_id");


  static Future generalSetSessionId({required String? empId}) async =>
      await _preferences?.setString(
          "emp_session_id", empId ?? 'no_id');
  static String? generalGetSessionId() =>
      _preferences!.getString("emp_session_id");

  static Future generalSetOrgId({required String? empId}) async =>
      await _preferences?.setString(
          "emp_org_id", empId ?? 'no_id');
  static String? generalGetOrgId() =>
      _preferences!.getString("emp_org_id");

  static Future generalSetBranchId({required String? empId}) async =>
      await _preferences?.setString(
          "emp_branch_id", empId ?? 'no_id');
  static String? generalGetBranchId() =>
      _preferences!.getString("emp_branch_id");

  static Future generalSetJwt({required String? empId}) async =>
      await _preferences?.setString(
          "JWT", empId ?? 'no_id');
  static String? generalGetJwt() =>
      _preferences!.getString("JWT");
  static Future generalSetDepartmentId({required String? empId}) async =>
      await _preferences?.setString(
          "Depart_id", empId ?? 'no_id');
  static String? generalGetDepartId() =>
      _preferences!.getString("Depart_id");


  static Future generalSetOneId({required String? empId}) async =>
      await _preferences?.setString(
          "OneId", empId ?? 'no_id');
  static String? generalGetOneId() =>
      _preferences!.getString("OneId");
}