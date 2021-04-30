import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yugen/routes/auth_guard.dart';
import 'package:yugen/routes/router.gr.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final _appRouter = AppRouter(authGuard: AuthGuard());

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
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
