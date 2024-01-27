// ignore_for_file: must_be_immutable

part of 'logged_out_bloc.dart';

class LoggedOutState extends Equatable {
  LoggedOutState({this.loggedOutModelObj});

  LoggedOutModel? loggedOutModelObj;

  @override
  List<Object?> get props => [
        loggedOutModelObj,
      ];
  LoggedOutState copyWith({LoggedOutModel? loggedOutModelObj}) {
    return LoggedOutState(
      loggedOutModelObj: loggedOutModelObj ?? this.loggedOutModelObj,
    );
  }
}
