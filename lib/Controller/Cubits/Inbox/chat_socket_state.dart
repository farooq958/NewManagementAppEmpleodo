part of 'chat_socket_cubit.dart';

@immutable
abstract class ChatSocketState {}

class ChatSocketInitial extends ChatSocketState {}
class ChatSocketLoaded extends ChatSocketState {}
class ChatSocketInternetError extends ChatSocketState {}
class ChatSocketUnknownError extends ChatSocketState {}
