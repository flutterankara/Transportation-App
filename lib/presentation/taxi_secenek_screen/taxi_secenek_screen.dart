import '../taxi_secenek_screen/widgets/cardlist_item_widget.dart';
import 'bloc/taxi_secenek_bloc.dart';
import 'models/cardlist_item_model.dart';
import 'models/taxi_secenek_model.dart';
import 'package:flutter/material.dart';
import 'package:mamak_app/core/app_export.dart';
import 'package:mamak_app/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TaxiSecenekScreen extends StatelessWidget {
  const TaxiSecenekScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<TaxiSecenekBloc>(
      create: (context) => TaxiSecenekBloc(TaxiSecenekState(
        taxiSecenekModelObj: TaxiSecenekModel(),
      ))
        ..add(TaxiSecenekInitialEvent()),
      child: TaxiSecenekScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 23.h,
            vertical: 24.v,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 70.v),
              _buildCardList(context),
              Spacer(),
              SizedBox(
                height: 4.v,
                child: AnimatedSmoothIndicator(
                  activeIndex: 0,
                  count: 3,
                  effect: ScrollingDotsEffect(
                    spacing: 4,
                    activeDotColor: theme.colorScheme.onError,
                    dotColor: appTheme.blueGray100,
                    dotHeight: 4.v,
                    dotWidth: 16.h,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildCancelButton(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildCardList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 1.h),
      child: BlocSelector<TaxiSecenekBloc, TaxiSecenekState, TaxiSecenekModel?>(
        selector: (state) => state.taxiSecenekModelObj,
        builder: (context, taxiSecenekModelObj) {
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                height: 20.v,
              );
            },
            itemCount: taxiSecenekModelObj?.cardlistItemList.length ?? 0,
            itemBuilder: (context, index) {
              CardlistItemModel model =
                  taxiSecenekModelObj?.cardlistItemList[index] ??
                      CardlistItemModel();
              return CardlistItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildCancelButton(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_cancel".tr,
      margin: EdgeInsets.only(
        left: 24.h,
        right: 24.h,
        bottom: 32.v,
      ),
    );
  }
}
