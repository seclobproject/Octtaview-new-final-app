import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../resources/color.dart';
import '../../services/report_service.dart';
import '../../support/logger.dart';

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

  var status = 'ROIIncome';

  Future _transationReport(status) async {
    var response = await ReportService.reportDetails(status);
    log.i('My Trasation report Details... $response');
    setState(() {
      transationreportdata = response;
    });
  }

  Future _initLoad() async {
    await Future.wait(
      [
        _transationReport(status)
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


    return  Scaffold(
      backgroundColor: sevensgbg,
      appBar: AppBar(
        backgroundColor: sevensgbg,
        title: Text("Report", style: TextStyle(color: yellow2, fontSize: 18)),
      ),
      body:   _isLoading
          ?  Center(
          child:CircularProgressIndicator()
      )
          :Column(
        children: [

          SizedBox(height: 10,),

          // Padding(
          //   padding:  EdgeInsets.symmetric(horizontal: 20),
          //   child: Container(
          //  decoration: BoxDecoration(
          //    color: bottomtabclr,
          //    borderRadius: BorderRadius.all(Radius.circular(10))
          //  ),
          //     height: 35,
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 20),
          //       child: DropdownButtonHideUnderline(
          //         child: DropdownButton<String>(
          //           isExpanded: true,
          //           hint: Text(
          //             'Direct Income',
          //             style: TextStyle(
          //               fontSize: 12,
          //               color: bg1,
          //             ),
          //           ),
          //           items: items
          //               .map((String item) => DropdownMenuItem<String>(
          //             value: item,
          //             child: Text(
          //               item,
          //               style: const TextStyle(
          //                 fontSize: 14,
          //                 color: btnttext
          //               ),
          //             ),
          //           ))
          //               .toList(),
          //           value: selectedValue,
          //           onChanged: (String? value) {
          //             setState(() {
          //               selectedValue = value;
          //             });
          //           },
          //           icon: Icon(
          //             Icons.arrow_drop_down, // You can use any other icon as needed
          //             color: bg1
          //           ),
          //
          //           ),
          //
          //         ),
          //     ),
          //   ),
          // ),



          GestureDetector(
            onTap: (){
              showDialog<String>(
                context: context,
                builder: (BuildContext context) =>
                    AlertDialog(
                      title:  Text('Select Data'),

                      content: Container(
                        color: bg1,
                        height: 150,
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  status = 'DirectIncome';
                                  _transationReport(status);
                                  Navigator.pop(context);
                                  print(status);
                                });
                              },
                              child: Text(
                                  'Direct Income'),
                            ),

                            Divider(),
                            SizedBox(height: 10,),
                            GestureDetector(
                              onTap: (){
                                status = 'LevelIncome';
                                _transationReport(status);
                                Navigator.pop(context);
                              },
                              child: Text(
                                  'Level Income'),
                            ),
                            Divider(),
                            SizedBox(height: 10,),
                            GestureDetector(
                              onTap: (){
                                status = 'ROIIncome';
                                _transationReport(status);
                                Navigator.pop(context);
                              },
                              child: Text(
                                  'ROI Income'),
                            ),

                          ],
                        ),
                      ),
                      actions: <Widget>[

                        // TextButton(
                        //   onPressed: () {
                        //
                        //     Navigator.pop(context);
                        //   },
                        //   child:  Text(
                        //     'Submit',
                        //     style: TextStyle(
                        //         color: greenpermanat),
                        //   ),
                        // ),
                      ],
                    ),
              );
            },

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 40,
                width: 400,
                 decoration: BoxDecoration(
                   color: bottomtabclr,
                   borderRadius: BorderRadius.all(Radius.circular(10))
                 ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Filtter",style: TextStyle(color: bg1),),
                      Icon(
                        Icons.archive_rounded,
                        color: bg1,
                        size: 20.0,
                        semanticLabel: 'filletr',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // SizedBox(height: 10,),
          //
          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: Padding(
          //     padding:  EdgeInsets.symmetric(horizontal: 20),
          //     child: Container(
          //       decoration: BoxDecoration(
          //           color: bottomtabclr,
          //           borderRadius: BorderRadius.all(Radius.circular(10))
          //       ),
          //       height: 30,
          //       width: 100,
          //       child: Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 10),
          //         child: DropdownButtonHideUnderline(
          //           child: DropdownButton<String>(
          //             hint: Text(
          //               'Select Level',
          //               style: TextStyle(
          //                 fontSize: 9,
          //                 color: bg1,
          //               ),
          //             ),
          //             items: numberitems
          //                 .map((String numberitems) => DropdownMenuItem<String>(
          //               value: numberitems,
          //               child: Text(
          //                 numberitems,
          //                 style: const TextStyle(
          //                   fontSize: 12,
          //                     color: btnttext
          //                 ),
          //               ),
          //             ))
          //                 .toList(),
          //             value: selectedValue1,
          //             onChanged: (String? value) {
          //               setState(() {
          //                 selectedValue1 = value;
          //               });
          //             },
          //             icon: Icon(
          //                 Icons.arrow_drop_down, // You can use any other icon as needed
          //                 color: bg1,
          //
          //             ),
          //
          //           ),
          //
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

          SizedBox(height: 10,),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: btnttext,
              thickness: .3,
            ),
          ),

          Expanded(
            child: ListView.builder(
                itemCount: transationreportdata['allTransactions'].length,
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
                                    transationreportdata['allTransactions'][index]['createdAt'] ?? '',
                                    style: TextStyle(color: btnttext, fontSize: 10),
                                  ),
                                ),
                                Text("10:30 PM",style: TextStyle(color: btnttext,fontSize: 10)),
                              ],
                            ),
                            Text(transationreportdata['allTransactions'][index]['transactionCode'] ?? 'no data',style: TextStyle(color: btnttext,fontSize: 10)),
                            Container(
                                width: 100,
                                child: Text(transationreportdata['allTransactions'][index]['amountCredited'].toString() ?? 'no data',style: TextStyle(color: btnttext,fontSize: 10))),

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

