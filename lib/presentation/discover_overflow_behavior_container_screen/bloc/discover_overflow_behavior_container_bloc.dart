import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:photo/presentation/discover_overflow_behavior_container_screen/models/discover_overflow_behavior_container_model.dart';
part 'discover_overflow_behavior_container_event.dart';
part 'discover_overflow_behavior_container_state.dart';

class DiscoverOverflowBehaviorContainerBloc extends Bloc<
    DiscoverOverflowBehaviorContainerEvent,
    DiscoverOverflowBehaviorContainerState> {
  DiscoverOverflowBehaviorContainerBloc(
      DiscoverOverflowBehaviorContainerState initialState)
      : super(initialState) {
    on<DiscoverOverflowBehaviorContainerInitialEvent>(_onInitialize);
  }

  _onInitialize(
    DiscoverOverflowBehaviorContainerInitialEvent event,
    Emitter<DiscoverOverflowBehaviorContainerState> emit,
  ) async {}
}
