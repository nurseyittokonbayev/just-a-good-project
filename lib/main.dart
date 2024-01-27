import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:photo/data/apiClient/api_client.dart';
import 'package:photo/firebase_options.dart';
import 'package:photo/presentation/chats_screen/bloc/chats_bloc.dart';
import 'package:photo/presentation/chats_screen/chats_screen.dart';
import 'package:photo/presentation/discover_overflow_behavior_page/bloc/photos_bloc.dart';
import 'package:photo/presentation/discover_overflow_behavior_page/discover_overflow_behavior_page.dart';
import 'package:photo/presentation/login_screen/bloc/login_bloc.dart';
import 'package:photo/presentation/register_step_1_screen/bloc/register_step_1_bloc.dart';
import 'package:photo/presentation/searchscreen/bloc/search_bloc.dart';
import 'package:photo/presentation/searchscreen/search_results_preserve_scroll_position_screen.dart';
import 'core/app_export.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final isAuth = await tokenService.init();
  final password = await tokenService.readData();
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PrefUtils().init()
  ]).then((value) {
    runApp(MyApp(isAuth, password));
  });
}

class MyApp extends StatelessWidget {
  const MyApp(
    this.isAuth,
    this.password,
  );
  final bool isAuth;
  final String password;
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => AuthRepo(),
            ),
            RepositoryProvider(
              create: (context) => LoginRepo(),
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ThemeBloc(
                  ThemeState(
                    themeType: PrefUtils().getThemeData(),
                  ),
                ),
              ),
              BlocProvider(
                create: (context) =>
                    AuthBloc(repo: RepositoryProvider.of<AuthRepo>(context)),
              ),
              BlocProvider(
                create: (context) =>
                    LoginBloc(repo: RepositoryProvider.of<LoginRepo>(context)),
              ),
              BlocProvider.value(
                value: ChatsBloc(apiService)..add(ChatsInitialEvent()),
                child: ChatsScreen.builder(context),
              ),
              BlocProvider.value(
                value: PhotosBloc(apiService)..add(PhotosInitialEvent()),
                child: DiscoverOverflowBehaviorPage.builder(context),
              ),
              BlocProvider.value(
                value: SearchBloc(apiService)..add(SearchInitialEvent()),
                child:
                    SearchResultsPreserveScrollPositionScreen.builder(context),
              ),
            ],
            child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return MaterialApp(
                  theme: theme,
                  title: 'photo',
                  navigatorKey: NavigatorService.navigatorKey,
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: [
                    AppLocalizationDelegate(),
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: [
                    Locale(
                      'en',
                      '',
                    ),
                  ],
                  initialRoute: isAuth
                      ? AppRoutes.discoverOverflowBehaviorContainerScreen
                      : AppRoutes.initialRoute,
                  routes: AppRoutes.routes,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
