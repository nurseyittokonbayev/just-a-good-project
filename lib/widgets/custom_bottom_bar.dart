import 'package:flutter/material.dart';
import 'package:photo/core/app_export.dart';

// ignore: must_be_immutable
class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.img40ToolbarNew,
      activeIcon: ImageConstant.img40ToolbarNew,
      type: BottomBarEnum.toolbarnew,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgSearch,
      activeIcon: ImageConstant.imgSearch,
      type: BottomBarEnum.Search,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgPlus,
      activeIcon: ImageConstant.imgPlus,
      type: BottomBarEnum.Plus,
    ),
    BottomMenuModel(
      icon: ImageConstant.img40ToolbarComment,
      activeIcon: ImageConstant.img40ToolbarComment,
      type: BottomBarEnum.toolbarcomment,
    ),
    BottomMenuModel(
      icon: ImageConstant.img40ToolbarBell,
      activeIcon: ImageConstant.img40ToolbarBell,
      type: BottomBarEnum.toolbarbell,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83.v,
      decoration: BoxDecoration(
        color: theme.colorScheme.onError,
        boxShadow: [
          // BoxShadow(
          //   color: theme.colorScheme.primaryContainer,
          //   spreadRadius: 2.h,
          //   blurRadius: 2.h,
          //   offset: Offset(
          //     0,
          //     -0.5,
          //   ),
          // ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: bottomMenuList[index].icon,
              height: 40.adaptSize,
              width: 40.adaptSize,
              color: theme.colorScheme.primary,
            ),
            activeIcon: Container(
              decoration: AppDecoration.gradientOnPrimaryToDeepOrangeA.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder20,
              ),
              child: CustomImageView(
                imagePath: bottomMenuList[index].activeIcon,
                height: 40.adaptSize,
                width: 70.adaptSize,
                color: theme.colorScheme.onError,
                margin: EdgeInsets.symmetric(vertical: 13.v),
              ),
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}

enum BottomBarEnum {
  toolbarnew,
  Search,
  Plus,
  toolbarcomment,
  toolbarbell,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
