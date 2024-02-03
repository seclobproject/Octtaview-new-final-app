import 'package:flutter/material.dart';
import 'package:octtaviewnew/commonpage/termsandcondition.dart';
import 'package:octtaviewnew/commonpage/transaction_password.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../resources/color.dart';
import '../services/home_service.dart';
import '../services/profile_service.dart';
import '../support/logger.dart';

import 'package:flutter_svg/svg.dart';

import 'change_password.dart';



class profilepage extends StatefulWidget {
  const profilepage({super.key});

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {

  bool _isLoading = true;
  var profilepageapi;

  var userid;


  Future profilepage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = (prefs.getString('userid') ?? "");
    print("userid....$userid");
    var response = await ProfileService.ProfilePage();
    log.i('Profile page. $response');

    setState(() {
      profilepageapi = response;
    });
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initLoad();
  }

  Future _initLoad() async {
    await Future.wait(
      [
        profilepage()
      ],
    );
    _isLoading = false;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sevensgbg,
      appBar: AppBar(
        backgroundColor: sevensgbg,
        iconTheme: IconThemeData(
          color:bg1, //change your color here
        ),
        centerTitle: true,
        title: Text("profile",style: TextStyle(color: bg1,fontSize: 16),),

      ),
      body:   _isLoading
          ?  Center(
          child: CircularProgressIndicator()
      )
          :  Column(

        children: [

          SizedBox(height: 50,),


          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),

                ),
                child: Image.network("https://cdn-icons-png.flaticon.com/512/3135/3135715.png"),
              ),
            ),
          ),
          SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(profilepageapi['name'],style: TextStyle(color: bg1),),
                  Text(profilepageapi['email'],style: TextStyle(color: bg1)),
                  Text(profilepageapi['phone'].toString(),style: TextStyle(color: bg1)),
                ],
              ),
            ),
          ),

          SizedBox(height: 20,),



          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 126,
              width: 400,
              decoration: BoxDecoration(
                  color: yellow2,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const changepassword()),
                      );
                    },
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Change Password",style: TextStyle(color: bg1,fontWeight: FontWeight.w700,fontSize: 13),),
                    ),
                  ),

                  SizedBox(height: 10,),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const transactionpassword()),
                      );
                    },
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Transaction Password",style: TextStyle(color: bg1,fontWeight: FontWeight.w700,fontSize: 13),),
                    ),
                  ),

                  SizedBox(height: 10,),


                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  MyApps()),
                      );
                    },
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Terms & Conditions",style: TextStyle(color: bg1,fontWeight: FontWeight.w700,fontSize: 13),),
                    ),
                  ),

                ],
              ),
            ),
          )

        ],
      ),

    );
  }
}
