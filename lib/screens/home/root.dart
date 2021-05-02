import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yugen/bloc/navigation_bloc.dart';
import 'package:yugen/routes/router.gr.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black, //or set color with: Color(0xFF0000FF)
    ));

    final bloc = BlocProvider.of<NavigationBloc>(context);

    return BlocBuilder<NavigationBloc, int>(
        cubit: bloc,
        builder: (context, state) {
          return WillPopScope(
            onWillPop: bloc.onWillPop,
            child: Scaffold(
              // backgroundColor: Color(0xFF5A8FDF),
              body: SafeArea(
                child: IndexedStack(
                  index: state,
                  children: List.generate(bloc.tabs.length, (index) {
                    final tab = bloc.tabs[index];
                    return TickerMode(
                      enabled: index == state,
                      child: Offstage(
                        offstage: index != state,
                        child: ExtendedNavigator(
                          initialRoute: tab.initialRoute,
                          name: tab.name,
                          router: AppRouter(),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              bottomNavigationBar: Container(
                color: Color(0xFF5A8FDF),
                child: BottomNavigationBar(
                  unselectedItemColor: Colors.white38,
                  backgroundColor: Colors.transparent,
                  selectedItemColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  elevation: 0.0,
                  onTap: bloc.add,
                  currentIndex: state,
                  items: bloc.tabs.map((tab) {
                    return BottomNavigationBarItem(
                      icon: tab.icon,
                      // icon: SvgPicture.asset("assets/${tab.icon}.svg",
                      //     semanticsLabel: 'BottomNavIcon'),
                      label: tab.name,
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        });
  }
}
