// ignore_for_file: must_be_immutable

part of 'chats_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Chats widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ChatsEvent extends Equatable {}

/// Event that is dispatched when the Chats widget is first created.
class ChatsInitialEvent extends ChatsEvent {
  @override
  List<Object?> get props => [];
}
