import 'bloc/account_one_bloc.dart';
import 'models/account_one_model.dart';
import 'package:flutter/material.dart';
import 'package:mamak_app/core/app_export.dart';
import 'package:mamak_app/presentation/account_page/account_page.dart';
import 'package:mamak_app/widgets/custom_bottom_bar.dart';
import 'package:mamak_app/widgets/custom_drop_down.dart';
import 'package:mamak_app/widgets/custom_switch.dart';

class AccountOneScreen extends StatelessWidget {
  AccountOneScreen({Key? key})
      : super(
          key: key,
        );

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<AccountOneBloc>(
      create: (context) => AccountOneBloc(AccountOneState(
        accountOneModelObj: AccountOneModel(),
      ))
        ..add(AccountOneInitialEvent()),
      child: AccountOneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray100,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 518.v,
                  width: 373.h,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgMap1518x373,
                        height: 518.v,
                        width: 373.h,
                        alignment: Alignment.center,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 123.h,
                            top: 199.v,
                            bottom: 66.v,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 178.v,
                                width: 59.h,
                                margin: EdgeInsets.only(bottom: 74.v),
                                child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    CustomImageView(
                                      imagePath: ImageConstant.imgWay,
                                      height: 90.v,
                                      width: 55.h,
                                      radius: BorderRadius.circular(
                                        2.h,
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                    CustomImageView(
                                      imagePath: ImageConstant.imgCar,
                                      height: 52.v,
                                      width: 35.h,
                                      alignment: Alignment.topRight,
                                    ),
                                    CustomImageView(
                                      imagePath: ImageConstant.imgLocation,
                                      height: 48.adaptSize,
                                      width: 48.adaptSize,
                                      radius: BorderRadius.circular(
                                        24.h,
                                      ),
                                      alignment: Alignment.bottomLeft,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(
                                flex: 55,
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgCar51x50,
                                height: 51.v,
                                width: 50.h,
                                margin: EdgeInsets.only(top: 201.v),
                              ),
                              Spacer(
                                flex: 44,
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgCar48x41,
                                height: 48.v,
                                width: 39.h,
                                margin: EdgeInsets.only(
                                  top: 71.v,
                                  bottom: 132.v,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 38.v),
                _buildSearchRow(context),
                SizedBox(height: 9.v),
                _buildHorizontalScroll(context),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildSearchRow(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      padding: EdgeInsets.all(3.h),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder28,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgSave,
            height: 16.adaptSize,
            width: 16.adaptSize,
            margin: EdgeInsets.only(
              left: 20.h,
              top: 16.v,
              bottom: 16.v,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.h,
              top: 14.v,
              bottom: 14.v,
            ),
            child: Text(
              "lbl_where_to".tr,
              style: CustomTextStyles.titleMediumMedium,
            ),
          ),
          Spacer(),
          BlocSelector<AccountOneBloc, AccountOneState, AccountOneModel?>(
            selector: (state) => state.accountOneModelObj,
            builder: (context, accountOneModelObj) {
              return CustomDropDown(
                width: 107.h,
                hintText: "lbl_now".tr,
                items: accountOneModelObj?.dropdownItemList ?? [],
                prefix: Container(
                  margin: EdgeInsets.fromLTRB(16.h, 16.v, 8.h, 16.v),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgClockOnsecondarycontainer,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                  ),
                ),
                prefixConstraints: BoxConstraints(
                  maxHeight: 48.v,
                ),
                onChanged: (value) {
                  context
                      .read<AccountOneBloc>()
                      .add(ChangeDropDownEvent(value: value));
                },
              );
            },
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHorizontalScroll(BuildContext context) {
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
                        child: _buildInviteFriendsRow(
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
                        child: _buildInviteFriendsRow(
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
                            BlocSelector<AccountOneBloc, AccountOneState,
                                bool?>(
                              selector: (state) => state.isSelectedSwitch,
                              builder: (context, isSelectedSwitch) {
                                return CustomSwitch(
                                  margin: EdgeInsets.symmetric(vertical: 4.v),
                                  value: isSelectedSwitch,
                                  onChange: (value) {
                                    context
                                        .read<AccountOneBloc>()
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
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  /// Common widget
  Widget _buildInviteFriendsRow(
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

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return "/";
      case BottomBarEnum.Transaction:
        return "/";
      case BottomBarEnum.Account:
        return AppRoutes.accountPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.accountPage:
        return AccountPage();
      default:
        return DefaultWidget();
    }
  }
}
