// В файле register_step_2_state.dart

part of 'register_step_2_bloc.dart';

@immutable
class RegisterStep2State extends Equatable {
  final TextEditingController? thejaneController;
  final RegisterStep2Model? registerStep2ModelObj;
  final User? currentUser;

  RegisterStep2State({
    this.thejaneController,
    this.registerStep2ModelObj,
    this.currentUser,
  });

  @override
  List<Object?> get props => [
        thejaneController,
        registerStep2ModelObj,
        currentUser,
      ];

  RegisterStep2State copyWith({
    TextEditingController? thejaneController,
    RegisterStep2Model? registerStep2ModelObj,
    User? currentUser,
  }) {
    return RegisterStep2State(
      thejaneController: thejaneController ?? this.thejaneController,
      registerStep2ModelObj:
          registerStep2ModelObj ?? this.registerStep2ModelObj,
      currentUser: currentUser ?? this.currentUser,
    );
  }
}
