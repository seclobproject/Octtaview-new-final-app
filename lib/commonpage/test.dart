import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../authentication/LandingPage.dart';

import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import '../resources/color.dart';


class MyAudioPlayer extends StatefulWidget {
  @override
  _MyAudioPlayerState createState() => _MyAudioPlayerState();
}

class _MyAudioPlayerState extends State<MyAudioPlayer> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _loadAudio();
    _audioPlayer.play();

    Timer(
      Duration(seconds: 6),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Landing_Page(title: 'landingpage'),
        ),
      ),
    );


  }

  Future<void> _loadAudio() async {
    await _audioPlayer.setAsset('assets/logo_octaview_sound.mp3');
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 9000,
      splashIconSize: 350,
      splash: 'assets/logo/logooctavia.png',
      nextScreen: Landing_Page(title: 'landingpage'),
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.scale,
      backgroundColor: sevensgbg,
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
