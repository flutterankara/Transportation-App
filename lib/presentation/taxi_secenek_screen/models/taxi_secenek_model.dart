// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'cardlist_item_model.dart';

/// This class defines the variables used in the [taxi_secenek_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class TaxiSecenekModel extends Equatable {
  TaxiSecenekModel({this.cardlistItemList = const []});

  List<CardlistItemModel> cardlistItemList;

  TaxiSecenekModel copyWith({List<CardlistItemModel>? cardlistItemList}) {
    return TaxiSecenekModel(
      cardlistItemList: cardlistItemList ?? this.cardlistItemList,
    );
  }

  @override
  List<Object?> get props => [cardlistItemList];
}
