import 'package:flutter/material.dart';

import '../../../../resources/color.dart';
import '../../../../services/report_service.dart';
import '../../../../support/logger.dart';

class leveltwo extends StatefulWidget {
  const leveltwo({super.key});

  @override
  State<leveltwo> createState() => _leveltwoState();
}

class _leveltwoState extends State<leveltwo> {

  var userid;
  var levelonedata;
  bool _isLoading = true;

  var profilelist;
  var status = 'ROIIncome';




  Future _transationReport() async {
    var response = await ReportService.levetwo();
    log.i('Level two history $response');
    setState(() {
      levelonedata = response;
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
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text("User ID", style: TextStyle(color: bg1, fontSize: 10)),
                SizedBox(width: 120,),
                Text("Capital Amount", style: TextStyle(color: bg1, fontSize: 10)),

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
            child: levelonedata != null && levelonedata['level2Income'] != null
                ? ListView.builder(
              itemCount: levelonedata['level2Income'].length,
              itemBuilder: (BuildContext context, int index) {
                var userData = levelonedata['level2Income'][index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userData['userID'] ?? 'No data',
                                style: TextStyle(color: btnttext, fontSize: 10),
                              ),
                            ],
                          ),
                          Text(
                            userData['capitalAmount']?.toString() ?? 'No data',
                            style: TextStyle(color: btnttext, fontSize: 10),
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            child: Text(
                              userData['LevelAmountCredited']?.toString() ?? 'No data',
                              style: TextStyle(color: btnttext, fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Divider(
                        color: btnttext,
                        thickness: 0.3,
                      ),
                    ],
                  ),
                );
              },
            )
                : Center(child: Text("No data",style: TextStyle(color: bg1),)),
          ),

        ],
      ),


    );
  }
}
