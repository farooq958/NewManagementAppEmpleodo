part of 'dashboard_data_cubit.dart';

@immutable
abstract class DashboardDataState {}

class DashboardDataInitial extends DashboardDataState {}
class DashboardDataLoaded extends DashboardDataState {}
class DashboardDataInternetError extends DashboardDataState {}
class DashboardDataUnknownError extends DashboardDataState {}