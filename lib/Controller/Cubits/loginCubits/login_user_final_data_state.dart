part of 'login_user_final_data_cubit.dart';

@immutable
abstract class LoginUserFinalDataState {}

class LoginUserFinalDataInitial extends LoginUserFinalDataState {}
class LoginUserFinalDataLoaded extends LoginUserFinalDataState {}
class LoginUserFinalDataLoading extends LoginUserFinalDataState {}
class LoginUserFinalDataInternetError extends LoginUserFinalDataState {}
class LoginUserFinalDataUnknownError extends LoginUserFinalDataState {}

