// ignore_for_file: must_be_immutable

part of 'taxi_secenek_bloc.dart';

/// Represents the state of TaxiSecenek in the application.
class TaxiSecenekState extends Equatable {
  TaxiSecenekState({this.taxiSecenekModelObj});

  TaxiSecenekModel? taxiSecenekModelObj;

  @override
  List<Object?> get props => [
        taxiSecenekModelObj,
      ];
  TaxiSecenekState copyWith({TaxiSecenekModel? taxiSecenekModelObj}) {
    return TaxiSecenekState(
      taxiSecenekModelObj: taxiSecenekModelObj ?? this.taxiSecenekModelObj,
    );
  }
}
