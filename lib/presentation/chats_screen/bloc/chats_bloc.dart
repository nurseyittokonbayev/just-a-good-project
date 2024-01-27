import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:photo/data/apiClient/api_client.dart';
import '/core/app_export.dart';
import '../models/user_comment_model.dart';
part 'chats_event.dart';
part 'chats_state.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  ChatsBloc(this.apiService) : super(ChatInitial()) {
    on<ChatsEvent>(_getComments);
  }
  final ApiService apiService;

  Future<void> _getComments(
    ChatsEvent event,
    Emitter<ChatsState> emit,
  ) async {
    emit(ChatLoading());
    try {
      final comments = await apiService.getComments();
      if (comments != null) {
        emit(ChatSuccess(comments: comments));
      } else {
        emit(ChatError(message: 'Комментарии пуст'));
      }
    } catch (e) {
      emit(ChatError(message: 'Не удалось получить комментарии: $e'));
    }
  }
}
