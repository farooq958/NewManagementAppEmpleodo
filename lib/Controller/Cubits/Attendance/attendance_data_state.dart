part of 'attendance_data_cubit.dart';

@immutable
abstract class AttendanceDataState {}

class AttendanceDataInitial extends AttendanceDataState {}
class AttendanceDataLoaded extends AttendanceDataState {}
class AttendanceDataInternetError extends AttendanceDataState {}
class AttendanceDataUnknownError extends AttendanceDataState {}