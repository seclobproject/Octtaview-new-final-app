import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../authentication/LandingPage.dart';

import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import '../resources/color.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
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




  // Future<void> _playAudio() async {
  //   try {
  //     // Print a message to indicate that the audio is being played
  //     print("Playing audio...");
  //
  //     // Use the `await` keyword to wait for the audio to finish playing
  //     await _audioPlayer.play('assets/audio/bgm.mp3', isLocal: true);
  //
  //     // Print a message when the audio has finished playing
  //     print("Audio playback completed.");
  //   } catch (e) {
  //     // Print an error message if there's an issue with audio playback
  //     print("Error playing audio: $e");
  //   }
  // }
  //
  // @override
  // void dispose() {
  //   // Dispose of the audio player to release resources
  //   _audioPlayer.dispose();
  //   super.dispose();
  // }

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





