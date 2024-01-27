import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../authentication/login.dart';
import '../commonpage/profile.dart';
import '../resources/color.dart';

class appdrawer extends StatefulWidget {
  const appdrawer({super.key});

  @override
  State<appdrawer> createState() => _appdrawerState();
}

class _appdrawerState extends State<appdrawer> {


  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => loginpage()),
            (route) => false);
  }

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

          SizedBox(height: 100,),
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const profilepage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/logout.svg',
                      fit: BoxFit.cover,
                    ),

                    SizedBox(width: 15,),

                    Text('Profile',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color: yellow2),)
                  ],
                ),
              ),
            ),
          ),


          InkWell(
            onTap: (){

            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/logout.svg',
                      fit: BoxFit.cover,
                    ),

                    SizedBox(width: 15,),

                    Text('Refer a friend',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color: yellow2),)
                  ],
                ),
              ),
            ),
          ),

          InkWell(
            onTap: (){

            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/logout.svg',
                      fit: BoxFit.cover,
                    ),

                    SizedBox(width: 15,),

                    Text('Terms & Condition',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color: yellow2),)
                  ],
                ),
              ),
            ),
          ),


          InkWell(
            onTap: (){
              logout();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/logout.svg',
                      fit: BoxFit.cover,
                    ),

                    SizedBox(width: 15,),

                    Text('Logout',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color: yellow2),)
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}


