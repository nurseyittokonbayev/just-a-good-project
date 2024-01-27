// ignore_for_file: must_be_immutable

part of 'individual_chat_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///IndividualChat widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class IndividualChatEvent extends Equatable {}

/// Event that is dispatched when the IndividualChat widget is first created.
class IndividualChatInitialEvent extends IndividualChatEvent {
  @override
  List<Object?> get props => [];
}
