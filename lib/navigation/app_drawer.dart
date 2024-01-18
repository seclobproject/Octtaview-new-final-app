import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/color.dart';

class appdrawer extends StatefulWidget {
  const appdrawer({super.key});

  @override
  State<appdrawer> createState() => _appdrawerState();
}

class _appdrawerState extends State<appdrawer> {

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: bottomtacolor,
      width: 240,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20)),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [



        ],
      ),
    );
  }
}


