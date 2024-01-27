// ignore_for_file: must_be_immutable

part of 'individual_chat_bloc.dart';

/// Represents the state of IndividualChat in the application.
class IndividualChatState extends Equatable {
  IndividualChatState({
    this.messageController,
    this.individualChatModelObj,
  });

  TextEditingController? messageController;

  IndividualChatModel? individualChatModelObj;

  @override
  List<Object?> get props => [
        messageController,
        individualChatModelObj,
      ];
  IndividualChatState copyWith({
    TextEditingController? messageController,
    IndividualChatModel? individualChatModelObj,
  }) {
    return IndividualChatState(
      messageController: messageController ?? this.messageController,
      individualChatModelObj:
          individualChatModelObj ?? this.individualChatModelObj,
    );
  }
}
