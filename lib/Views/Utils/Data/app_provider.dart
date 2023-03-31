import 'package:empleado_development/Controller/Cubits/Application/ApplicationType/Leave/leave_detail_cubit.dart';
import 'package:empleado_development/Controller/Cubits/Application/ApplicationType/Leave/leave_send_cubit.dart';
import 'package:empleado_development/Controller/Cubits/Application/ApplicationType/TimeAdjustment/time_adjustment_cubit.dart';
import 'package:empleado_development/Controller/Cubits/Application/get_form_struct_cubit.dart';
import 'package:empleado_development/Controller/Cubits/Attendance/Last30DaysAttendanceCubit/last_30_days_cubit.dart';
import 'package:empleado_development/Controller/Cubits/Attendance/LeaveBalance/leave_balancecubit_cubit.dart';
import 'package:empleado_development/Controller/Cubits/Attendance/attendance_data_cubit.dart';
import 'package:empleado_development/Controller/Cubits/DashboardCubits/animation_scale_dart_cubit.dart';
import 'package:empleado_development/Controller/Cubits/DashboardCubits/dashboard_data_cubit.dart';
import 'package:empleado_development/Controller/Cubits/HrPolicy/hr_policy_cubit.dart';
import 'package:empleado_development/Controller/Cubits/Inbox/chat_socket_cubit.dart';
import 'package:empleado_development/Controller/Cubits/Inbox/inbox_application_detail_page_view_cubit.dart';
import 'package:empleado_development/Controller/Cubits/Inbox/inbox_application_details_cubit.dart';
import 'package:empleado_development/Controller/Cubits/Inbox/inbox_stories_cubit.dart';
import 'package:empleado_development/Controller/Cubits/Inbox/socket_connect_cubit.dart';
import 'package:empleado_development/Controller/Cubits/PayrollCubit/date_picking_payroll_cubit.dart';
import 'package:empleado_development/Controller/Cubits/PerformanceCubit/FeedBack/performance_page_view_cubit.dart';
import 'package:empleado_development/Controller/Cubits/PerformanceCubit/PerformancePageViewCubit/performance_page_view_cubit.dart';
import 'package:empleado_development/Controller/Cubits/Theme/theme_cubit.dart';
import 'package:empleado_development/Controller/Cubits/change_dp_cubit.dart';
import 'package:empleado_development/Controller/Cubits/loginCubits/find_user_cubit.dart';
import 'package:empleado_development/Controller/Cubits/loginCubits/instance_cubit.dart';
import 'package:empleado_development/Controller/Cubits/loginCubits/login_radiobutton_cubit.dart';
import 'package:empleado_development/Controller/Cubits/loginCubits/login_user_cubit.dart';
import 'package:empleado_development/Controller/Cubits/loginCubits/login_user_final_data_cubit.dart';
import 'package:empleado_development/Controller/Cubits/loginCubits/send_otp_cubit.dart';
import 'package:empleado_development/Controller/Cubits/redirect_status_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

import '../../../Controller/Cubits/DashboardCubits/date_picking_cubit.dart';
import '../../../Controller/Cubits/PerformanceCubit/add_goals_date_picking_cubit.dart';
import '../../../Controller/Cubits/PerformanceCubit/add_goals_end_date_picking_cubit.dart';



final List<BlocProvider> mainCubitProvidersList=[

  BlocProvider<LoginRadiobuttonCubit>(create: (context)=>LoginRadiobuttonCubit()),
BlocProvider<AnimationScaleDartCubit>(create: (context)=>AnimationScaleDartCubit()),
  BlocProvider<DatePickingCubit>(create: (context)=>DatePickingCubit()),
  BlocProvider <PerformancePageViewCubit>(create: (context)=> PerformancePageViewCubit()),
  BlocProvider<DatePickingAddGoalsCubit>(create: (context)=>DatePickingAddGoalsCubit()),
  BlocProvider<DatePickingAddGoalsEndDateCubit>(create: (context)=>DatePickingAddGoalsEndDateCubit()),
  BlocProvider<FeedBackButtonsCubit>(create: (context)=>FeedBackButtonsCubit()),
  BlocProvider<LeaveDetailCubit>(create: (context)=>LeaveDetailCubit()),
  BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit()),
  BlocProvider<DashboardDataCubit>(create: (context)=> DashboardDataCubit()),
  BlocProvider<AttendanceDataCubit>(create: (context)=> AttendanceDataCubit()),
  BlocProvider<Last30DaysCubit>(create: (context)=> Last30DaysCubit())
  ,
  BlocProvider<LeaveBalancecubitCubit>(create: (context)=> LeaveBalancecubitCubit()),
  BlocProvider<DatePickingPayrollCubit>(create: (context)=> DatePickingPayrollCubit()),

  BlocProvider<HrPolicyCubit>(create: (context)=> HrPolicyCubit()),
  BlocProvider<ChangeDpCubit>(create: (context)=> ChangeDpCubit()),
  BlocProvider<FindUserCubit>(create: (context)=> FindUserCubit()),
  BlocProvider<LoginUserCubit>(create: (context)=> LoginUserCubit()),
  BlocProvider<LoginUserFinalDataCubit>(create: (context)=> LoginUserFinalDataCubit()),
  BlocProvider<SendOtpCubit>(create: (context)=> SendOtpCubit()),
  BlocProvider<InstanceCubit>(create: (context)=> InstanceCubit()),
  BlocProvider<RedirectStatusCubit>(create: (context)=> RedirectStatusCubit()),
  BlocProvider<GetFormStructCubit>(create: (context)=> GetFormStructCubit()),
  BlocProvider<TimeAdjustmentCubit>(create: (context)=> TimeAdjustmentCubit()),
  BlocProvider<LeaveSendCubit>(create: (context)=> LeaveSendCubit()),
  BlocProvider<InboxStoriesCubit>(create: (context)=> InboxStoriesCubit()),
  BlocProvider<ChatSocketCubit>(create: (context)=> ChatSocketCubit()),
  BlocProvider<SocketConnectCubit>(create: (context)=> SocketConnectCubit()),
  BlocProvider<InboxApplicationDetailsCubit>(create: (context)=>InboxApplicationDetailsCubit()),
  BlocProvider<InboxApplicationDetailPageViewCubit>(create: (context)=>InboxApplicationDetailPageViewCubit())
];