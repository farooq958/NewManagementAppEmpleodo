part of 'redirect_status_cubit.dart';

@immutable
abstract class RedirectStatusState {}

class RedirectStatusInitial extends RedirectStatusState {}
class RedirectStatusLoaded extends RedirectStatusState {}
class RedirectStatusInternetError extends RedirectStatusState {}
class RedirectStatusUnknownError extends RedirectStatusState {}