import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo/presentation/discover_overflow_behavior_page/bloc/photos_bloc.dart';
import '/core/app_export.dart';
import 'package:photo/widgets/app_bar/appbar_title.dart';
import 'package:photo/widgets/app_bar/custom_app_bar.dart';
import 'package:photo/widgets/custom_outlined_button.dart';

class DiscoverOverflowBehaviorPage extends StatefulWidget {
  const DiscoverOverflowBehaviorPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return DiscoverOverflowBehaviorPage();
  }

  @override
  State<DiscoverOverflowBehaviorPage> createState() =>
      _DiscoverOverflowBehaviorPageState();
}

class _DiscoverOverflowBehaviorPageState
    extends State<DiscoverOverflowBehaviorPage> {
  int perPage = 4;
  int present = 0;
  final ImageConstant imageConstant = ImageConstant();
  List<String> downloadPhotos = [];
  bool _gridVisible = false;

  @override
  void initState() {
    super.initState();

    downloadPhotos = imageConstant.photos.take(perPage).toList();
  }

  void loadMore() {
    setState(() {
      downloadPhotos.addAll(imageConstant.photos
          .skip(downloadPhotos.length)
          .take(perPage)
          .toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 78.v,
        title: AppbarTitle(
          text: "Discover".tr,
          margin: EdgeInsets.only(left: 16.h),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 25.v, right: 16, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 500,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "what's new today".tr.toUpperCase(),
                    style: theme.textTheme.labelLarge,
                  ),
                  SizedBox(height: 23.v),
                  BlocBuilder<PhotosBloc, PhotosState>(
                    builder: (context, state) {
                      if (state.photosModel != null) {
                        return CarouselSlider.builder(
                          itemCount: 9,
                          options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            disableCenter: true,
                            viewportFraction: 1,
                            height: 400.adaptSize,
                            enlargeFactor: 0.3,
                          ),
                          itemBuilder: (context, index, realIdx) {
                            if (state.photosModel != null &&
                                    index < state.photosModel!.length ||
                                state.userModel != null &&
                                    index < state.userModel!.length) {
                              final photo = state.photosModel![index];
                              final user = state.userModel![index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => FullScreenImage(
                                        imagePath: photo.url!,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  child: Column(
                                    children: [
                                      Center(
                                        child: CachedNetworkImage(
                                          imageUrl: photo.url!,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      SizedBox(height: 15.v),
                                      Row(
                                        children: [
                                          CustomImageView(
                                            imagePath:
                                                "assets/images/image_not_found.png",
                                            height: 28.adaptSize,
                                            width: 28.adaptSize,
                                            radius: BorderRadius.circular(
                                              14.h,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 8.h),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  user.name!,
                                                  style: CustomTextStyles
                                                      .labelLargeBold,
                                                ),
                                                Text(
                                                  user.username!,
                                                  style:
                                                      theme.textTheme.bodySmall,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        );
                      } else {
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
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.v),
            GestureDetector(
              onTap: () {
                setState(() {
                  _gridVisible = !_gridVisible;
                });
              },
              child: Text(
                _gridVisible ? "Hide" : "browse all".tr.toUpperCase(),
                style: theme.textTheme.labelLarge,
              ),
            ),
            SizedBox(height: 32.v),
            Container(
              height: _gridVisible ? MediaQuery.of(context).size.height : 0,
              child: MasonryGridView.builder(
                mainAxisSpacing: 9,
                crossAxisSpacing: 9,
                itemCount: downloadPhotos.length + 1,
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  if (index < downloadPhotos.length) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullScreenImage(
                                imagePath: downloadPhotos[index]),
                          ),
                        );
                      },
                      child: Image.asset(
                        downloadPhotos[index],
                      ),
                    );
                  } else if (downloadPhotos.length <
                      imageConstant.photos.length) {
                    return CustomOutlinedButton(
                      onPressed: loadMore,
                      text: "lbl_see_more".tr.toUpperCase(),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imagePath;

  const FullScreenImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: 'imageHero_${imagePath.hashCode}',
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 16.0,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgEllipse28x281,
                        height: 28.adaptSize,
                        width: 28.adaptSize,
                        radius: BorderRadius.circular(
                          14.h,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ridhwan Nordin".tr,
                              style: CustomTextStyles.labelLargeBold.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "@ridzjcob".tr,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 150.h,
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 32.0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
