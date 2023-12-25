import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:mamak_app/presentation/account_container_screen/models/account_container_model.dart';
part 'account_container_event.dart';
part 'account_container_state.dart';

/// A bloc that manages the state of a AccountContainer according to the event that is dispatched to it.
class AccountContainerBloc
    extends Bloc<AccountContainerEvent, AccountContainerState> {
  AccountContainerBloc(AccountContainerState initialState)
      : super(initialState) {
    on<AccountContainerInitialEvent>(_onInitialize);
  }

  _onInitialize(
    AccountContainerInitialEvent event,
    Emitter<AccountContainerState> emit,
  ) async {}
}
