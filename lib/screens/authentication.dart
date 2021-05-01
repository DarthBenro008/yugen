import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yugen/repository/authRepository.dart';
import 'package:yugen/routes/router.gr.dart';

class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 300,
                color: Colors.amber,
              ),
              Text("One Tap Login and setup!"),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () async {
                  User? user =
                      await Authentication.signInWithGoogle(context: context);
                  if (user != null) {
                    ExtendedNavigator.root.popAndPush(Routes.homeScreen);
                  }
                },
                child: Container(
                  color: Color(0XFFEA606E),
                  width: 200,
                  height: 60,
                  child: Row(
                    children: [
                      Text("Get Started with"),
                      Spacer(),
                      Icon(
                        Icons.g_translate,
                        size: 35,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
