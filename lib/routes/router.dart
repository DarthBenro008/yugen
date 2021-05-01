import 'package:auto_route/auto_route_annotations.dart';
import 'package:yugen/screens/authentication.dart';
import 'package:yugen/screens/home/diary.dart';
import 'package:yugen/screens/home/home.dart';
import 'package:yugen/screens/home/root.dart';
import 'package:yugen/screens/home/teams.dart';
import 'package:yugen/screens/home/yugentimer.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AdaptiveRoute(page: Root, name: "rootScreen"),
  AdaptiveRoute(page: HomePage, name: "homeScreen"),
  AdaptiveRoute(page: AuthenticationPage, name: "authScreen"),
  AdaptiveRoute(page: DiaryPage, name: "diaryScreen"),
  AdaptiveRoute(page: TeamsPage, name: "teamsScreen"),
  AdaptiveRoute(page: YugenTimerPage, name: "yugenTimeScreen"),

])
class $AppRouter {}
