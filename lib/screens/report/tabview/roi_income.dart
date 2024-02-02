import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../resources/color.dart';
import '../../../services/report_service.dart';
import '../../../support/logger.dart';

class roiincome extends StatefulWidget {
  const roiincome({super.key});

  @override
  State<roiincome> createState() => _roiincomeState();
}

class _roiincomeState extends State<roiincome> {


  String? selectedValue;
  String? selectedValue1;

  var userid;
  var transationreportdata;
  bool _isLoading = true;

  var profilelist;
  var status = 'ROIIncome';




  Future _transationReport() async {
    var response = await ReportService.roiDetails();
    log.i('My Roi report Details... $response');
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
    return  Scaffold(
      backgroundColor: sevensgbg,
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Column(
        children: [

          SizedBox(height: 20,),

          Expanded(
            child: ListView.builder(
                itemCount: transationreportdata['dailyROIHistory'].length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${index + 1}",style: TextStyle(color: btnttext,fontSize: 10),),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 70,
                                  height: 15,
                                  child: Text(
                                    transationreportdata['dailyROIHistory'][index]['createdAt'] ?? '',
                                    style: TextStyle(color: btnttext, fontSize: 10),
                                  ),
                                ),
                                Text("10:30 PM",style: TextStyle(color: btnttext,fontSize: 10)),
                              ],
                            ),
                            Text(transationreportdata['dailyROIHistory'][index]['name'] ?? 'no data',style: TextStyle(color: btnttext,fontSize: 10)),
                            Container(
                                width: 100,
                                child: Text(transationreportdata['dailyROIHistory'][index]['creditedAmount'].toString() ?? 'no data',style: TextStyle(color: btnttext,fontSize: 10))),

                          ],
                        ),
                        SizedBox(height: 5,),
                        Divider(
                          color: btnttext,
                          thickness: .3,
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),

    );
  }
}
