import '../../../core/app_export.dart';

/// This class is used in the [card4_item_widget] screen.
class Card4ItemModel {
  Card4ItemModel({
    this.image,
    this.title,
    this.duration,
    this.id,
  }) {
    image = image ?? ImageConstant.imgCoffeeImg;
    title = title ?? "Angelina\nParis Cafe";
    duration = duration ?? "13 min";
    id = id ?? "";
  }

  String? image;

  String? title;

  String? duration;

  String? id;
}
