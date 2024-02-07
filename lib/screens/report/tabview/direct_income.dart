import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:octtaviewnew/resources/color.dart';

import '../../../services/report_service.dart';
import '../../../support/logger.dart';

class directincome extends StatefulWidget {
  const directincome({super.key});

  @override
  State<directincome> createState() => _directincomeState();
}

class _directincomeState extends State<directincome> {


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




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sevensgbg,
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Column(
        children: [

          SizedBox(height: 20,),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(

              children: [

                Text("Date", style: TextStyle(color: bg1, fontSize: 10)),
                SizedBox(width: 130,),
                Text("Transaction Code", style: TextStyle(color: bg1, fontSize: 10)),

                Expanded(child: SizedBox()),

                Text("Level Amount", style: TextStyle(color: bg1, fontSize: 10)),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(color: bg1, thickness: 0.5),
          ),

          Expanded(
            child: ListView.builder(
                itemCount: transationreportdata['directIncome'].length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20),
                    child: Column(

                      children: [
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 70,
                                  height: 15,
                                  child: Text(
                                    transationreportdata['directIncome'][index]['createdAt'] ?? '',
                                    style: TextStyle(color: btnttext, fontSize: 10),
                                  ),
                                ),
                                // Text("10:30 PM",style: TextStyle(color: btnttext,fontSize: 10)),
                              ],
                            ),
                            Text(transationreportdata['directIncome'][index]['transactionCode'] ?? 'no data',style: TextStyle(color: btnttext,fontSize: 10)),
                            Container(
                                child: Text(transationreportdata['directIncome'][index]['amountCredited'].toString() ?? 'no data',style: TextStyle(color: btnttext,fontSize: 10))),

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
