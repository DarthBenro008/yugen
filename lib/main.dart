import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yugen/screens/authentication.dart';
import 'package:yugen/screens/home.dart';

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
        return HomeApp();
      },
    );
  }

  Widget HomeApp() {
    return MaterialApp(
      title: 'Yugen',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
      ),
      home: AuthenticationScreen(),
    );
  }
}
