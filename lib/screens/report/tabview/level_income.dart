import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../resources/color.dart';
import '../../../services/report_service.dart';
import '../../../support/logger.dart';
import 'levels/level_1.dart';
import 'levels/level_2.dart';
import 'levels/level_3.dart';

class levelroi extends StatefulWidget {
  const levelroi({super.key});

  @override
  State<levelroi> createState() => _levelroiState();
}

class _levelroiState extends State<levelroi> {


  String? selectedValue;
  String? selectedValue1;

  var userid;
  var transationreportdata;
  bool _isLoading = true;

  var profilelist;
  var status = 'ROIIncome';




  Future _transationReport() async {
    var response = await ReportService.levelDetails();
    log.i('My Level report Details... $response');
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




  @override
  Widget build(BuildContext context) {
    // return  Scaffold(
    //   backgroundColor: sevensgbg,
    //   body: _isLoading
    //       ? Center(
    //     child: CircularProgressIndicator(),
    //   )
    //       : Column(
    //     children: [
    //
    //       SizedBox(height: 20,),
    //
    //       // Expanded(
    //       //   child: ListView.builder(
    //       //       itemCount: transationreportdata['level1Income'].length,
    //       //       itemBuilder: (BuildContext context, int index) {
    //       //         return Padding(
    //       //           padding:  EdgeInsets.symmetric(horizontal: 20),
    //       //           child: Column(
    //       //             children: [
    //       //               SizedBox(height: 5,),
    //       //               Row(
    //       //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       //                 children: [
    //       //                   Text("${index + 1}",style: TextStyle(color: btnttext,fontSize: 10),),
    //       //                   Column(
    //       //                     crossAxisAlignment: CrossAxisAlignment.start,
    //       //                     children: [
    //       //                       Container(
    //       //                         width: 70,
    //       //                         height: 15,
    //       //                         child: Text(
    //       //                           transationreportdata['level1Income'][index]['createdAt'] ?? '',
    //       //                           style: TextStyle(color: btnttext, fontSize: 10),
    //       //                         ),
    //       //                       ),
    //       //                       Text("10:30 PM",style: TextStyle(color: btnttext,fontSize: 10)),
    //       //                     ],
    //       //                   ),
    //       //                   Text(transationreportdata['level1Income'][index]['userID'] ?? 'no data',style: TextStyle(color: btnttext,fontSize: 10)),
    //       //                   Container(
    //       //                       width: 100,
    //       //                       child: Text(transationreportdata['level1Income'][index]['capitalAmount'].toString() ?? 'no data',style: TextStyle(color: btnttext,fontSize: 10))),
    //       //
    //       //                 ],
    //       //               ),
    //       //               SizedBox(height: 5,),
    //       //               Divider(
    //       //                 color: btnttext,
    //       //                 thickness: .3,
    //       //               ),
    //       //             ],
    //       //           ),
    //       //         );
    //       //       }),
    //       // ),
    //
    //
    //
    //
    //     ],
    //   ),
    //
    // );

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: yellow2, // Replace with your color

        body: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.yellow, // Replace with your color
              tabs: [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Level One", style: TextStyle(color: btnttext)),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Level Two", style: TextStyle(color: btnttext)),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Level Three", style: TextStyle(color: btnttext)),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  levelone(),
                  leveltwo(),
                  levelthree(),
                ],
              ),
            ),
          ],
        ),
      ),
    );


  }
}
