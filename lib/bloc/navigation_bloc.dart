import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yugen/models/tab.dart';
import 'package:yugen/routes/router.gr.dart';

class NavigationBloc extends Bloc<int, int> {
  NavigationBloc() : super(NavigationTabs.first);

  @override
  Stream<int> mapEventToState(int event) async* {
    yield event;
  }

  final tabs = const <NavigationTab>[
    NavigationTab(
      name: 'Home',
      icon: Icon(Icons.store),
      initialRoute: Routes.homeScreen,
    ),
    NavigationTab(
      name: 'Diary',
      icon: Icon(Icons.account_balance),
      initialRoute: Routes.diaryScreen,
    ),
    NavigationTab(
      name: "Teams",
      icon: Icon(Icons.receipt),
      initialRoute: Routes.teamsScreen,
    ),
    NavigationTab(
      name: 'Yugen Timer',
      icon: Icon(Icons.settings),
      initialRoute: Routes.yugenTimeScreen,
    ),
  ];

  Future<bool> onWillPop() async {
    final currentNavigatorState = ExtendedNavigator.named(tabs[state].name);

    if (currentNavigatorState.canPop()) {
      currentNavigatorState.pop();
    } else {
      if (state == NavigationTabs.first) {
        SystemNavigator.pop();
        return true;
      } else {
        add(NavigationTabs.first);
      }
    }

    return false;
  }
}

class NavigationTabs {
  /// Default constructor is private because this class will be only used for
  /// static fields and you should not instantiate it.
  NavigationTabs._();

  static const first = 0;
  static const second = 1;
  static const third = 2;
}
