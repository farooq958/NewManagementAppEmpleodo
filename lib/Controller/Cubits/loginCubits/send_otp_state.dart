part of 'send_otp_cubit.dart';

@immutable
abstract class SendOtpState {}

class SendOtpInitial extends SendOtpState {}
class SendOtpLoaded extends SendOtpState {}
class SendOtpLoading extends SendOtpState {}
class SendOtpInternetError extends SendOtpState {}
class SendOtpUnknownError extends SendOtpState {}