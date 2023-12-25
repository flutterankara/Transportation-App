// ignore_for_file: must_be_immutable

part of 'account_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AccountOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AccountOneEvent extends Equatable {}

/// Event that is dispatched when the AccountOne widget is first created.
class AccountOneInitialEvent extends AccountOneEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends AccountOneEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing switch
class ChangeSwitchEvent extends AccountOneEvent {
  ChangeSwitchEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
