import '../models/card4_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mamak_app/core/app_export.dart';

// ignore: must_be_immutable
class Card4ItemWidget extends StatelessWidget {
  Card4ItemWidget(
    this.card4ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Card4ItemModel card4ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 152.h,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: EdgeInsets.all(0),
        color: appTheme.amberA100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Container(
          height: 152.adaptSize,
          width: 152.adaptSize,
          decoration: AppDecoration.fillAmberA.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder16,
          ),
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              CustomImageView(
                imagePath: card4ItemModelObj.image,
                height: 61.v,
                width: 87.h,
                alignment: Alignment.bottomRight,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 23.h,
                    top: 24.v,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 81.h,
                        child: Text(
                          card4ItemModelObj.title!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleMedium!.copyWith(
                            height: 1.38,
                          ),
                        ),
                      ),
                      SizedBox(height: 7.v),
                      Text(
                        card4ItemModelObj.duration!,
                        style: CustomTextStyles.titleMediumMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
