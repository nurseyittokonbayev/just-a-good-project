import 'bloc/profile_bloc.dart';
import 'models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:photo/core/app_export.dart';
import 'package:photo/widgets/custom_outlined_button.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key})
      : super(
          key: key,
        );

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc(ProfileState(
        profileModelObj: ProfileModel(),
      ))
        ..add(ProfileInitialEvent()),
      child: ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  SizedBox(height: 32.v),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 5.v),
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: Column(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgEllipse128x128,
                              height: 128.adaptSize,
                              width: 128.adaptSize,
                              radius: BorderRadius.circular(
                                64.h,
                              ),
                            ),
                            SizedBox(height: 29.v),
                            Text(
                              "lbl_jane".tr,
                              style: theme.textTheme.displaySmall,
                            ),
                            SizedBox(height: 17.v),
                            Text(
                              "msg_san_francisco_ca".tr.toUpperCase(),
                              style: theme.textTheme.labelLarge,
                            ),
                            SizedBox(height: 30.v),
                            CustomOutlinedButton(
                              text: "lbl_follow_jane".tr.toUpperCase(),
                              buttonStyle: CustomButtonStyles.outlinePrimaryTL6,
                              buttonTextStyle:
                                  CustomTextStyles.labelLargeOnError,
                            ),
                            SizedBox(height: 16.v),
                            CustomOutlinedButton(
                              text: "lbl_message".tr.toUpperCase(),
                            ),
                            SizedBox(height: 32.v),
                            SizedBox(
                              height: 859.v,
                              width: 343.h,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CustomImageView(
                                    imagePath:
                                        ImageConstant.imgRectangle25220x167,
                                    height: 220.v,
                                    width: 167.h,
                                    alignment: Alignment.bottomRight,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      height: 859.v,
                                      width: 343.h,
                                      child: Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: [
                                          CustomImageView(
                                            imagePath: ImageConstant
                                                .imgRectangle23310x167,
                                            height: 310.v,
                                            width: 167.h,
                                            alignment: Alignment.bottomRight,
                                            margin:
                                                EdgeInsets.only(bottom: 229.v),
                                          ),
                                          CustomImageView(
                                            imagePath: ImageConstant
                                                .imgRectangle24310x167,
                                            height: 310.v,
                                            width: 167.h,
                                            alignment: Alignment.bottomLeft,
                                          ),
                                          _buildDoctorReviews(context),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 32.v),
                            CustomOutlinedButton(
                              text: "lbl_see_more".tr.toUpperCase(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildDoctorReviews(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 319.v),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 4.h),
                child: Column(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgRectangle2220x167,
                      height: 220.v,
                      width: 167.h,
                    ),
                    SizedBox(height: 10.v),
                    CustomImageView(
                      imagePath: ImageConstant.imgRectangle22310x167,
                      height: 310.v,
                      width: 167.h,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: CustomImageView(
                imagePath: ImageConstant.imgRectangle21310x167,
                height: 310.v,
                width: 167.h,
                margin: EdgeInsets.only(
                  left: 4.h,
                  bottom: 230.v,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
