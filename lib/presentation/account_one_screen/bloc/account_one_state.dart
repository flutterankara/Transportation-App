// ignore_for_file: must_be_immutable

part of 'account_one_bloc.dart';

/// Represents the state of AccountOne in the application.
class AccountOneState extends Equatable {
  AccountOneState({
    this.selectedDropDownValue,
    this.isSelectedSwitch = false,
    this.accountOneModelObj,
  });

  SelectionPopupModel? selectedDropDownValue;

  AccountOneModel? accountOneModelObj;

  bool isSelectedSwitch;

  @override
  List<Object?> get props => [
        selectedDropDownValue,
        isSelectedSwitch,
        accountOneModelObj,
      ];
  AccountOneState copyWith({
    SelectionPopupModel? selectedDropDownValue,
    bool? isSelectedSwitch,
    AccountOneModel? accountOneModelObj,
  }) {
    return AccountOneState(
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      isSelectedSwitch: isSelectedSwitch ?? this.isSelectedSwitch,
      accountOneModelObj: accountOneModelObj ?? this.accountOneModelObj,
    );
  }
}
