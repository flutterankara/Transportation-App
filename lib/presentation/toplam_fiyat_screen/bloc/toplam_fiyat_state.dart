// ignore_for_file: must_be_immutable

part of 'toplam_fiyat_bloc.dart';

/// Represents the state of ToplamFiyat in the application.
class ToplamFiyatState extends Equatable {
  ToplamFiyatState({this.toplamFiyatModelObj});

  ToplamFiyatModel? toplamFiyatModelObj;

  @override
  List<Object?> get props => [
        toplamFiyatModelObj,
      ];
  ToplamFiyatState copyWith({ToplamFiyatModel? toplamFiyatModelObj}) {
    return ToplamFiyatState(
      toplamFiyatModelObj: toplamFiyatModelObj ?? this.toplamFiyatModelObj,
    );
  }
}
