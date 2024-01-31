import 'package:flutter/material.dart';
import 'package:octtaviewnew/screens/member/tabview/tabview_level_one.dart';
import 'package:octtaviewnew/screens/member/tabview/tabview_level_three.dart';
import 'package:octtaviewnew/screens/member/tabview/tabview_level_two.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../resources/color.dart';
import '../../services/member_service.dart';
import '../../services/profile_service.dart';
import '../../support/logger.dart';
import 'addmember/add_member.dart';
import 'package:flutter_svg/flutter_svg.dart';

class membertabpage extends StatefulWidget {
  membertabpage({super.key});

  @override
  State<membertabpage> createState() => _memberpageState();
}

class _memberpageState extends State<membertabpage> {


  var userid;
  var profilelist;
  bool _isLoading = true;
  var memberdata;


  Future _Memberdetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');
    var response = await MemberService.Getmemberdata();
    log.i('Home data Show.. $response');
    setState(() {
      memberdata = response;

    });
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
        _profileapi(),
        _Memberdetails()
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: sevensgbg, // Replace with your color
        appBar: AppBar(
          backgroundColor: sevensgbg, // Replace with your color
          iconTheme: IconThemeData(
            color: Colors.black, // Replace with your color
          ),
          centerTitle: true,
          title: Text(
            "Activated Pin",
            style: TextStyle(color: bg1, fontSize: 16),
          ),
          elevation: 0,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.yellow, // Replace with your color
            tabs: [
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("First level", style: TextStyle(color: bg1)),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Second Level", style: TextStyle(color: bg1)),
                ),
              ),

              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Third Level", style: TextStyle(color: bg1)),
                ),
              ),
            ],
          ),
        ),
        body: _isLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : (memberdata['userStatus'] == "pending" && memberdata.isEmpty)
            ? Center(
          child: Column(
            children: [
              SizedBox(height: 150,),
              SvgPicture.asset(
                'assets/svg/noactivation.svg',
                height: 200,
              ),
              SizedBox(height: 10,),

              Text("Activation\nPending..!!",
                style: TextStyle(color: bg1,fontSize: 25,fontWeight: FontWeight.w700),)
            ],
          ),
        )
            : (memberdata['userStatus'] == "pending")
            ? Center(
          child: Text(
            "User status is pending.",
            style: TextStyle(color: Colors.red),
          ),
        )
            : (memberdata['child1'].isEmpty)
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/png/nouser.png',
                height: 100,
              ),
              SizedBox(height: 10,),
              Text("No User Found !",style: TextStyle(color: bg1,fontSize: 20,fontWeight: FontWeight.w700),)
            ],
          ),
        )
            : TabBarView(
          children: [

            memberpage(),

            tableveltwo(),

            tablevelthree()

          ],
        ),

        floatingActionButton: FloatingActionButton(
          // isExtended: true,
          child: Icon(Icons.add,color: btnttext,),
          backgroundColor: yellow,
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const addmember()),
              );
            });
          },
        ),
      ),
    );

  }
}



