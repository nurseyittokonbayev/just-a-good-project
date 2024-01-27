// ignore_for_file: must_be_immutable

part of 'register_step_1_bloc.dart';

abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AuthLoadingState extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AuthSuccessState extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AuthErrorState extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
