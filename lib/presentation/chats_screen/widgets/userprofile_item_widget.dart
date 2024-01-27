import '../models/user_comment_model.dart';
import 'package:flutter/material.dart';
import 'package:photo/core/app_export.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  UserprofileItemWidget(
    this.userprofileItemModelObj, {
    Key? key,
    this.onTapUserProfile,
  }) : super(
          key: key,
        );

  UserCommentModel userprofileItemModelObj;

  VoidCallback? onTapUserProfile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapUserProfile!.call();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Container(
          height: 180.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgEllipse64x64,
                height: 64.adaptSize,
                width: 64.adaptSize,
                radius: BorderRadius.circular(
                  32.h,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16.h,
                    bottom: 22.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userprofileItemModelObj.name,
                        style: CustomTextStyles.labelLargeBold,
                      ),
                      SizedBox(height: 9.v),
                      Text(
                        userprofileItemModelObj.body,
                        style: theme.textTheme.bodyMedium,
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
}
