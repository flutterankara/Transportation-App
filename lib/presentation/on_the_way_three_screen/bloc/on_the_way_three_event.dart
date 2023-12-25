// ignore_for_file: must_be_immutable

part of 'on_the_way_three_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///OnTheWayThree widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class OnTheWayThreeEvent extends Equatable {}

/// Event that is dispatched when the OnTheWayThree widget is first created.
class OnTheWayThreeInitialEvent extends OnTheWayThreeEvent {
  @override
  List<Object?> get props => [];
}
