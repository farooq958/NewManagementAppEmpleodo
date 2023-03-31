part of 'find_user_cubit.dart';

@immutable
abstract class FindUserState {}

class FindUserInitial extends FindUserState {}
class FindUserLoaded extends FindUserState {}
class FindUserLoading extends FindUserState {}
class FindUserInternetError extends FindUserState {}
class FindUserUnknownError extends FindUserState {}