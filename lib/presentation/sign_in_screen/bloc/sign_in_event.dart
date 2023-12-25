// ignore_for_file: must_be_immutable

part of 'sign_in_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///SignIn widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SignInEvent extends Equatable {}

/// Event that is dispatched when the SignIn widget is first created.
class SignInInitialEvent extends SignInEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent extends SignInEvent {
  ChangePasswordVisibilityEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
