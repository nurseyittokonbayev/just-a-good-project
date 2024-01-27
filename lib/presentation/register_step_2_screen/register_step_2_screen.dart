import 'package:flutter/material.dart';
import 'package:photo/core/app_export.dart';
import 'package:photo/presentation/register_step_2_screen/bloc/register_step_2_bloc.dart';
import 'package:photo/presentation/register_step_2_screen/models/register_step_2_model.dart';
import 'package:photo/widgets/app_bar/appbar_leading_image.dart';
import 'package:photo/widgets/app_bar/custom_app_bar.dart';
import 'package:photo/widgets/custom_outlined_button.dart';
import 'package:photo/widgets/custom_text_form_field.dart';

class RegisterStep2Screen extends StatelessWidget {
  const RegisterStep2Screen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<RegisterStep2Bloc>(
      create: (context) => RegisterStep2Bloc(
        RegisterStep2State(registerStep2ModelObj: RegisterStep2Model()),
      )..add(RegisterStep2InitialEvent()),
      child: RegisterStep2Screen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 17.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("lbl_register2".tr, style: theme.textTheme.displaySmall),
              SizedBox(height: 29.v),
              BlocSelector<RegisterStep2Bloc, RegisterStep2State,
                  TextEditingController?>(
                selector: (state) => state.thejaneController,
                builder: (context, thejaneController) {
                  return CustomTextFormField(
                    controller: thejaneController,
                    hintText: "lbl_the_jane".tr,
                    textInputAction: TextInputAction.done,
                  );
                },
              ),
              SizedBox(height: 16.v),
              CustomOutlinedButton(
                text: "lbl_sign_up".tr.toUpperCase(),
                buttonStyle: CustomButtonStyles.outlinePrimaryTL6,
                buttonTextStyle: CustomTextStyles.labelLargeOnError,
                onPressed: () {
                  BlocProvider.of<RegisterStep2Bloc>(context)
                      .add(NavigateToNextPageEvent());
                },
              ),
              SizedBox(height: 31.v),
              Container(
                width: 324.h,
                margin: EdgeInsets.only(right: 18.h),
                child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "msg_by_signing_up_you2".tr,
                          style: CustomTextStyles.bodyMediumff000000),
                      TextSpan(
                          text: "msg_terms_of_service".tr,
                          style: CustomTextStyles.bodyMediumff000000
                              .copyWith(decoration: TextDecoration.underline)),
                      TextSpan(
                          text: "lbl_and".tr,
                          style: CustomTextStyles.bodyMediumff000000),
                      TextSpan(
                          text: "lbl_privacy_policy".tr,
                          style: CustomTextStyles.bodyMediumff000000
                              .copyWith(decoration: TextDecoration.underline))
                    ]),
                    textAlign: TextAlign.left),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: double.maxFinite,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.fromLTRB(16.h, 16.v, 347.h, 16.v),
        onTap: () {
          onTapArrowDown(context);
        },
      ),
    );
  }

  void onTapArrowDown(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.registerStep1Screen);
  }
}
