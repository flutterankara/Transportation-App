import 'bloc/sign_up_bloc.dart';
import 'models/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:mamak_app/core/app_export.dart';
import 'package:mamak_app/core/utils/validation_functions.dart';
import 'package:mamak_app/widgets/app_bar/appbar_image.dart';
import 'package:mamak_app/widgets/app_bar/appbar_title_image.dart';
import 'package:mamak_app/widgets/app_bar/appbar_trailing_image.dart';
import 'package:mamak_app/widgets/app_bar/custom_app_bar.dart';
import 'package:mamak_app/widgets/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key})
      : super(
          key: key,
        );

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignUpBloc>(
      create: (context) => SignUpBloc(SignUpState(
        signUpModelObj: SignUpModel(),
      ))
        ..add(SignUpInitialEvent()),
      child: SignUpScreen(),
    );
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
            padding: EdgeInsets.symmetric(
              horizontal: 24.h,
              vertical: 45.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_sign_up".tr,
                  style: theme.textTheme.displayMedium,
                ),
                SizedBox(height: 13.v),
                Text(
                  "msg_start_your_journey".tr,
                  style: CustomTextStyles.titleSmallGeneralSansGray600,
                ),
                SizedBox(height: 36.v),
                BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
                  selector: (state) => state.emailController,
                  builder: (context, emailController) {
                    return CustomTextFormField(
                      controller: emailController,
                      hintText: "msg_enter_your_email".tr,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.emailAddress,
                      prefix: Container(
                        margin: EdgeInsets.fromLTRB(30.h, 30.v, -65.h, 30.v),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgFacebook,
                          height: 32.adaptSize,
                          width: 32.adaptSize,
                        ),
                      ),
                      prefixConstraints: BoxConstraints(
                        maxHeight: 306.v,
                      ),
                      suffix: Container(
                        margin: EdgeInsets.only(
                          top: 15.v,
                          bottom: 30.v,
                        ),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgCheckcircleoutline,
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                        ),
                      ),
                      suffixConstraints: BoxConstraints(
                        maxHeight: 306.v,
                      ),
                      validator: (value) {
                        if (value == null ||
                            (!isValidEmail(value, isRequired: true))) {
                          return "err_msg_please_enter_valid_email".tr;
                        }
                        return null;
                      },
                      contentPadding: EdgeInsets.symmetric(vertical: 30.v),
                    );
                  },
                ),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 72.h,
      leading: Container(
        margin: EdgeInsets.only(
          left: 16.h,
          top: 16.v,
        ),
        padding: EdgeInsets.symmetric(horizontal: 7.h),
        decoration: BoxDecoration(
          color: appTheme.whiteA700.withOpacity(0.1),
          borderRadius: BorderRadius.circular(
            16.h,
          ),
        ),
        child: Column(
          children: [
            AppbarTitleImage(
              imagePath: ImageConstant.imgSettings,
              margin: EdgeInsets.only(left: 2.h),
            ),
            SizedBox(height: 48.v),
            AppbarImage(
              imagePath: ImageConstant.imgArrowBack,
              margin: EdgeInsets.symmetric(horizontal: 9.h),
            ),
            SizedBox(height: 6.v),
          ],
        ),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgSettingsWhiteA700,
          margin: EdgeInsets.only(
            left: 15.h,
            top: 18.v,
            right: 78.h,
          ),
        ),
        AppbarTrailingImage(
          imagePath: ImageConstant.imgSettingsWhiteA70010x15,
          margin: EdgeInsets.fromLTRB(6.h, 17.v, 78.h, 1.v),
        ),
        AppbarTrailingImage(
          imagePath: ImageConstant.imgInstagram,
          margin: EdgeInsets.only(
            left: 5.h,
            top: 17.v,
            right: 93.h,
          ),
        ),
      ],
    );
  }
}
