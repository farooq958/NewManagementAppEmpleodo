import 'package:empleado_development/Controller/Cubits/Application/ApplicationType/Leave/leave_detail_cubit.dart';
import 'package:empleado_development/Controller/Cubits/DashboardCubits/animation_scale_dart_cubit.dart';
import 'package:empleado_development/Controller/Cubits/PerformanceCubit/FeedBack/performance_page_view_cubit.dart';
import 'package:empleado_development/Controller/Cubits/PerformanceCubit/PerformancePageViewCubit/performance_page_view_cubit.dart';
import 'package:empleado_development/Controller/Cubits/loginCubits/login_radiobutton_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

];