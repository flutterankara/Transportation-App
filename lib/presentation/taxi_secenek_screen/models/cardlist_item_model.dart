
/// This class is used in the [cardlist_item_widget] screen.
class CardlistItemModel {
  CardlistItemModel({
    this.text,
    this.text1,
    this.id,
  }) {
    text = text ?? "Araba Seçeneği 1";
    text1 = text1 ?? "Fiyat: 5 TL /km";
    id = id ?? "";
  }

  String? text;

  String? text1;

  String? id;
}
