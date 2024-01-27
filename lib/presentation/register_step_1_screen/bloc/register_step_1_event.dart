part of 'register_step_1_bloc.dart';

abstract class AuthEvent extends Equatable {}

class SendDataEvent extends AuthEvent {
  final String email;
  final String password;

  SendDataEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
