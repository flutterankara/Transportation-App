import '../models/cardlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mamak_app/core/app_export.dart';

// ignore: must_be_immutable
class CardlistItemWidget extends StatelessWidget {
  CardlistItemWidget(
    this.cardlistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  CardlistItemModel cardlistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23.h),
      decoration: AppDecoration.fillAmberA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 26.v),
          Text(
            cardlistItemModelObj.text!,
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 9.v),
          Text(
            cardlistItemModelObj.text1!,
            style: CustomTextStyles.titleMediumMedium,
          ),
          SizedBox(height: 16.v),
          CustomImageView(
            imagePath: ImageConstant.imgCoffeeImg,
            height: 61.v,
            width: 103.h,
            margin: EdgeInsets.only(left: 41.h),
          ),
        ],
      ),
    );
  }
}
