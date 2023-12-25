// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

/// Represents the state of Home in the application.
class HomeState extends Equatable {
  HomeState({
    this.selectedDropDownValue,
    this.homeModelObj,
  });

  SelectionPopupModel? selectedDropDownValue;

  HomeModel? homeModelObj;

  @override
  List<Object?> get props => [
        selectedDropDownValue,
        homeModelObj,
      ];
  HomeState copyWith({
    SelectionPopupModel? selectedDropDownValue,
    HomeModel? homeModelObj,
  }) {
    return HomeState(
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      homeModelObj: homeModelObj ?? this.homeModelObj,
    );
  }
}
