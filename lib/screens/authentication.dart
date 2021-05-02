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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Image.asset(
                  'assets/auth.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.center,
                child: Text("One Tap Login and setup!"),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 80),
                width: 100,
                height: 100,
                child: InkWell(
                  onTap: () async {
                    User? user =
                        await Authentication.signInWithGoogle(context: context);
                    if (user != null) {
                      ExtendedNavigator.root.popAndPush(Routes.rootScreen);
                    }
                  },
                  child: Container(
                    width: 100,
                    height: 300,
                    child: Image.asset(
                      'assets/gsign.png',
                      fit: BoxFit.fitWidth,
                    ),
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
