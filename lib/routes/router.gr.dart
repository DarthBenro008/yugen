// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';

import '../screens/authentication.dart';
import '../screens/home/diary.dart';
import '../screens/home/home.dart';
import '../screens/home/root.dart';
import '../screens/home/teams.dart';
import '../screens/home/yugentimer.dart';

class Routes {
  static const String rootScreen = '/Root';
  static const String homeScreen = '/home-page';
  static const String authScreen = '/authentication-page';
  static const String diaryScreen = '/diary-page';
  static const String teamsScreen = '/teams-page';
  static const String yugenTimeScreen = '/yugen-timer-page';
  static const all = <String>{
    rootScreen,
    homeScreen,
    authScreen,
    diaryScreen,
    teamsScreen,
    yugenTimeScreen,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.rootScreen, page: Root),
    RouteDef(Routes.homeScreen, page: HomePage),
    RouteDef(Routes.authScreen, page: AuthenticationPage),
    RouteDef(Routes.diaryScreen, page: DiaryPage),
    RouteDef(Routes.teamsScreen, page: TeamsPage),
    RouteDef(Routes.yugenTimeScreen, page: YugenTimerPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    Root: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => Root(),
        settings: data,
      );
    },
    HomePage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => HomePage(),
        settings: data,
      );
    },
    AuthenticationPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => AuthenticationPage(),
        settings: data,
      );
    },
    DiaryPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => DiaryPage(),
        settings: data,
      );
    },
    TeamsPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => TeamsPage(),
        settings: data,
      );
    },
    YugenTimerPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => YugenTimerPage(),
        settings: data,
      );
    },
  };
}
