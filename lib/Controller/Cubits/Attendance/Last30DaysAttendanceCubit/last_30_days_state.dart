part of 'last_30_days_cubit.dart';

@immutable
abstract class Last30DaysState {}

class Last30DaysInitial extends Last30DaysState {}
class Last30DaysLoaded extends Last30DaysState {}
class Last30DaysInternetError extends Last30DaysState {}
class Last30DaysUnknownError extends Last30DaysState {}