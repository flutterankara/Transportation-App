import 'bloc/onboarding_three_bloc.dart';
import 'models/onboarding_three_model.dart';
import 'package:flutter/material.dart';
import 'package:mamak_app/core/app_export.dart';
import 'package:mamak_app/widgets/custom_elevated_button.dart';

class OnboardingThreeScreen extends StatelessWidget {
  const OnboardingThreeScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<OnboardingThreeBloc>(
        create: (context) => OnboardingThreeBloc(OnboardingThreeState(
            onboardingThreeModelObj: OnboardingThreeModel()))
          ..add(OnboardingThreeInitialEvent()),
        child: OnboardingThreeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingThreeBloc, OnboardingThreeState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 45.v),
                  child: Column(children: [
                    SizedBox(height: 15.v),
                    CustomImageView(
                        imagePath: ImageConstant.imgGroup5,
                        height: 376.v,
                        width: 343.h,
                        radius: BorderRadius.circular(21.h)),
                    SizedBox(height: 31.v),
                    CustomImageView(
                        imagePath: ImageConstant.imgParginationSlider,
                        height: 6.v,
                        width: 108.h),
                    SizedBox(height: 24.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            width: 294.h,
                            margin: EdgeInsets.only(right: 48.h),
                            child: Text("msg_book_appointment_in".tr,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles
                                    .displayMediumOnPrimaryContainer))),
                    SizedBox(height: 23.v),
                    _buildButtonRow(context)
                  ]))));
    });
  }

  /// Section Widget
  Widget _buildButtonRow(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: CustomElevatedButton(
              height: 48.v,
              text: "lbl_skip".tr,
              margin: EdgeInsets.only(right: 4.h),
              buttonStyle: CustomButtonStyles.fillWhiteA,
              buttonTextStyle: CustomTextStyles.titleMediumInterOnPrimary)),
      Expanded(
          child: CustomElevatedButton(
              height: 48.v,
              text: "lbl_get_started".tr,
              margin: EdgeInsets.only(left: 4.h),
              rightIcon: Container(
                  margin: EdgeInsets.only(left: 8.h),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgArrowcircleright,
                      height: 20.adaptSize,
                      width: 20.adaptSize)),
              buttonStyle: CustomButtonStyles.fillPrimaryContainer,
              buttonTextStyle: CustomTextStyles.titleMediumInterWhiteA700))
    ]);
  }
}
