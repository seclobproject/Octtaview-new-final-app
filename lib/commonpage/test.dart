import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Lottie.asset(
              'assets/animation.json',
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
