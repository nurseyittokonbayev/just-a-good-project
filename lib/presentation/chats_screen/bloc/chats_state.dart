// ignore_for_file: must_be_immutable

part of 'chats_bloc.dart';

abstract class ChatsState {}

class ChatInitial extends ChatsState {}

class ChatLoading extends ChatsState {}

class ChatSuccess extends ChatsState {
  ChatSuccess({required this.comments});

  final List<UserCommentModel> comments;
}

class ChatError extends ChatsState {
  ChatError({required this.message});

  final String? message;
}
