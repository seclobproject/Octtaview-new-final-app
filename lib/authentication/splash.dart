import 'dart:async';
import 'package:flutter/material.dart';
import '../resources/color.dart';
import 'LandingPage.dart';
import 'login.dart';



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
            () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Landing_Page(
                    title: 'landingpage'
                ))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sevensgbg,
      body: Center(
        child: Image.asset(
          'assets/logo/logooctavia.png',
          width: 350, // Set the desired width
          height: 350, // Set the desired height
        ),
      ),
    );
  }
}
