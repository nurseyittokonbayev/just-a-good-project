// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [individual_chat_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class IndividualChatModel extends Equatable {
  IndividualChatModel() {}

  IndividualChatModel copyWith() {
    return IndividualChatModel();
  }

  @override
  List<Object?> get props => [];
}
