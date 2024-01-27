import 'package:flutter/material.dart';
import 'package:photo/core/app_export.dart';

// ignore: must_be_immutable
class DiscoveroverflowbehaviorItemWidget extends StatelessWidget {
  DiscoveroverflowbehaviorItemWidget({
    Key? key,
  }) : super(
          key: key,
        );

  // DiscoveroverflowbehaviorItemModel discoveroverflowbehaviorItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomImageView(
        imagePath: 'assets/images/image_not_found.png',
        height: 310.v,
        width: 167.h,
      ),
    );
  }
}
