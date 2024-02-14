import 'package:flutter/material.dart';
import 'package:octtaviewnew/screens/report/tabview/direct_income.dart';
import 'package:octtaviewnew/screens/report/tabview/level_income.dart';
import 'package:octtaviewnew/screens/report/tabview/roi_income.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../resources/color.dart';
import '../../services/profile_service.dart';
import '../../services/report_service.dart';
import '../../support/logger.dart';
import 'package:flutter_svg/flutter_svg.dart';


class reportpage extends StatefulWidget {
  const reportpage({super.key});

  @override
  State<reportpage> createState() => _reportpageState();
}

class _reportpageState extends State<reportpage> {

  String? selectedValue;
  String? selectedValue1;

  var userid;
  var transationreportdata;
  bool _isLoading = true;

  var profilelist;
  var status = 'ROIIncome';




  Future _transationReport() async {
    var response = await ReportService.directIncome();
    log.i('My Trasation report Details... $response');
    setState(() {
      transationreportdata = response;
    });
  }

  Future _initLoad() async {
    await Future.wait(
      [
        _transationReport(),
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

  final List<String> items = [
    'Direct Income',
    'Level Income ',
    'ROI Income',
  ];

  final List<String> numberitems = [
    '1',
    '2',
    '3',
    '4',
  ];


  @override
  Widget build(BuildContext context) {


    return  DefaultTabController(
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
            "Report",
            style: TextStyle(color: yellow, fontSize: 16),
          ),
          elevation: 0,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.yellow, // Replace with your color
            tabs: [
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Direct Income", style: TextStyle(color: bg1)),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Level Income", style: TextStyle(color: bg1)),
                ),
              ),

              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("ROI Income", style: TextStyle(color: bg1)),
                ),
              ),
            ],
          ),
        ),
        body: _isLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : (transationreportdata['userStatus'] == "pending" && transationreportdata.isEmpty)
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
            : (transationreportdata['userStatus'] == "pending")
            ? Center(
          child: Text(
            "User status is pending.",
            style: TextStyle(color: Colors.red),
          ),
        )
            : (transationreportdata['directIncome'].isEmpty)
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

            directincome(),

            levelroi(),

            roiincome()

          ],
        ),


      ),
    );
  }
}

