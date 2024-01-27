import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:photo/presentation/individual_chat_screen/models/individual_chat_model.dart';
part 'individual_chat_event.dart';
part 'individual_chat_state.dart';

/// A bloc that manages the state of a IndividualChat according to the event that is dispatched to it.
class IndividualChatBloc
    extends Bloc<IndividualChatEvent, IndividualChatState> {
  IndividualChatBloc(IndividualChatState initialState) : super(initialState) {
    on<IndividualChatInitialEvent>(_onInitialize);
  }

  _onInitialize(
    IndividualChatInitialEvent event,
    Emitter<IndividualChatState> emit,
  ) async {
    emit(state.copyWith(messageController: TextEditingController()));
  }
}
