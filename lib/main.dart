// @dart=2.9
import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yugen/routes/auth_guard.dart';
import 'package:yugen/routes/router.gr.dart';
import 'package:yugen/utils/colorGenerator.dart';

import 'bloc/navigation_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return HomeApp();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return HomeApp();
        }
        return Container();
      },
    );
  }

  Widget HomeApp() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(
          create: (BuildContext context) => NavigationBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Yugen App',
        theme: ThemeData(
          fontFamily: 'Worksans',
          brightness: Brightness.light,
          primarySwatch: createMaterialColor(Color(0xFF4454DE)),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        builder: ExtendedNavigator<AppRouter>(
          guards: [AuthGuard()],
          router: AppRouter(),
          initialRoute: Routes.rootScreen,
        ),
      ),
    );
  }
}
