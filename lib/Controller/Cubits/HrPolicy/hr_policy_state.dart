part of 'hr_policy_cubit.dart';

@immutable
abstract class HrPolicyState {}

class HrPolicyInitial extends HrPolicyState {}


class  HrPolicyLoaded extends HrPolicyState {}
class  HrPolicyInternetError extends HrPolicyState {}
class  HrPolicyUnknownError extends HrPolicyState {}
