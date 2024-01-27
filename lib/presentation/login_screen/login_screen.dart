import 'package:flutter/material.dart';
import 'package:photo/core/app_export.dart';
import 'package:photo/core/utils/validation_functions.dart';
import 'package:photo/presentation/login_screen/bloc/login_bloc.dart';
import 'package:photo/widgets/app_bar/appbar_leading_image.dart';
import 'package:photo/widgets/app_bar/custom_app_bar.dart';
import 'package:photo/widgets/custom_outlined_button.dart';
import 'package:photo/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return LoginScreen();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 17.v),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("lbl_log_in2".tr, style: theme.textTheme.displaySmall),
                    SizedBox(height: 29.v),
                    CustomTextFormField(
                        controller: emailController,
                        hintText: "msg_jane_example_com".tr,
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null ||
                              (!isValidEmail(value, isRequired: true))) {
                            return "err_msg_please_enter_valid_email".tr;
                          }
                          return null;
                        }),
                    SizedBox(height: 16.v),
                    CustomTextFormField(
                        controller: passwordController,
                        hintText: "lbl".tr,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value == null ||
                              (!isValidPassword(value, isRequired: true))) {
                            return "err_msg_please_enter_valid_password".tr;
                          }
                          return null;
                        },
                        obscureText: true),
                    SizedBox(height: 16.v),
                    BlocListener<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state is LoginSuccess) {
                          NavigatorService.pushNamed(AppRoutes
                              .discoverOverflowBehaviorContainerScreen);
                        }
                      },
                      child: CustomOutlinedButton(
                        text: "lbl_log_in2".tr.toUpperCase(),
                        buttonStyle: CustomButtonStyles.outlinePrimaryTL6,
                        buttonTextStyle: CustomTextStyles.labelLargeOnError,
                        onPressed: () {
                          BlocProvider.of<LoginBloc>(context).add(
                              LoginEnterEvent(
                                  email: emailController.text,
                                  password: passwordController.text));
                        },
                      ),
                    ),
                    SizedBox(height: 5.v)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: double.maxFinite,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowDown,
            margin: EdgeInsets.fromLTRB(16.h, 16.v, 347.h, 16.v),
            onTap: () {
              onTapArrowDown(context);
            }));
  }

  /// Navigates to the loggedOutScreen when the action is triggered.
  onTapArrowDown(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loggedOutScreen,
    );
  }
}
