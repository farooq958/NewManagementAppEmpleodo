part of 'login_user_cubit.dart';

@immutable
abstract class LoginUserState {}

class LoginUserInitial extends LoginUserState {}
class LoginUserLoaded extends LoginUserState {}
class LoginUserLoading extends LoginUserState {}
class LoginUserInternetError extends LoginUserState {}
class LoginUserUnknownError extends LoginUserState {}
