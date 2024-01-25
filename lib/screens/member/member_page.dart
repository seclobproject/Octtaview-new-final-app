import 'package:flutter/material.dart';
import 'package:octtaviewnew/screens/member/tabview/tabview_level_one.dart';
import 'package:octtaviewnew/screens/member/tabview/tabview_level_three.dart';
import 'package:octtaviewnew/screens/member/tabview/tabview_level_two.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../resources/color.dart';
import '../../services/member_service.dart';
import '../../support/logger.dart';
import 'addmember/add_member.dart';

class membertabpage extends StatefulWidget {
  membertabpage({super.key});

  @override
  State<membertabpage> createState() => _memberpageState();
}

class _memberpageState extends State<membertabpage> {


  var userid;
  var memberdata;
  bool _isLoading = true;

  Future _Memberdetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');
    var response = await MemberService.Getmemberdata();
    log.i('Home data Show.. $response');
    setState(() {
      memberdata = response;

    });
  }

  Future _initLoad() async {
    await Future.wait(
      [
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
        body:  _isLoading
            ? Center(
            child:CircularProgressIndicator()
        )
            : TabBarView(
          children: [

            memberpage(),

            tableveltwo(),

            tablevelthree()

          ],
        ),
      ),
    );

  }
}



