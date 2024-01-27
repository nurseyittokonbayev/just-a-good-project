import 'package:flutter/material.dart';
import 'package:photo/presentation/discover_overflow_behavior_container_screen/discover_overflow_behavior_container_screen.dart';
import 'package:photo/presentation/logged_out_screen/logged_out_screen.dart';
import 'package:photo/presentation/register_step_1_screen/register_step_1_screen.dart';
import 'package:photo/presentation/login_screen/login_screen.dart';
import 'package:photo/presentation/profile_screen/profile_screen.dart';
import 'package:photo/presentation/chats_screen/chats_screen.dart';
import 'package:photo/presentation/individual_chat_screen/individual_chat_screen.dart';
import 'package:photo/presentation/register_step_2_screen/register_step_2_screen.dart';
import 'package:photo/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:photo/presentation/searchscreen/search_results_preserve_scroll_position_screen.dart';

class AppRoutes {
  static const String loggedOutScreen = '/logged_out_screen';

  static const String registerStep1Screen = '/register_step_1_screen';

  static const String loginScreen = '/login_screen';

  static const String searchResultsPage = '/search_results_page';

  static const String searchResultsContainerScreen =
      '/search_results_container_screen';

  static const String profileScreen = '/profile_screen';

  static const String chatsScreen = '/chats_screen';
  static const String discoverOverflowBehaviorPage =
      '/discover_overflow_behavior_page';

  static const String discoverOverflowBehaviorContainerScreen =
      '/discover_overflow_behavior_container_screen';

  static const String individualChatScreen = '/individual_chat_screen';

  static const String registerStep2Screen = '/register_step_2_screen';

  static const String searchResultsPreserveScrollPositionScreen =
      '/search_results_preserve_scroll_position_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        loggedOutScreen: LoggedOutScreen.builder,
        registerStep1Screen: RegisterStep1Screen.builder,
        loginScreen: LoginScreen.builder,
        discoverOverflowBehaviorContainerScreen:
            DiscoverOverflowBehaviorContainerScreen.builder,
        // searchResultsContainerScreen: SearchResultsContainerScreen.builder,
        profileScreen: ProfileScreen.builder,
        chatsScreen: ChatsScreen.builder,
        individualChatScreen: IndividualChatScreen.builder,
        registerStep2Screen: RegisterStep2Screen.builder,
        searchResultsPreserveScrollPositionScreen:
            SearchResultsPreserveScrollPositionScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: LoggedOutScreen.builder
      };
}
