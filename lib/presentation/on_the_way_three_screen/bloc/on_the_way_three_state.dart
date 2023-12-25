// ignore_for_file: must_be_immutable

part of 'on_the_way_three_bloc.dart';

/// Represents the state of OnTheWayThree in the application.
class OnTheWayThreeState extends Equatable {
  OnTheWayThreeState({this.onTheWayThreeModelObj});

  OnTheWayThreeModel? onTheWayThreeModelObj;

  @override
  List<Object?> get props => [
        onTheWayThreeModelObj,
      ];
  OnTheWayThreeState copyWith({OnTheWayThreeModel? onTheWayThreeModelObj}) {
    return OnTheWayThreeState(
      onTheWayThreeModelObj:
          onTheWayThreeModelObj ?? this.onTheWayThreeModelObj,
    );
  }
}
