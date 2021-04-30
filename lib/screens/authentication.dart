import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yugen/repository/authRepository.dart';
import 'package:yugen/screens/home.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Auth"),
              ElevatedButton(
                onPressed: () async {
                  User? user =
                      await Authentication.signInWithGoogle(context: context);
                  if (user != null) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  }
                },
                child: Text("Google Sign In"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
