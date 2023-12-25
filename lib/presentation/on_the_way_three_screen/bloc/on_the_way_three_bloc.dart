import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:mamak_app/presentation/on_the_way_three_screen/models/on_the_way_three_model.dart';
part 'on_the_way_three_event.dart';
part 'on_the_way_three_state.dart';

/// A bloc that manages the state of a OnTheWayThree according to the event that is dispatched to it.
class OnTheWayThreeBloc extends Bloc<OnTheWayThreeEvent, OnTheWayThreeState> {
  OnTheWayThreeBloc(OnTheWayThreeState initialState) : super(initialState) {
    on<OnTheWayThreeInitialEvent>(_onInitialize);
  }

  _onInitialize(
    OnTheWayThreeInitialEvent event,
    Emitter<OnTheWayThreeState> emit,
  ) async {}
}
