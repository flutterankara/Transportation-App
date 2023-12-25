import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/cardlist_item_model.dart';
import 'package:mamak_app/presentation/taxi_secenek_screen/models/taxi_secenek_model.dart';
part 'taxi_secenek_event.dart';
part 'taxi_secenek_state.dart';

/// A bloc that manages the state of a TaxiSecenek according to the event that is dispatched to it.
class TaxiSecenekBloc extends Bloc<TaxiSecenekEvent, TaxiSecenekState> {
  TaxiSecenekBloc(TaxiSecenekState initialState) : super(initialState) {
    on<TaxiSecenekInitialEvent>(_onInitialize);
  }

  _onInitialize(
    TaxiSecenekInitialEvent event,
    Emitter<TaxiSecenekState> emit,
  ) async {
    emit(state.copyWith(
        taxiSecenekModelObj: state.taxiSecenekModelObj?.copyWith(
      cardlistItemList: fillCardlistItemList(),
    )));
  }

  List<CardlistItemModel> fillCardlistItemList() {
    return [
      CardlistItemModel(text: "Araba Seçeneği 1", text1: "Fiyat: 5 TL /km"),
      CardlistItemModel(text: "Araba Seçeneği 2", text1: "Fiyat: 7 TL /km"),
      CardlistItemModel(text: "Araba Seçeneği 3", text1: "Fiyat: 8 TL /km")
    ];
  }
}
