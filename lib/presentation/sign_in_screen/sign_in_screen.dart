import 'bloc/sign_in_bloc.dart';
import 'models/sign_in_model.dart';
import 'package:flutter/material.dart';
import 'package:mamak_app/core/app_export.dart';
import 'package:mamak_app/core/utils/validation_functions.dart';
import 'package:mamak_app/widgets/app_bar/appbar_image.dart';
import 'package:mamak_app/widgets/app_bar/appbar_title_image.dart';
import 'package:mamak_app/widgets/app_bar/appbar_trailing_image.dart';
import 'package:mamak_app/widgets/app_bar/custom_app_bar.dart';
import 'package:mamak_app/widgets/custom_elevated_button.dart';
import 'package:mamak_app/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignInBloc>(
        create: (context) =>
            SignInBloc(SignInState(signInModelObj: SignInModel()))
              ..add(SignInInitialEvent()),
        child: SignInScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.h, vertical: 45.v),
                    child: Column(children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("lbl_sign_in".tr,
                              style: theme.textTheme.displayMedium)),
                      SizedBox(height: 13.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("msg_start_your_journey".tr,
                              style: CustomTextStyles
                                  .titleSmallGeneralSansGray600)),
                      SizedBox(height: 36.v),
                      BlocSelector<SignInBloc, SignInState,
                              TextEditingController?>(
                          selector: (state) => state.emailController,
                          builder: (context, emailController) {
                            return CustomTextFormField(
                                controller: emailController,
                                hintText: "msg_enter_your_email".tr,
                                textInputType: TextInputType.emailAddress,
                                suffix: Container(
                                    margin: EdgeInsets.only(
                                        top: 15.v, bottom: 24.v),
                                    child: CustomImageView(
                                        imagePath:
                                            ImageConstant.imgCheckcircleoutline,
                                        height: 24.adaptSize,
                                        width: 24.adaptSize)),
                                suffixConstraints:
                                    BoxConstraints(maxHeight: 63.v),
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidEmail(value,
                                          isRequired: true))) {
                                    return "err_msg_please_enter_valid_email"
                                        .tr;
                                  }
                                  return null;
                                });
                          }),
                      SizedBox(height: 23.v),
                      BlocBuilder<SignInBloc, SignInState>(
                          builder: (context, state) {
                        return CustomTextFormField(
                            controller: state.passwordController,
                            hintText: "msg_enter_your_password".tr,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.visiblePassword,
                            suffix: InkWell(
                                onTap: () {
                                  context.read<SignInBloc>().add(
                                      ChangePasswordVisibilityEvent(
                                          value: !state.isShowPassword));
                                },
                                child: Container(
                                    margin: EdgeInsets.only(
                                        top: 15.v, bottom: 24.v),
                                    child: CustomImageView(
                                        imagePath:
                                            ImageConstant.imgCheckcircleoutline,
                                        height: 24.adaptSize,
                                        width: 24.adaptSize))),
                            suffixConstraints: BoxConstraints(maxHeight: 63.v),
                            validator: (value) {
                              if (value == null ||
                                  (!isValidPassword(value, isRequired: true))) {
                                return "err_msg_please_enter_valid_password".tr;
                              }
                              return null;
                            },
                            obscureText: state.isShowPassword);
                      }),
                      SizedBox(height: 23.v),
                      CustomElevatedButton(
                          height: 48.v,
                          text: "lbl_sign_in2".tr,
                          rightIcon: Container(
                              margin: EdgeInsets.only(left: 8.h),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgCheckcircle,
                                  height: 20.adaptSize,
                                  width: 20.adaptSize)),
                          buttonStyle: CustomButtonStyles.fillPrimaryContainer,
                          buttonTextStyle:
                              CustomTextStyles.titleMediumInterWhiteA700),
                      SizedBox(height: 25.v),
                      Text("lbl_or_sign_in_with".tr,
                          style: CustomTextStyles.titleSmallOnPrimary),
                      SizedBox(height: 22.v),
                      _buildSocialMediaSign(context),
                      SizedBox(height: 24.v),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(bottom: 1.v),
                                child: Text("msg_don_t_have_an_account".tr,
                                    style:
                                        CustomTextStyles.titleSmallOnPrimary)),
                            Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: Text("lbl_sign_up".tr,
                                    style: CustomTextStyles
                                        .titleSmallPrimaryContainer))
                          ]),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 72.h,
        leading: Container(
            margin: EdgeInsets.only(left: 16.h, top: 16.v),
            padding: EdgeInsets.symmetric(horizontal: 7.h),
            decoration: BoxDecoration(
                color: appTheme.whiteA700.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.h)),
            child: Column(children: [
              AppbarTitleImage(
                  imagePath: ImageConstant.imgSettings,
                  margin: EdgeInsets.only(left: 2.h)),
              SizedBox(height: 48.v),
              AppbarImage(
                  imagePath: ImageConstant.imgArrowBack,
                  margin: EdgeInsets.symmetric(horizontal: 9.h)),
              SizedBox(height: 6.v)
            ])),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgSettingsWhiteA700,
              margin: EdgeInsets.only(left: 15.h, top: 18.v, right: 78.h)),
          AppbarTrailingImage(
              imagePath: ImageConstant.imgSettingsWhiteA70010x15,
              margin: EdgeInsets.fromLTRB(6.h, 17.v, 78.h, 1.v)),
          AppbarTrailingImage(
              imagePath: ImageConstant.imgInstagram,
              margin: EdgeInsets.only(left: 5.h, top: 17.v, right: 93.h))
        ]);
  }

  /// Section Widget
  Widget _buildSocialMediaSign(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
          height: 64.v,
          width: 98.h,
          padding: EdgeInsets.symmetric(horizontal: 33.h, vertical: 16.v),
          decoration: AppDecoration.fillGray
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
          child: CustomImageView(
              imagePath: ImageConstant.imgClock,
              height: 32.adaptSize,
              width: 32.adaptSize,
              alignment: Alignment.center)),
      Container(
          height: 64.v,
          width: 98.h,
          padding: EdgeInsets.symmetric(horizontal: 33.h, vertical: 16.v),
          decoration: AppDecoration.fillGray
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
          child: CustomImageView(
              imagePath: ImageConstant.imgApple,
              height: 32.adaptSize,
              width: 32.adaptSize,
              alignment: Alignment.center))
    ]);
  }
}
