

import 'app_constants.dart';

getDashboardUri({required userId,required month,required year}){

  return "$dashboardUri&user_id=$userId&month=$month&year=$year";
}
 const dashboardUri="https://emp-beta.veevotech.com/api/get_data.php?operation=dashboard";
const attendanceUri="https://emp-beta.veevotech.com/api/get_data.php?operation=attendance";
 const last30DaysUri="https://emp-beta.veevotech.com/api/get_data.php?operation=emp_att_in_out&user_id=";
 const leaveBalanceUri="https://emp-beta.veevotech.com/api/get_data.php?operation=leave_balance&user_id=";
 const hrPolicyUri="https://emp-beta.veevotech.com/api/get_data.php?";
 const setUri="https://emp-beta.veevotech.com/api/set_data.php";
 const getUser="https://oneid.veevotech.com/service_api/verify_username?username=";
 const getInstance="https://oneid.veevotech.com/auth/?grant_type=access_token&api=true&app_id=";
getAttendanceUri({required userId,required month,required year}){

  return "$attendanceUri&user_id=$userId&month=$month&year=$year";
}
getLoginUri(username,password){

  return "https://oneid.veevotech.com/auth/?type=password&app_id=$appId&username=$username&password=$password&grant_type=$grantType&api=true";
}
const sendOtp="https://oneid.veevotech.com/web_operations/login_register_ops/login_register_ops?operation=send_otp&username=";