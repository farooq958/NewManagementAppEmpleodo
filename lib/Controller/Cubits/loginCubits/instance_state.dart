part of 'instance_cubit.dart';

@immutable
abstract class InstanceState {}

class InstanceInitial extends InstanceState {}
class InstanceLoaded extends InstanceState {}
class InstanceLoading extends InstanceState {}
class InstanceInternetError extends InstanceState {}
class InstanceUnknownError extends InstanceState {
 final String message;
  InstanceUnknownError({required this.message});

}