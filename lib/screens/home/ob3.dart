import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yugen/routes/router.gr.dart';

class OnBoardingPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: InkWell(
          onTap: () {
            ExtendedNavigator.root.popAndPush(Routes.rootScreen);
          },
          child: Center(
            child: Image.asset(
              'assets/ob3.png',
              fit: BoxFit.fitWidth,
            ),
          )),
    );
  }
}
