// ignore_for_file: must_be_immutable

part of 'home_one_bloc.dart';

/// Represents the state of HomeOne in the application.
class HomeOneState extends Equatable {
  HomeOneState({
    this.selectedDropDownValue,
    this.homeOneModelObj,
  });

  SelectionPopupModel? selectedDropDownValue;

  HomeOneModel? homeOneModelObj;

  @override
  List<Object?> get props => [
        selectedDropDownValue,
        homeOneModelObj,
      ];
  HomeOneState copyWith({
    SelectionPopupModel? selectedDropDownValue,
    HomeOneModel? homeOneModelObj,
  }) {
    return HomeOneState(
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      homeOneModelObj: homeOneModelObj ?? this.homeOneModelObj,
    );
  }
}
