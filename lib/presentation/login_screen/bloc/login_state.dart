part of 'login_bloc.dart';

// ignore: must_be_immutable
@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginError extends LoginState {}

class LoginSuccess extends LoginState {}
