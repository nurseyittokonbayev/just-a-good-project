import 'package:photo/presentation/searchscreen/bloc/search_bloc.dart';
import 'package:photo/presentation/searchscreen/widgets/searchresultspreserve_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:photo/core/app_export.dart';
import 'package:photo/widgets/app_bar/appbar_title.dart';
import 'package:photo/widgets/app_bar/custom_app_bar.dart';
import 'package:photo/widgets/custom_outlined_button.dart';
import 'package:photo/widgets/custom_search_view.dart';

class SearchResultsPreserveScrollPositionScreen extends StatefulWidget {
  SearchResultsPreserveScrollPositionScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return SearchResultsPreserveScrollPositionScreen();
  }

  @override
  State<SearchResultsPreserveScrollPositionScreen> createState() =>
      _SearchResultsPreserveScrollPositionScreenState();
}

class _SearchResultsPreserveScrollPositionScreenState
    extends State<SearchResultsPreserveScrollPositionScreen> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  final TextEditingController controller = TextEditingController();

  int perPage = 4;

  int present = 0;

  List<String> downloadPhotos = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 26.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5.v),
                    padding: EdgeInsets.symmetric(horizontal: 15.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomSearchView(
                          controller: controller,
                        ),
                        SizedBox(height: 31.v),
                        Text(
                          "lbl_all_results".tr.toUpperCase(),
                          style: theme.textTheme.labelLarge,
                        ),
                        SizedBox(height: 23.v),
                        BlocBuilder<SearchBloc, SearchState>(
                          builder: (context, state) {
                            if (state is SearchInitial) {
                              return const Text('initial state');
                            } else if (state is SearchLoading) {
                              return Container(
                                height: 300,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/image_not_found.png"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                    child: CircularProgressIndicator(
                                  color: theme.colorScheme.onPrimary,
                                )),
                              );
                            } else if (state is SearchSuccess) {
                              return GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 108.v,
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 11.h,
                                    crossAxisSpacing: 11.h,
                                  ),
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 50,
                                  itemBuilder: (context, index) {
                                    final photo = state.photos[index];
                                    return SearchresultspreserveItemWidget(
                                      photo,
                                    );
                                  });
                            } else if (state is SearchError) {
                              return Text(state.message ?? '');
                            } else {
                              return const Text(' default state');
                            }
                          },
                        ),
                        SizedBox(height: 32.v),
                        CustomOutlinedButton(
                          text: "lbl_see_more".tr.toUpperCase(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 77.v,
      title: AppbarTitle(
        text: "lbl_search".tr,
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }
}
