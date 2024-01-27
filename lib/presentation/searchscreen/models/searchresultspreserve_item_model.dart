import '../../../core/app_export.dart';

/// This class is used in the [searchresultspreserve_item_widget] screen.
class SearchresultspreserveItemModel {
  SearchresultspreserveItemModel({
    this.rectangle,
    this.id,
  }) {
    rectangle = rectangle ?? ImageConstant.imgRectangle2;
    id = id ?? "";
  }

  String? rectangle;

  String? id;
}
