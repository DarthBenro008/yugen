import 'package:auto_route/auto_route_annotations.dart';
import 'package:yugen/screens/authentication.dart';
import 'package:yugen/screens/home/climb.dart';
import 'package:yugen/screens/home/diary.dart';
import 'package:yugen/screens/home/home.dart';
import 'package:yugen/screens/home/ob1.dart';
import 'package:yugen/screens/home/ob2.dart';
import 'package:yugen/screens/home/ob3.dart';
import 'package:yugen/screens/home/root.dart';
import 'package:yugen/screens/home/teams.dart';
import 'package:yugen/screens/home/yugentimer.dart';
import 'package:yugen/screens/tasks/addTask.dart';

import 'auth_guard.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AdaptiveRoute(page: Root, name: "rootScreen", guards: [AuthGuard]),
  AdaptiveRoute(page: HomePage, name: "homeScreen"),
  AdaptiveRoute(page: AuthenticationPage, name: "authScreen"),
  AdaptiveRoute(page: DiaryPage, name: "diaryScreen"),
  AdaptiveRoute(page: TeamsPage, name: "teamsScreen"),
  AdaptiveRoute(page: ClimbPage, name: "climbPage"),
  AdaptiveRoute(page: AddTaskPage, name: "addTaskPage"),
  AdaptiveRoute(page: YugenTimerPage, name: "yugenTimeScreen"),
  AdaptiveRoute(page: OnBoardingPage, name: "ob1Screen"),
  AdaptiveRoute(page: OnBoardingPage2, name: "ob2Screen"),
  AdaptiveRoute(page: OnBoardingPage3, name: "ob3Screen"),
])
class $AppRouter {}
