import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mamak_app/core/app_export.dart';
import 'package:mamak_app/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'bloc/on_the_way_three_bloc.dart';
import 'models/on_the_way_three_model.dart';

class OnTheWayThreeScreen extends StatelessWidget {
  OnTheWayThreeScreen({Key? key})
      : super(
          key: key,
        );

  final Completer<GoogleMapController> googleMapController = Completer();

  static Widget builder(BuildContext context) {
    return BlocProvider<OnTheWayThreeBloc>(
      create: (context) => OnTheWayThreeBloc(OnTheWayThreeState(
        onTheWayThreeModelObj: OnTheWayThreeModel(),
      ))
        ..add(OnTheWayThreeInitialEvent()),
      child: OnTheWayThreeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnTheWayThreeBloc, OnTheWayThreeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildMapSection(context),
                    SizedBox(height: 34.v),
                    _buildNineteenSection(context),
                    SizedBox(height: 24.v),
                    Divider(
                      color: appTheme.gray300,
                      indent: 24.h,
                      endIndent: 24.h,
                    ),
                    SizedBox(height: 23.v),
                    CustomElevatedButton(
                      text: "lbl_find_your_taxi".tr,
                      margin: EdgeInsets.symmetric(horizontal: 24.h),
                      leftIcon: Container(
                        margin: EdgeInsets.only(right: 8.h),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgUser,
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                        ),
                      ),
                      buttonStyle: CustomButtonStyles.fillAmberA,
                      buttonTextStyle: theme.textTheme.titleMedium!,
                    ),
                    SizedBox(height: 24.v),
                    Divider(
                      color: appTheme.gray300,
                      indent: 24.h,
                      endIndent: 24.h,
                    ),
                    SizedBox(height: 55.v),
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
                    SizedBox(height: 24.v),
                    CustomElevatedButton(
                      text: "lbl_cancel".tr,
                      margin: EdgeInsets.symmetric(horizontal: 24.h),
                    ),
                    SizedBox(height: 28.v),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 56.h,
                        right: 49.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgHome,
                                height: 24.adaptSize,
                                width: 24.adaptSize,
                              ),
                              SizedBox(height: 4.v),
                              Text(
                                "lbl_home".tr,
                                style:
                                    CustomTextStyles.labelLargeOnErrorContainer,
                              ),
                            ],
                          ),
                          Spacer(
                            flex: 52,
                          ),
                          Column(
                            children: [
                              Opacity(
                                opacity: 0.16,
                                child: CustomImageView(
                                  imagePath:
                                      ImageConstant.imgConfirmationNumber,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize,
                                ),
                              ),
                              SizedBox(height: 4.v),
                              Opacity(
                                opacity: 0.16,
                                child: Text(
                                  "lbl_transaction".tr,
                                  style: theme.textTheme.labelLarge,
                                ),
                              ),
                            ],
                          ),
                          Spacer(
                            flex: 47,
                          ),
                          Column(
                            children: [
                              Opacity(
                                opacity: 0.16,
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgPerson,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize,
                                ),
                              ),
                              SizedBox(height: 4.v),
                              Opacity(
                                opacity: 0.16,
                                child: Text(
                                  "lbl_account".tr,
                                  style: theme.textTheme.labelLarge,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 31.v),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildMapSection(BuildContext context) {
    return SizedBox(
      height: 431.v,
      width: double.maxFinite,
      child: GoogleMap(
        //TODO: Add your Google Maps API key in AndroidManifest.xml and pod file
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(
            37.43296265331129,
            -122.08832357078792,
          ),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          googleMapController.complete(controller);
        },
        zoomControlsEnabled: false,
        zoomGesturesEnabled: false,
        myLocationButtonEnabled: false,
        myLocationEnabled: false,
      ),
    );
  }

  /// Section Widget
  Widget _buildNineteenSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "lbl_distance".tr,
                style: CustomTextStyles.titleMediumOnSecondaryContainer,
              ),
              SizedBox(height: 7.v),
              Text(
                "lbl_4_8_km".tr,
                style: theme.textTheme.titleMedium,
              ),
            ],
          ),
          SizedBox(
            height: 46.v,
            child: VerticalDivider(
              width: 1.h,
              thickness: 1.v,
              color: appTheme.gray300,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "lbl_price".tr,
                style: CustomTextStyles.titleMediumOnSecondaryContainer,
              ),
              SizedBox(height: 7.v),
              Text(
                "lbl_8_50".tr,
                style: theme.textTheme.titleMedium,
              ),
            ],
          ),
          SizedBox(
            height: 46.v,
            child: VerticalDivider(
              width: 1.h,
              thickness: 1.v,
              color: appTheme.gray300,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "lbl_arrival".tr,
                style: CustomTextStyles.titleMediumOnSecondaryContainer,
              ),
              SizedBox(height: 8.v),
              Text(
                "lbl_in_15_min".tr,
                style: theme.textTheme.titleMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
