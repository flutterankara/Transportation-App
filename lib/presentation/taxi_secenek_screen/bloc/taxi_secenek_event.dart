// ignore_for_file: must_be_immutable

part of 'taxi_secenek_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///TaxiSecenek widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class TaxiSecenekEvent extends Equatable {}

/// Event that is dispatched when the TaxiSecenek widget is first created.
class TaxiSecenekInitialEvent extends TaxiSecenekEvent {
  @override
  List<Object?> get props => [];
}
