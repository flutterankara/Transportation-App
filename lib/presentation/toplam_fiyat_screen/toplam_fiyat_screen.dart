import 'bloc/toplam_fiyat_bloc.dart';
import 'models/toplam_fiyat_model.dart';
import 'package:flutter/material.dart';
import 'package:mamak_app/core/app_export.dart';
import 'package:mamak_app/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ToplamFiyatScreen extends StatelessWidget {
  const ToplamFiyatScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<ToplamFiyatBloc>(
      create: (context) => ToplamFiyatBloc(ToplamFiyatState(
        toplamFiyatModelObj: ToplamFiyatModel(),
      ))
        ..add(ToplamFiyatInitialEvent()),
      child: ToplamFiyatScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToplamFiyatBloc, ToplamFiyatState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(24.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 70.v),
                  Container(
                    decoration: AppDecoration.fillAmberA.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder16,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 23.v),
                        Padding(
                          padding: EdgeInsets.only(left: 23.h),
                          child: Text(
                            "lbl_yolculuk_zeti".tr,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                        SizedBox(height: 23.v),
                        Padding(
                          padding: EdgeInsets.only(left: 25.h),
                          child: Text(
                            "msg_araba_se_ene_i_1".tr,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        Padding(
                          padding: EdgeInsets.only(left: 26.h),
                          child: Text(
                            "lbl_fiyat_5_tl_km".tr,
                            style: CustomTextStyles.titleMediumMedium,
                          ),
                        ),
                        SizedBox(height: 12.v),
                        Padding(
                          padding: EdgeInsets.only(left: 23.h),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 2.v),
                                child: Text(
                                  "lbl_toplam_km".tr,
                                  style: theme.textTheme.titleMedium,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 11.h,
                                  bottom: 2.v,
                                ),
                                child: Text(
                                  "lbl_15".tr,
                                  style: CustomTextStyles.titleMediumMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.v),
                        Padding(
                          padding: EdgeInsets.only(left: 23.h),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.v),
                                child: Text(
                                  "lbl_toplam_cret".tr,
                                  style: theme.textTheme.titleMedium,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6.h),
                                child: Text(
                                  "lbl_500".tr,
                                  style: CustomTextStyles.titleMediumMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 73.v),
                        CustomImageView(
                          imagePath: ImageConstant.imgCoffeeImg,
                          height: 167.v,
                          width: 243.h,
                          margin: EdgeInsets.only(left: 26.h),
                        ),
                        SizedBox(height: 14.v),
                        CustomElevatedButton(
                          text: "lbl_devam".tr,
                        ),
                      ],
                    ),
                  ),
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
      },
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
