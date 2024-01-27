import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:photo/presentation/logged_out_screen/models/logged_out_model.dart';
part 'logged_out_event.dart';
part 'logged_out_state.dart';

class LoggedOutBloc extends Bloc<LoggedOutEvent, LoggedOutState> {
  LoggedOutBloc(LoggedOutState initialState) : super(initialState) {
    on<LoggedOutInitialEvent>(_onInitialize);
  }

  _onInitialize(
    LoggedOutInitialEvent event,
    Emitter<LoggedOutState> emit,
  ) async {}
}
