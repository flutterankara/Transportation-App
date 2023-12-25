// ignore_for_file: must_be_immutable

part of 'toplam_fiyat_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ToplamFiyat widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ToplamFiyatEvent extends Equatable {}

/// Event that is dispatched when the ToplamFiyat widget is first created.
class ToplamFiyatInitialEvent extends ToplamFiyatEvent {
  @override
  List<Object?> get props => [];
}
