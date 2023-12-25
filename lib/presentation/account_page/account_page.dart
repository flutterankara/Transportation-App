import 'bloc/account_bloc.dart';
import 'models/account_model.dart';
import 'package:flutter/material.dart';
import 'package:mamak_app/core/app_export.dart';
import 'package:mamak_app/widgets/custom_switch.dart';

// ignore_for_file: must_be_immutable
class AccountPage extends StatelessWidget {
  const AccountPage({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AccountBloc>(
      create: (context) => AccountBloc(AccountState(
        accountModelObj: AccountModel(),
      ))
        ..add(AccountInitialEvent()),
      child: AccountPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray100,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillGray,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.v),
              child: Column(
                children: [
                  _buildProfileSection(context),
                  _buildOrderSection(context),
                  _buildSettingsSection(context),
                  _buildLogoutSection(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildProfileSection(BuildContext context) {
    return SizedBox(
      height: 241.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 111.v,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: appTheme.whiteA700,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 24.h,
                vertical: 50.v,
              ),
              decoration: AppDecoration.fillPrimaryContainer.copyWith(
                borderRadius: BorderRadiusStyle.customBorderBL36,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 18.v),
                  Text(
                    "lbl_my_profile".tr,
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 29.v),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "lbl_jos_creative".tr,
                            style: theme.textTheme.titleLarge,
                          ),
                          SizedBox(height: 9.v),
                          Text(
                            "msg_josphamdes_gmail_com".tr,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgIconsOutlineEdit,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        margin: EdgeInsets.only(
                          left: 28.h,
                          bottom: 26.v,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildOrderSection(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicWidth(
        child: SizedBox(
          height: 275.v,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.h,
                    vertical: 28.v,
                  ),
                  decoration: AppDecoration.whitest,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 61.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9.h),
                        child: _buildPaymentSection(
                          context,
                          musicImage: ImageConstant.imgIconsOutlineNavigation,
                          inviteFriends: "lbl_payment_methods".tr,
                        ),
                      ),
                      SizedBox(height: 24.v),
                      Divider(
                        endIndent: 9.h,
                      ),
                      SizedBox(height: 16.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9.h),
                        child: _buildPaymentSection(
                          context,
                          musicImage: ImageConstant.imgMusic,
                          inviteFriends: "lbl_invite_friends".tr,
                        ),
                      ),
                      SizedBox(height: 24.v),
                      Divider(
                        endIndent: 9.h,
                      ),
                      SizedBox(height: 20.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant
                                  .imgIconsOutlineNavigationPrimarycontainer24x24,
                              height: 24.adaptSize,
                              width: 24.adaptSize,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 16.h,
                                top: 3.v,
                              ),
                              child: Text(
                                "lbl_quick_login".tr,
                                style:
                                    CustomTextStyles.titleMediumInterOnPrimary,
                              ),
                            ),
                            Spacer(),
                            BlocSelector<AccountBloc, AccountState, bool?>(
                              selector: (state) => state.isSelectedSwitch,
                              builder: (context, isSelectedSwitch) {
                                return CustomSwitch(
                                  margin: EdgeInsets.symmetric(vertical: 4.v),
                                  value: isSelectedSwitch,
                                  onChange: (value) {
                                    context
                                        .read<AccountBloc>()
                                        .add(ChangeSwitchEvent(value: value));
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 24.v),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 132.h,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomImageView(
                                      imagePath:
                                          ImageConstant.imgUserPrimarycontainer,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 3.v),
                                      child: Text(
                                        "lbl_my_voucher".tr,
                                        style: CustomTextStyles
                                            .titleMediumInterOnPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgArrowRight,
                                height: 24.adaptSize,
                                width: 24.adaptSize,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 24.v),
                      Divider(
                        endIndent: 24.h,
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

  /// Section Widget
  Widget _buildSettingsSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 19.h,
        vertical: 24.v,
      ),
      decoration: AppDecoration.whitest,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.h),
            child: _buildPaymentSection(
              context,
              musicImage: ImageConstant.imgIconsOutlineNavigation24x24,
              inviteFriends: "lbl_my_order".tr,
            ),
          ),
          SizedBox(height: 24.v),
          Divider(),
          SizedBox(height: 28.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.h),
            child: _buildPaymentSection(
              context,
              musicImage: ImageConstant.imgSearch,
              inviteFriends: "lbl_settings".tr,
            ),
          ),
          SizedBox(height: 12.v),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildLogoutSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 3.h),
      padding: EdgeInsets.symmetric(
        horizontal: 21.h,
        vertical: 36.v,
      ),
      decoration: AppDecoration.whitest,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 101.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomImageView(
                  imagePath:
                      ImageConstant.imgIconsOutlineNavigationPrimarycontainer,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.v),
                  child: Text(
                    "lbl_log_out".tr,
                    style: CustomTextStyles.titleMediumInterOnPrimary,
                  ),
                ),
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgArrowRight,
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.only(right: 3.h),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildPaymentSection(
    BuildContext context, {
    required String musicImage,
    required String inviteFriends,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: musicImage,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 16.h,
            bottom: 2.v,
          ),
          child: Text(
            inviteFriends,
            style: CustomTextStyles.titleMediumInterOnPrimary.copyWith(
              color: theme.colorScheme.onPrimary.withOpacity(1),
            ),
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ],
    );
  }
}
