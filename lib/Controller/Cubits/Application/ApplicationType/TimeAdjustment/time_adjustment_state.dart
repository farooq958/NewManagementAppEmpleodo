part of 'time_adjustment_cubit.dart';

@immutable
abstract class TimeAdjustmentState {}

class TimeAdjustmentInitial extends TimeAdjustmentState {}
class TimeAdjustmentLoaded extends TimeAdjustmentState {}
class TimeAdjustmentLoading extends TimeAdjustmentState {}
class TimeAdjustmentInternetError extends TimeAdjustmentState {}
class TimeAdjustmentUnknownError extends TimeAdjustmentState {}
