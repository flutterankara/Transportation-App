import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/card3_item_model.dart';
import 'package:mamak_app/presentation/home_one_screen/models/home_one_model.dart';
part 'home_one_event.dart';
part 'home_one_state.dart';

/// A bloc that manages the state of a HomeOne according to the event that is dispatched to it.
class HomeOneBloc extends Bloc<HomeOneEvent, HomeOneState> {
  HomeOneBloc(HomeOneState initialState) : super(initialState) {
    on<HomeOneInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
  }

  _onInitialize(
    HomeOneInitialEvent event,
    Emitter<HomeOneState> emit,
  ) async {
    emit(state.copyWith(
        homeOneModelObj: state.homeOneModelObj?.copyWith(
      dropdownItemList: fillDropdownItemList(),
      card3ItemList: fillCard3ItemList(),
    )));
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<HomeOneState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
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

  List<Card3ItemModel> fillCard3ItemList() {
    return [
      Card3ItemModel(
          image: ImageConstant.imgCoffeeImg,
          title: "Angelina\nParis Cafe",
          duration: "13 min")
    ];
  }
}
