import 'package:equatable/equatable.dart';
import 'package:mamak_app/data/models/selectionPopupModel/selection_popup_model.dart';
import '../../../core/app_export.dart';
import 'card3_item_model.dart';

/// This class defines the variables used in the [home_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeOneModel extends Equatable {
  HomeOneModel({
    this.dropdownItemList = const [],
    this.card3ItemList = const [],
  });

  final List<SelectionPopupModel> dropdownItemList;

  final List<Card3ItemModel> card3ItemList;

  HomeOneModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<Card3ItemModel>? card3ItemList,
  }) {
    return HomeOneModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      card3ItemList: card3ItemList ?? this.card3ItemList,
    );
  }

  @override
  List<Object?> get props => [dropdownItemList, card3ItemList];
}
