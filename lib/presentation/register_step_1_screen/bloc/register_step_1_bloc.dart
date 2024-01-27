import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/core/app_export.dart';

part 'register_step_1_event.dart';
part 'register_step_1_state.dart';

class AuthRepo {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TokenService tokenService = TokenService();

  Future<void> createUser(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Сохраняем UID пользователя в SharedPreferences
      await tokenService.setData(WitchToken.uid, userCredential.user!.uid);
    } catch (e) {
      log(e.toString());
    }
  }

  // Добавьте метод для проверки, зарегистрирован ли пользователь
  Future<bool> isUserRegistered(String email) async {
    try {
      // Получаем UID пользователя из SharedPreferences
      final uid = await tokenService.readData();

      // Возвращаем true, если пользователь уже зарегистрирован
      return uid.isNotEmpty;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.repo}) : super(AuthInitial()) {
    on<SendDataEvent>((event, emit) async {
      try {
        // Проверяем, зарегистрирован ли пользователь
        bool isRegistered = await repo.isUserRegistered(event.email);

        if (isRegistered) {
          // Если пользователь уже зарегистрирован, обрабатываем эту ситуацию
          log('User with email ${event.email} is already registered');
          // Можно бросить исключение, создать событие или принять другое решение
        } else {
          // Если пользователь не зарегистрирован, продолжаем регистрацию
          await repo.createUser(
            email: event.email,
            password: event.password,
          );
          emit(AuthSuccessState());
        }
      } catch (e) {
        emit(AuthErrorState());
      }
    });
  }
  final AuthRepo repo;
}

class TokenService {
  static const String tokenName = 'token-name';
  static const String tokenPassword = 'token-password';

  Future<bool> init() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final uid = pref.getString(tokenName);
    log('uid: $uid');
    if (uid != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> readData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final password = pref.getString(tokenPassword);
    log('password: $password');
    if (password != null) {
      return password;
    } else {
      return '';
    }
  }

  Future<void> setData(WitchToken witchToken, String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (witchToken == WitchToken.uid) {
      await pref.setString(tokenName, value);
    } else {
      await pref.setString(tokenPassword, value);
    }
  }

  Future<void> removeData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove(tokenName);
    await pref.remove(tokenPassword);
  }
}

enum WitchToken { uid, password }

final tokenService = TokenService();
