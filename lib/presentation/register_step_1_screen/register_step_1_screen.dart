import 'package:flutter/material.dart';
import 'package:photo/core/app_export.dart';
import 'package:photo/core/utils/validation_functions.dart';
import 'package:photo/presentation/register_step_1_screen/bloc/register_step_1_bloc.dart';
import 'package:photo/widgets/app_bar/appbar_leading_image.dart';
import 'package:photo/widgets/app_bar/custom_app_bar.dart';
import 'package:photo/widgets/custom_outlined_button.dart';
import 'package:photo/widgets/custom_text_form_field.dart';

class RegisterStep1Screen extends StatelessWidget {
  RegisterStep1Screen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return RegisterStep1Screen();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          leadingWidth: double.maxFinite,
          leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowDown,
            margin: EdgeInsets.fromLTRB(16.h, 16.v, 347.h, 16.v),
            onTap: () {
              onTapArrowDown(context);
            },
          ),
        ),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 17.v),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "lbl_register2".tr,
                      style: theme.textTheme.displaySmall,
                    ),
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
                      },
                    ),
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
                      obscureText: true,
                    ),
                    SizedBox(height: 16.v),
                    BlocListener<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is AuthSuccessState) {
                          NavigatorService.pushNamed(
                              AppRoutes.registerStep2Screen);
                        }
                      },
                      child: CustomOutlinedButton(
                        text: "lbl_next".tr.toUpperCase(),
                        buttonStyle: CustomButtonStyles.outlinePrimaryTL6,
                        buttonTextStyle: CustomTextStyles.labelLargeOnError,
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context).add(
                            SendDataEvent(
                                email: emailController.text,
                                password: passwordController.text),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onTapArrowDown(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.loggedOutScreen);
  }
}
