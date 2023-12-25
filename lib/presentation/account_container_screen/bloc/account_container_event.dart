// ignore_for_file: must_be_immutable

part of 'account_container_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AccountContainer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AccountContainerEvent extends Equatable {}

/// Event that is dispatched when the AccountContainer widget is first created.
class AccountContainerInitialEvent extends AccountContainerEvent {
  @override
  List<Object?> get props => [];
}
