// ignore_for_file: must_be_immutable

part of 'sign_up_bloc.dart';

/// Represents the state of SignUp in the application.
class SignUpState extends Equatable {
  SignUpState({
    this.emailController,
    this.signUpModelObj,
  });

  TextEditingController? emailController;

  SignUpModel? signUpModelObj;

  @override
  List<Object?> get props => [
        emailController,
        signUpModelObj,
      ];
  SignUpState copyWith({
    TextEditingController? emailController,
    SignUpModel? signUpModelObj,
  }) {
    return SignUpState(
      emailController: emailController ?? this.emailController,
      signUpModelObj: signUpModelObj ?? this.signUpModelObj,
    );
  }
}
