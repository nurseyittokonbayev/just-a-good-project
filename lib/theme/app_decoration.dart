import 'package:flutter/material.dart';
import 'package:photo/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillOnError => BoxDecoration(
        color: theme.colorScheme.onError,
      );
  static BoxDecoration get fillSecondaryContainer => BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
      );

  // Gradient decorations
  static BoxDecoration get gradientOnPrimaryToDeepOrangeA => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.7, 0),
          end: Alignment(0.3, 1),
          colors: [
            theme.colorScheme.onPrimary,
            appTheme.deepOrangeA400,
          ],
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder14 => BorderRadius.circular(
        14.h,
      );
  static BorderRadius get circleBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get circleBorder32 => BorderRadius.circular(
        32.h,
      );
  static BorderRadius get circleBorder64 => BorderRadius.circular(
        64.h,
      );

  // Custom borders
  static BorderRadius get customBorderBL6 => BorderRadius.only(
        topRight: Radius.circular(6.h),
        bottomLeft: Radius.circular(6.h),
        bottomRight: Radius.circular(6.h),
      );
  static BorderRadius get customBorderTL6 => BorderRadius.only(
        topLeft: Radius.circular(6.h),
        bottomLeft: Radius.circular(6.h),
        bottomRight: Radius.circular(6.h),
      );
}

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;
