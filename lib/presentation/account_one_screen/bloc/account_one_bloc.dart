import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:mamak_app/presentation/account_one_screen/models/account_one_model.dart';
part 'account_one_event.dart';
part 'account_one_state.dart';

/// A bloc that manages the state of a AccountOne according to the event that is dispatched to it.
class AccountOneBloc extends Bloc<AccountOneEvent, AccountOneState> {
  AccountOneBloc(AccountOneState initialState) : super(initialState) {
    on<AccountOneInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeSwitchEvent>(_changeSwitch);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AccountOneState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
    ));
  }

  _changeSwitch(
    ChangeSwitchEvent event,
    Emitter<AccountOneState> emit,
  ) {
    emit(state.copyWith(
      isSelectedSwitch: event.value,
    ));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ];
  }

  _onInitialize(
    AccountOneInitialEvent event,
    Emitter<AccountOneState> emit,
  ) async {
    emit(state.copyWith(
      isSelectedSwitch: false,
    ));
    emit(state.copyWith(
        accountOneModelObj: state.accountOneModelObj?.copyWith(
      dropdownItemList: fillDropdownItemList(),
    )));
  }
}
