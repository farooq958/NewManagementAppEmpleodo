part of 'inbox_application_details_cubit.dart';

@immutable
abstract class InboxApplicationDetailsState {}

class InboxApplicationDetailsInitial extends InboxApplicationDetailsState {}
class InboxApplicationDetailsLoading extends InboxApplicationDetailsState {}
class InboxApplicationDetailsLoaded extends InboxApplicationDetailsState {}
class InboxApplicationDetailsInternetError extends InboxApplicationDetailsState {}
class InboxApplicationDetailsUnknownError extends InboxApplicationDetailsState {}
