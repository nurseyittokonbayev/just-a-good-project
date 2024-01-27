part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {}

class LoginEnterEvent extends LoginEvent {
  final String email;
  final String password;

  LoginEnterEvent({
    required this.email,
    required this.password,
  });
  @override
  List<Object?> get props => [];
}
