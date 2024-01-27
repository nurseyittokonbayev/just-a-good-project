import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
part 'login_event.dart';
part 'login_state.dart';

/// A bloc that manages the state of a Login according to the event that is dispatched to it.
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.repo}) : super(LoginInitial()) {
    on<LoginEnterEvent>((event, emit) async {
      try {
        await repo.logIn(email: event.email, password: event.password);
        emit(LoginSuccess());
      } catch (e) {
        emit(LoginError());
      }
    });
  }
  final LoginRepo repo;
}

class LoginRepo {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
