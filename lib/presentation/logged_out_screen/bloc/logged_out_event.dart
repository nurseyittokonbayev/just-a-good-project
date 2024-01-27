part of 'logged_out_bloc.dart';

@immutable
abstract class LoggedOutEvent extends Equatable {}

class LoggedOutInitialEvent extends LoggedOutEvent {
  @override
  List<Object?> get props => [];
}
