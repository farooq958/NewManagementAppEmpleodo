part of 'leave_balancecubit_cubit.dart';

@immutable
abstract class LeaveBalancecubitState {}

class LeaveBalancecubitInitial extends LeaveBalancecubitState {}

class LeaveBalanceLoaded extends LeaveBalancecubitState {}
class LeaveBalanceInternetError extends LeaveBalancecubitState {}
class LeaveBalanceUnknownError extends LeaveBalancecubitState {}
