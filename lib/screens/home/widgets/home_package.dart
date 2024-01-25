import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../resources/color.dart';
import '../../../services/home_service.dart';
import '../../../support/logger.dart';
import '../../wallet/widgets/qrcode_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class packages extends StatefulWidget {
  const packages({super.key});

  @override
  State<packages> createState() => _packagesState();
}

class _packagesState extends State<packages> {


  var userid;
  var packagedata;
  bool _isLoading = true;

  Future _Homedetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');
    var response = await HomeService.Getpackage();
    log.i('package data Show.. $response');
    setState(() {
      packagedata = response;

    });
  }

  Future _initLoad() async {
    await Future.wait(
      [
        _Homedetails()
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
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: bg1, //change your color here

        ),
        backgroundColor: sevensgbg,
        title: Text("Package", style: TextStyle(color: yellow2, fontSize: 18)),
      ),

      body:  _isLoading
          ?  Center(
          child:CircularProgressIndicator()
      )
          : Column(
        children: [

          SizedBox(height: 10,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 120,
              width: 400,
              decoration: BoxDecoration(
                  color: bottomtabclr,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),

              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Package Name     :  ",style: TextStyle(color: bg1,fontSize: 10),),
                        Text(
                          packagedata['packagename'] ?? 'No Data',
                          style: TextStyle(
                            color: packagedata['packagename'] != null ? btnttext : Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                          ),
                        ),


                        Expanded(child: SizedBox()),
                        
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const qrcodepage()),
                            );
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [yellow, yellow2], // Specify your gradient colors
                                  begin: Alignment.topCenter, // Specify the alignment of the gradient (start from the left)
                                  end: Alignment.bottomCenter, // Specify the alignment of the gradient (end at the right)
                                ),
                              borderRadius: BorderRadius.all(Radius.circular(100))
                            ),

                            child: SvgPicture.asset(
                              "assets/svg/arrowdown.svg",
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        )
                        
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Package Amount  :  ",style: TextStyle(color: bg1,fontSize: 10),),
                        Text(packagedata['totalCapitalAmount'].toString(),style: TextStyle(color: btnttext,fontSize: 19,fontWeight: FontWeight.w700),),
                        Expanded(child: SizedBox()),
                        Text("Add Fund",style: TextStyle(color: btnttext,fontSize: 10),),
                      ],
                    ),




                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 20,),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text("Transaction History",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15,color: bg1),)),
          ),

          SizedBox(height: 20,),

          Expanded(
            child: ListView.builder(
                itemCount: packagedata['addFundHistory'].length,
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
                                    width:68,
                                    height: 15,
                                    child: Text(packagedata['addFundHistory'][index]['createdAt'],style: TextStyle(color: btnttext,fontSize: 10))),
                                Text("10:30 PM",style: TextStyle(color: btnttext,fontSize: 10)),
                              ],
                            ),
                            Text(packagedata['addFundHistory'][index]['transactionCode'],style: TextStyle(color: btnttext,fontSize: 10)),
                            Text(packagedata['addFundHistory'][index]['topUpAmount'].toString(),style: TextStyle(color: btnttext,fontSize: 10)),

                            Container(
                              height: 20,
                              width: 50,
                              decoration: BoxDecoration(
                                color: greendark,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Center(child: Text(packagedata['addFundHistory'][index]['status'],style: TextStyle(fontSize: 8,color: bg1),)),
                            )
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
