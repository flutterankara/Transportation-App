import 'package:equatable/equatable.dart';
import 'package:mamak_app/data/models/selectionPopupModel/selection_popup_model.dart';
import '../../../core/app_export.dart';
import 'card4_item_model.dart';

/// This class defines the variables used in the [home_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeModel extends Equatable {
  HomeModel({
    this.dropdownItemList = const [],
    this.card4ItemList = const [],
  });

  final List<SelectionPopupModel> dropdownItemList;

  final List<Card4ItemModel> card4ItemList;

  HomeModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<Card4ItemModel>? card4ItemList,
  }) {
    return HomeModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      card4ItemList: card4ItemList ?? this.card4ItemList,
    );
  }

  @override
  List<Object?> get props => [dropdownItemList, card4ItemList];
}
