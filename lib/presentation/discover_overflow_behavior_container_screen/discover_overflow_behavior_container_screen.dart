import 'package:photo/presentation/chats_screen/chats_screen.dart';
import 'package:photo/presentation/profile_screen/profile_screen.dart';
import 'package:photo/presentation/searchscreen/search_results_preserve_scroll_position_screen.dart';
import 'bloc/discover_overflow_behavior_container_bloc.dart';
import 'models/discover_overflow_behavior_container_model.dart';
import 'package:flutter/material.dart';
import 'package:photo/core/app_export.dart';
import 'package:photo/presentation/discover_overflow_behavior_page/discover_overflow_behavior_page.dart';
import 'package:photo/widgets/custom_bottom_bar.dart';

class DiscoverOverflowBehaviorContainerScreen extends StatelessWidget {
  DiscoverOverflowBehaviorContainerScreen({Key? key}) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<DiscoverOverflowBehaviorContainerBloc>(
      create: (context) => DiscoverOverflowBehaviorContainerBloc(
        DiscoverOverflowBehaviorContainerState(
          discoverOverflowBehaviorContainerModelObj:
              DiscoverOverflowBehaviorContainerModel(),
        ),
      )..add(DiscoverOverflowBehaviorContainerInitialEvent()),
      child: DiscoverOverflowBehaviorContainerScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverOverflowBehaviorContainerBloc,
        DiscoverOverflowBehaviorContainerState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Navigator(
              key: navigatorKey,
              initialRoute: AppRoutes.discoverOverflowBehaviorPage,
              onGenerateRoute: (routeSetting) {
                return PageRouteBuilder(
                  pageBuilder: (ctx, ani, ani1) {
                    switch (routeSetting.name) {
                      case AppRoutes.discoverOverflowBehaviorPage:
                        return DiscoverOverflowBehaviorPage.builder(context);

                      case AppRoutes.searchResultsPreserveScrollPositionScreen:
                        return SearchResultsPreserveScrollPositionScreen
                            .builder(context);
                      case AppRoutes.chatsScreen:
                        return ChatsScreen.builder(
                          context,
                        );
                      case AppRoutes.profileScreen:
                        return ProfileScreen.builder(context);
                      default:
                        return DefaultWidget();
                    }
                  },
                  transitionDuration: Duration(
                    seconds: 0,
                  ),
                );
              },
            ),
            bottomNavigationBar: CustomBottomBar(
              onChanged: (BottomBarEnum type) {
                Navigator.pushNamed(
                  navigatorKey.currentContext!,
                  getCurrentRoute(type),
                );
              },
            ),
          ),
        );
      },
    );
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.toolbarnew:
        return AppRoutes.discoverOverflowBehaviorPage;
      case BottomBarEnum.Search:
        return AppRoutes.searchResultsPreserveScrollPositionScreen;
      case BottomBarEnum.Plus:
        return "/";
      case BottomBarEnum.toolbarcomment:
        return AppRoutes.chatsScreen;
      case BottomBarEnum.toolbarbell:
        return AppRoutes.profileScreen;
      default:
        return "/";
    }
  }

  Widget getCurrentPage(BuildContext context, String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.discoverOverflowBehaviorPage:
        return DiscoverOverflowBehaviorPage.builder(context);

      case AppRoutes.searchResultsPreserveScrollPositionScreen:
        return SearchResultsPreserveScrollPositionScreen.builder(context);
      case AppRoutes.chatsScreen:
        return ChatsScreen.builder(context);
      case AppRoutes.profileScreen:
        return ProfileScreen.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
