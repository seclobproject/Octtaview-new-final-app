import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resources/color.dart';

class verificationpage extends StatefulWidget {
  const verificationpage({super.key});

  @override
  State<verificationpage> createState() => _verificationpageState();
}

class _verificationpageState extends State<verificationpage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: sevensgbg,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Align(
            alignment: Alignment.center,
            child: Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                gradient: LinearGradient(
                  colors: [yellow, yellow2],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Image.asset(
                'assets/png/upload.png',
                height: 10,
                width: 10,

              ),
            ),
          ),

          SizedBox(height: 20,),


          Text("National ID Card  or Driving License Upload ",style: TextStyle(fontSize: 12,color: bg1),),


          SizedBox(height: 50,),

          InkWell(
            onTap: (){
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Bottomnav()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 40,
                width: 400,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [yellow, yellow2], // Specify your gradient colors
                    begin: Alignment.topCenter, // Specify the alignment of the gradient (start from the left)
                    end: Alignment.bottomCenter, // Specify the alignment of the gradient (end at the right)
                  ),
                  borderRadius: BorderRadius.circular(10), // Optional: Add borderRadius to round the corners
                ),
                child: Center(
                    child: Text("LOGIN",style: TextStyle(fontSize: 12,color: bg1),)),
              ),
            ),
          ),


        ],
      ),

    );
  }
}
