import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:mamak_app/presentation/toplam_fiyat_screen/models/toplam_fiyat_model.dart';
part 'toplam_fiyat_event.dart';
part 'toplam_fiyat_state.dart';

/// A bloc that manages the state of a ToplamFiyat according to the event that is dispatched to it.
class ToplamFiyatBloc extends Bloc<ToplamFiyatEvent, ToplamFiyatState> {
  ToplamFiyatBloc(ToplamFiyatState initialState) : super(initialState) {
    on<ToplamFiyatInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ToplamFiyatInitialEvent event,
    Emitter<ToplamFiyatState> emit,
  ) async {}
}
