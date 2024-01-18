import 'package:flutter/material.dart';

import '../../../resources/color.dart';

class addmember extends StatefulWidget {
  const addmember({super.key});

  @override
  State<addmember> createState() => _addmemberState();
}

class _addmemberState extends State<addmember> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sevensgbg,
      appBar: AppBar(
        backgroundColor: sevensgbg,
        title: Text("Add member", style: TextStyle(color: yellow2, fontSize: 18)),
      ),
      body: Column(
        children: [




        ],
      ),

    );
  }
}
