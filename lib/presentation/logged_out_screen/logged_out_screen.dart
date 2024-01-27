import 'bloc/logged_out_bloc.dart';
import 'models/logged_out_model.dart';
import 'package:flutter/material.dart';
import 'package:photo/core/app_export.dart';
import 'package:photo/widgets/custom_elevated_button.dart';
import 'package:photo/widgets/custom_outlined_button.dart';

class LoggedOutScreen extends StatelessWidget {
  const LoggedOutScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<LoggedOutBloc>(
        create: (context) =>
            LoggedOutBloc(LoggedOutState(loggedOutModelObj: LoggedOutModel()))
              ..add(LoggedOutInitialEvent()),
        child: LoggedOutScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoggedOutBloc, LoggedOutState>(
      builder: (context, state) {
        return Scaffold(
          body: SizedBox(
            height: 790.v,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                CustomImageView(
                    imagePath: ImageConstant.imgRectangle,
                    height: 750.v,
                    width: 375.h,
                    alignment: Alignment.topCenter),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5.v),
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Spacer(),
                        _buildUserProfile(context),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: _buildLogIn(context),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 38.adaptSize,
                width: 38.adaptSize,
                margin: EdgeInsets.only(top: 2.v, bottom: 13.v),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgUnion,
                      height: 38.adaptSize,
                      width: 38.adaptSize,
                      alignment: Alignment.center,
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgUser,
                      height: 38.adaptSize,
                      width: 38.adaptSize,
                      alignment: Alignment.center,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child:
                    Text("lbl_photo".tr, style: theme.textTheme.displayMedium),
              ),
            ],
          ),
        ),
        SizedBox(height: 294.v),
        Row(
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgEllipse,
              height: 28.adaptSize,
              width: 28.adaptSize,
              radius: BorderRadius.circular(14.h),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.h, bottom: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("msg_pawel_czerwinski".tr,
                      style: CustomTextStyles.labelLargeBold),
                  Text("msg_pawel_czerwinski2".tr,
                      style: theme.textTheme.bodySmall)
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildLogIn(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 10, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomOutlinedButton(
              width: 167.h,
              text: "lbl_log_in".tr.toUpperCase(),
              onPressed: () {
                onTapLogIn(context);
              }),
          SizedBox(
            height: 52.v,
            width: 167.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.v),
                    child: Text("lbl_register".tr.toUpperCase(),
                        style: CustomTextStyles.labelLargeSFProText),
                  ),
                ),
                CustomElevatedButton(
                    width: 167.h,
                    text: "lbl_register".tr.toUpperCase(),
                    onPressed: () {
                      onTapRegister(context);
                    },
                    alignment: Alignment.center)
              ],
            ),
          ),
        ],
      ),
    );
  }

  onTapLogIn(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }

  onTapRegister(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.registerStep1Screen,
    );
  }
}
