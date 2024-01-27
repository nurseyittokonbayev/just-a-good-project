import 'bloc/individual_chat_bloc.dart';
import 'models/individual_chat_model.dart';
import 'package:flutter/material.dart';
import 'package:photo/core/app_export.dart';
import 'package:photo/widgets/app_bar/appbar_leading_image.dart';
import 'package:photo/widgets/app_bar/appbar_subtitle.dart';
import 'package:photo/widgets/app_bar/custom_app_bar.dart';
import 'package:photo/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class IndividualChatScreen extends StatelessWidget {
  IndividualChatScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<IndividualChatBloc>(
        create: (context) => IndividualChatBloc(
            IndividualChatState(individualChatModelObj: IndividualChatModel()))
          ..add(IndividualChatInitialEvent()),
        child: IndividualChatScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 32.v),
            child: Column(children: [
              _buildIndividualChatRow1(context),
              SizedBox(height: 24.v),
              _buildIndividualChatRow2(context),
              SizedBox(height: 24.v),
              _buildIndividualChatRow3(context),
              SizedBox(height: 5.v)
            ])),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 44.v,
        leadingWidth: 21.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 9.h, top: 12.v, bottom: 11.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_james".tr),
        styleType: Style.bgShadow);
  }

  /// Section Widget
  Widget _buildIndividualChatRow1(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
              imagePath: ImageConstant.imgEllipse28x28,
              height: 28.adaptSize,
              width: 28.adaptSize,
              radius: BorderRadius.circular(14.h),
              margin: EdgeInsets.only(top: 2.v, bottom: 54.v)),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(left: 16.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 13.v),
                  decoration: AppDecoration.fillSecondaryContainer.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderBL6),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 2.v),
                        Container(
                            width: 256.h,
                            margin: EdgeInsets.only(right: 10.h),
                            child: Text("msg_really_love_your".tr,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodyMedium!
                                    .copyWith(height: 1.38)))
                      ])))
        ]);
  }

  /// Section Widget
  Widget _buildIndividualChatRow2(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 13.v),
                  decoration: AppDecoration.fillSecondaryContainer.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderTL6),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 2.v),
                        Container(
                            width: 258.h,
                            margin: EdgeInsets.only(right: 8.h),
                            child: Text("msg_a_fast_50mm_like".tr,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodyMedium!
                                    .copyWith(height: 1.38)))
                      ]))),
          CustomImageView(
              imagePath: ImageConstant.imgEllipse4,
              height: 28.adaptSize,
              width: 28.adaptSize,
              radius: BorderRadius.circular(14.h),
              margin: EdgeInsets.only(left: 16.h, bottom: 56.v))
        ]);
  }

  /// Section Widget
  Widget _buildIndividualChatRow3(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
            imagePath: ImageConstant.imgEllipse28x28,
            height: 28.adaptSize,
            width: 28.adaptSize,
            radius: BorderRadius.circular(14.h),
            margin: EdgeInsets.only(top: 2.v, bottom: 20.v)),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 16.h),
            child: BlocSelector<IndividualChatBloc, IndividualChatState,
                TextEditingController?>(
              selector: (state) => state.messageController,
              builder: (context, messageController) {
                return CustomTextFormField(
                    controller: messageController,
                    hintText: "msg_thank_you_that".tr,
                    hintStyle: theme.textTheme.bodyMedium!,
                    textInputAction: TextInputAction.done,
                    borderDecoration:
                        TextFormFieldStyleHelper.fillSecondaryContainer,
                    fillColor: theme.colorScheme.secondaryContainer);
              },
            ),
          ),
        )
      ],
    );
  }

  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
