

getDashboardUri({required userId,required month,required year}){

  return "$dashboardUri&user_id=$userId&month=$month&year=$year";
}
 const dashboardUri="https://emp-beta.veevotech.com/api/get_data.php?operation=dashboard";
const attendanceUri="https://emp-beta.veevotech.com/api/get_data.php?operation=attendance";

getAttendanceUri({required userId,required month,required year}){

  return "$attendanceUri&user_id=$userId&month=$month&year=$year";
}