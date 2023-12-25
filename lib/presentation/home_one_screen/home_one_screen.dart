import '../home_one_screen/widgets/card3_item_widget.dart';
import 'bloc/home_one_bloc.dart';
import 'models/card3_item_model.dart';
import 'models/home_one_model.dart';
import 'package:flutter/material.dart';
import 'package:mamak_app/core/app_export.dart';
import 'package:mamak_app/widgets/custom_drop_down.dart';

class HomeOneScreen extends StatelessWidget {
  const HomeOneScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeOneBloc>(
      create: (context) => HomeOneBloc(HomeOneState(
        homeOneModelObj: HomeOneModel(),
      ))
        ..add(HomeOneInitialEvent()),
      child: HomeOneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.v),
              child: Column(
                children: [
                  _buildMapSection(context),
                  _buildCardSection(context),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildNavbarBottomSection(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildMapSection(BuildContext context) {
    return SizedBox(
      height: 518.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgMap1,
            height: 518.v,
            width: 375.h,
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
                    width: 41.h,
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
    );
  }

  /// Section Widget
  Widget _buildCardSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23.h),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 1.h),
            padding: EdgeInsets.all(3.h),
            decoration: AppDecoration.outlineGray.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder28,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
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
                BlocSelector<HomeOneBloc, HomeOneState, HomeOneModel?>(
                  selector: (state) => state.homeOneModelObj,
                  builder: (context, homeOneModelObj) {
                    return CustomDropDown(
                      width: 107.h,
                      hintText: "lbl_now".tr,
                      items: homeOneModelObj?.dropdownItemList ?? [],
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
                            .read<HomeOneBloc>()
                            .add(ChangeDropDownEvent(value: value));
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 24.v),
          SizedBox(
            height: 152.v,
            child: BlocSelector<HomeOneBloc, HomeOneState, HomeOneModel?>(
              selector: (state) => state.homeOneModelObj,
              builder: (context, homeOneModelObj) {
                return ListView.separated(
                  padding: EdgeInsets.only(left: 1.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (
                    context,
                    index,
                  ) {
                    return SizedBox(
                      width: 24.h,
                    );
                  },
                  itemCount: homeOneModelObj?.card3ItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    Card3ItemModel model =
                        homeOneModelObj?.card3ItemList[index] ??
                            Card3ItemModel();
                    return Card3ItemWidget(
                      model,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNavbarBottomSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 56.h,
        right: 49.h,
        bottom: 11.v,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgHome,
                height: 24.adaptSize,
                width: 24.adaptSize,
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.v),
                child: Text(
                  "lbl_home".tr,
                  style: CustomTextStyles.labelLargeOnErrorContainer,
                ),
              ),
            ],
          ),
          Spacer(
            flex: 52,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Opacity(
                opacity: 0.16,
                child: CustomImageView(
                  imagePath: ImageConstant.imgConfirmationNumber,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),
              ),
              Opacity(
                opacity: 0.16,
                child: Padding(
                  padding: EdgeInsets.only(top: 4.v),
                  child: Text(
                    "lbl_transaction".tr,
                    style: theme.textTheme.labelLarge,
                  ),
                ),
              ),
            ],
          ),
          Spacer(
            flex: 47,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Opacity(
                opacity: 0.16,
                child: CustomImageView(
                  imagePath: ImageConstant.imgPerson,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),
              ),
              Opacity(
                opacity: 0.16,
                child: Padding(
                  padding: EdgeInsets.only(top: 4.v),
                  child: Text(
                    "lbl_account".tr,
                    style: theme.textTheme.labelLarge,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
