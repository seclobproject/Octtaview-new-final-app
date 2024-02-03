import 'package:flutter/material.dart';
import 'package:octtaviewnew/resources/color.dart';



class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: sevensgbg,
        appBar: AppBar(
          backgroundColor: sevensgbg,
          title: Text(
            "Terms and Conditions",
            style: TextStyle(color: yellow, fontSize: 16),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
          child: PrivacyPolicyText(),
        ),
      ),
    );
  }
}

class PrivacyPolicyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Welcome to Octtaview, the Dubai-based smart contract binary system Company. '
          'Octtaview is committed to safeguarding your privacy. Our Privacy Policy '
          'protects your personal information. Your usage implies consent to these terms. '
          'Users are expected to uphold ethical standards. Misuse of our smart contract '
          'binary system for illegal activities is strictly prohibited. Octtaview reserves '
          'the right to suspend or terminate services for users violating these terms '
          'or engaging in harmful activities.',
      style: TextStyle(fontSize: 16.0,color: bg1),
    );
  }
}
