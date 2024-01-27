// ignore_for_file: must_be_immutable

part of 'discover_overflow_behavior_container_bloc.dart';

class DiscoverOverflowBehaviorContainerState extends Equatable {
  DiscoverOverflowBehaviorContainerState(
      {this.discoverOverflowBehaviorContainerModelObj});

  DiscoverOverflowBehaviorContainerModel?
      discoverOverflowBehaviorContainerModelObj;

  @override
  List<Object?> get props => [
        discoverOverflowBehaviorContainerModelObj,
      ];
  DiscoverOverflowBehaviorContainerState copyWith(
      {DiscoverOverflowBehaviorContainerModel?
          discoverOverflowBehaviorContainerModelObj}) {
    return DiscoverOverflowBehaviorContainerState(
      discoverOverflowBehaviorContainerModelObj:
          discoverOverflowBehaviorContainerModelObj ??
              this.discoverOverflowBehaviorContainerModelObj,
    );
  }
}
