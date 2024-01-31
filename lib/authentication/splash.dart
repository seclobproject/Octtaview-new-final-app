import 'dart:async';
import 'package:flutter/material.dart';
import '../resources/color.dart';
import 'LandingPage.dart';
import 'login.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Landing_Page(
                    title: 'landingpage'
                ))));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 5000,
        splashIconSize: 350,
        splash: 'assets/logo/logooctavia.png',
        nextScreen: Landing_Page(
            title: 'landingpage'
        ),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.scale,
        backgroundColor: sevensgbg);
  }
}
