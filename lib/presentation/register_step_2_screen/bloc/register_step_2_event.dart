// В файле register_step_2_event.dart

part of 'register_step_2_bloc.dart';

@immutable
abstract class RegisterStep2Event extends Equatable {}

class RegisterStep2InitialEvent extends RegisterStep2Event {
  @override
  List<Object?> get props => [];
}

class NavigateToNextPageEvent extends RegisterStep2Event {
  @override
  List<Object?> get props => [];
}
