import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../authentication/login.dart';
import '../commonpage/profile.dart';
import '../commonpage/termsandcondition.dart';
import '../resources/color.dart';
import '../services/profile_service.dart';
import '../support/logger.dart';
import 'package:share_plus/share_plus.dart';

class appdrawer extends StatefulWidget {
  const appdrawer({super.key});

  @override
  State<appdrawer> createState() => _appdrawerState();
}

class _appdrawerState extends State<appdrawer> {


  var userid;
  var packagedata;
  bool _isLoading = true;
  var profilelist;


  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => loginpage()),
            (route) => false);
  }


  Future _profileapi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');
    var response = await ProfileService.ProfilePage();
    log.i('profile data Show.. $response');
    setState(() {
      profilelist = response;

    });
  }


  Future _initLoad() async {
    await Future.wait(
      [
        _profileapi()
      ],
    );
    _isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _initLoad();
    });
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


          profilelist != null && profilelist['userStatus'] == "pending"
              ? IgnorePointer(
            ignoring: true,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const profilepage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/profile.svg',
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 15,),
                      Text('Profile', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, color: textColor1),)
                    ],
                  ),
                ),
              ),
            ),
          )
              : InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const profilepage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/profile.svg',
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 15,),
                    Text('Profile', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, color: yellow2),)
                  ],
                ),
              ),
            ),
          ),



          profilelist != null && profilelist['userStatus'] == "pending"
              ? IgnorePointer(
            ignoring: true,
            child: InkWell(
              onTap: (){
                Share.share("https://octtaview.com/referal?id=6594f7921e76536671778ff7/$userid");
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

                      Text('Refer a friend',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color: textColor1),)
                    ],
                  ),
                ),
              ),
            ),
          )
              : InkWell(
            onTap: (){
              Share.share("https://octtaview.com/referal?id=6594f7921e76536671778ff7/$userid");
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



          profilelist != null && profilelist['userStatus'] == "pending"
              ? IgnorePointer(
            ignoring: true,
            child:  InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  MyApp()),
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

                      Text('Terms & Condition',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color: textColor1),)
                    ],
                  ),
                ),
              ),
            ),
          )
              :  InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  MyApp()),
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


