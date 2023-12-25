// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:mamak_app/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [account_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AccountOneModel extends Equatable {
  AccountOneModel({this.dropdownItemList = const []});

  List<SelectionPopupModel> dropdownItemList;

  AccountOneModel copyWith({List<SelectionPopupModel>? dropdownItemList}) {
    return AccountOneModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
    );
  }

  @override
  List<Object?> get props => [dropdownItemList];
}
