// В файле register_step_2_bloc.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:photo/presentation/register_step_2_screen/models/register_step_2_model.dart';

part 'register_step_2_event.dart';
part 'register_step_2_state.dart';

class RegisterStep2Bloc extends Bloc<RegisterStep2Event, RegisterStep2State> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RegisterStep2Bloc(RegisterStep2State initialState) : super(initialState) {
    on<RegisterStep2InitialEvent>(_onInitialize);
    on<NavigateToNextPageEvent>(_onSignUpButtonPressed);
  }

  _onInitialize(
    RegisterStep2InitialEvent event,
    Emitter<RegisterStep2State> emit,
  ) async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    emit(state.copyWith(
      thejaneController: TextEditingController(),
      currentUser: currentUser,
    ));
  }

  _onSignUpButtonPressed(
    NavigateToNextPageEvent event,
    Emitter<RegisterStep2State> emit,
  ) async {
    User? currentUser = state.currentUser;

    if (currentUser != null) {
      String? enteredName = state.thejaneController?.text;

      if (enteredName != null && enteredName.isNotEmpty) {
        await currentUser.updateDisplayName(enteredName);

        await _firestore.collection('users').doc(currentUser.uid).set({
          'name': enteredName,
        });
      }
    }

    NavigatorService.pushNamed(
        AppRoutes.discoverOverflowBehaviorContainerScreen);
  }
}
