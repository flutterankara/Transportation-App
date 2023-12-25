// ignore_for_file: must_be_immutable

part of 'account_container_bloc.dart';

/// Represents the state of AccountContainer in the application.
class AccountContainerState extends Equatable {
  AccountContainerState({this.accountContainerModelObj});

  AccountContainerModel? accountContainerModelObj;

  @override
  List<Object?> get props => [
        accountContainerModelObj,
      ];
  AccountContainerState copyWith(
      {AccountContainerModel? accountContainerModelObj}) {
    return AccountContainerState(
      accountContainerModelObj:
          accountContainerModelObj ?? this.accountContainerModelObj,
    );
  }
}
