import 'package:photo/data/models/photo_models.dart';

import 'package:flutter/material.dart';
import 'package:photo/core/app_export.dart';

// ignore: must_be_immutable
class SearchresultspreserveItemWidget extends StatelessWidget {
  SearchresultspreserveItemWidget(
    this.photos, {
    Key? key,
  }) : super(
          key: key,
        );
  final PhotosModels photos;

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: photos.url,
      height: 107.adaptSize,
      width: 107.adaptSize,
    );
  }
}
