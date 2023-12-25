// ignore_for_file: must_be_immutable

part of 'account_bloc.dart';

/// Represents the state of Account in the application.
class AccountState extends Equatable {
  AccountState({
    this.isSelectedSwitch = false,
    this.accountModelObj,
  });

  AccountModel? accountModelObj;

  bool isSelectedSwitch;

  @override
  List<Object?> get props => [
        isSelectedSwitch,
        accountModelObj,
      ];
  AccountState copyWith({
    bool? isSelectedSwitch,
    AccountModel? accountModelObj,
  }) {
    return AccountState(
      isSelectedSwitch: isSelectedSwitch ?? this.isSelectedSwitch,
      accountModelObj: accountModelObj ?? this.accountModelObj,
    );
  }
}
