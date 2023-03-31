part of 'inbox_stories_cubit.dart';

@immutable
abstract class InboxStoriesState {}

class InboxStoriesInitial extends InboxStoriesState {}
class InboxStoriesLoading extends InboxStoriesState {}
class  InboxStoriesLoaded extends InboxStoriesState {}
class  InboxStoriesInternetError extends InboxStoriesState {}
class  InboxStoriesUnknownError extends InboxStoriesState {}
