part of 'change_dp_cubit.dart';

@immutable
abstract class ChangeDpState {}

class ChangeDpInitial extends ChangeDpState {}
class ChangeDpLoaded extends ChangeDpState{}
class ChangeDpInternetError extends ChangeDpState{}
class ChangeDpUnknownError extends ChangeDpState{}
