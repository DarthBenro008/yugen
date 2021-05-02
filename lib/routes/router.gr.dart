// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';

import '../screens/authentication.dart';
import '../screens/home/climb.dart';
import '../screens/home/diary.dart';
import '../screens/home/home.dart';
import '../screens/home/ob1.dart';
import '../screens/home/ob2.dart';
import '../screens/home/ob3.dart';
import '../screens/home/root.dart';
import '../screens/home/teams.dart';
import '../screens/home/yugentimer.dart';
import '../screens/tasks/addTask.dart';
import 'auth_guard.dart';

class Routes {
  static const String rootScreen = '/Root';
  static const String homeScreen = '/home-page';
  static const String authScreen = '/authentication-page';
  static const String diaryScreen = '/diary-page';
  static const String teamsScreen = '/teams-page';
  static const String climbPage = '/climb-page';
  static const String addTaskPage = '/add-task-page';
  static const String yugenTimeScreen = '/yugen-timer-page';
  static const String ob1Screen = '/on-boarding-page';
  static const String ob2Screen = '/on-boarding-page2';
  static const String ob3Screen = '/on-boarding-page3';
  static const all = <String>{
    rootScreen,
    homeScreen,
    authScreen,
    diaryScreen,
    teamsScreen,
    climbPage,
    addTaskPage,
    yugenTimeScreen,
    ob1Screen,
    ob2Screen,
    ob3Screen,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.rootScreen, page: Root, guards: [AuthGuard]),
    RouteDef(Routes.homeScreen, page: HomePage),
    RouteDef(Routes.authScreen, page: AuthenticationPage),
    RouteDef(Routes.diaryScreen, page: DiaryPage),
    RouteDef(Routes.teamsScreen, page: TeamsPage),
    RouteDef(Routes.climbPage, page: ClimbPage),
    RouteDef(Routes.addTaskPage, page: AddTaskPage),
    RouteDef(Routes.yugenTimeScreen, page: YugenTimerPage),
    RouteDef(Routes.ob1Screen, page: OnBoardingPage),
    RouteDef(Routes.ob2Screen, page: OnBoardingPage2),
    RouteDef(Routes.ob3Screen, page: OnBoardingPage3),
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
    ClimbPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ClimbPage(),
        settings: data,
      );
    },
    AddTaskPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => AddTaskPage(),
        settings: data,
      );
    },
    YugenTimerPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => YugenTimerPage(),
        settings: data,
      );
    },
    OnBoardingPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => OnBoardingPage(),
        settings: data,
      );
    },
    OnBoardingPage2: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => OnBoardingPage2(),
        settings: data,
      );
    },
    OnBoardingPage3: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => OnBoardingPage3(),
        settings: data,
      );
    },
  };
}
