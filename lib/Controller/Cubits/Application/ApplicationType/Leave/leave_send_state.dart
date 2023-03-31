part of 'leave_send_cubit.dart';

@immutable
abstract class LeaveSendState {}

class LeaveSendInitial extends LeaveSendState {}
class LeaveLoading extends LeaveSendState {}
class LeaveLoaded extends LeaveSendState {}
class LeaveInternetError extends LeaveSendState {}
class LeaveUnknownError extends LeaveSendState {}
