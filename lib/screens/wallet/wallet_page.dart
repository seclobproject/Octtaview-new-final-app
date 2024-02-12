import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:octtaviewnew/screens/wallet/widgets/addwallet_amount.dart';
import '../../navigation/bottom_navigation.dart';
import '../../resources/color.dart';
import '../../services/profile_service.dart';
import '../../services/wallet_service.dart';
import '../../support/logger.dart';
import 'package:flutter_svg/flutter_svg.dart';


class walletpage extends StatefulWidget {
  const walletpage({super.key});

  @override
  State<walletpage> createState() => _walletpageState();
}

class _walletpageState extends State<walletpage> {

  var userid;
  var walletdata;
  var profilelist;
  bool _isLoading = true;

  String? amount;
  String? transactionPassword;
  String? walletUrl;
  bool isButtonDisabled = true;


  Future _Walletdetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');
    var response = await WalletService.WalletServiceData();
    log.i('Wallet data List.. $response');
    setState(() {
      walletdata = response;
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

  Future addmoney() async {
    try {
      setState(() {});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      userid = prefs.getString('userid');
      var reqData = {
        'amount': amount,
        'transactionPassword': transactionPassword,
        'walletUrl': walletUrl,
      };

      var response = await WalletService.addwalletamount(reqData);
      log.i('add money  . $response');

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Bottomnav()),
      );
    } catch (error) {
      // Handle specific error cases
      if (error.toString().contains("Money send failed")) {
        // Show a SnackBar or AlertDialog to inform the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Money send failed'),
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        // Handle other errors or rethrow them if not handled here
        throw ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Internal Server Error'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }


  void updateButtonState() {
    setState(() {
      isButtonDisabled = transactionPassword == null ||
          amount == null;

    });
  }

  bool validateForm() {


    if (transactionPassword == null || transactionPassword!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid transactionPassword'),
          duration: Duration(seconds: 3),
        ),
      );
      return false;
    }

    if (amount == null || amount!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid amount number'),
          duration: Duration(seconds: 3),
        ),
      );
      return false;
    }

    if (walletUrl == null || walletUrl!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid walletUrl'),
          duration: Duration(seconds: 3),
        ),
      );
      return false;
    }



    return true;
  }




  Future _initLoad() async {
    await Future.wait(
      [
        _Walletdetails(),
        _profileapi()
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
      appBar: AppBar(
        backgroundColor: sevensgbg,
        title: Text("Wallet", style: TextStyle(color: yellow2, fontSize: 18)),
      ),
      body:  _isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : (walletdata['userStatus'] == "pending" && walletdata.isEmpty)
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
          : (walletdata['userStatus'] == "pending")
          ? Center(
        child: Text(
          "User status is pending.",
          style: TextStyle(color: Colors.red),
        ),
      )
          : (walletdata.isEmpty)
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/nouser.png',
              height: 100,
            ),
            SizedBox(height: 10,),
            Text("No User Found !",style: TextStyle(color: bg1,fontSize: 20,fontWeight: FontWeight.w700),)
          ],
        ),
      )
          :Column(

        children: [
          SizedBox(height: 10,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 150,
              width: 400,
              decoration: BoxDecoration(
                color: bottomtabclr,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),

              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 35,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10,),
                            child: Text("Wallet Amount",style: TextStyle(color: bg1,fontSize: 10),),
                          ),
                          Container(
                            width: 100,
                            height: 30,
                            child: Padding(

                              padding: EdgeInsets.symmetric(horizontal: 10,),
                              child: Text('\$${walletdata['walletAmount'].toString()}',style: TextStyle(color: textcolor2,fontSize: 20,fontWeight: FontWeight.w700),),
                            ),
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 35,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10,),
                            child: Text("Total Referral Amount",style: TextStyle(color: bg1,fontSize: 10),),
                          ),
                          Padding(

                            padding: EdgeInsets.symmetric(horizontal: 10,),
                            child: Text('\$${walletdata['totalRefferalAmount'].toString()}',style: TextStyle(color: textcolor2,fontSize: 20,fontWeight: FontWeight.w700),),
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 35,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10,),
                            child: Text("Total Daily Bonus",style: TextStyle(color: bg1,fontSize: 10),),
                          ),
                          Padding(

                            padding: EdgeInsets.symmetric(horizontal: 10,),
                            child: Text( '\$${walletdata['totalDailyBonus'].toString()}',style: TextStyle(color: textcolor2,fontSize: 20,fontWeight: FontWeight.w700),),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 10,),
                  
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Submit the request, and within  48\nhour , the funds were credited to \nyour account",
                          style: TextStyle(color: btnttext,fontSize: 8),),

                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => addwalletamount()));
                          },
                          child: Container(
                            height: 20,
                            // width: 120,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [yellow, yellow2], // Specify your gradient colors
                                  begin: Alignment.topCenter, // Specify the alignment of the gradient (start from the left)
                                  end: Alignment.bottomCenter, // Specify the alignment of the gradient (end at the right)
                                ),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                children: [
                                  Text("Request withdrawal money",style: TextStyle(fontSize: 7,color: btnttext),),
                                  SizedBox(width: 5,),
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      color: textcolor2,
                                      borderRadius: BorderRadius.all(Radius.circular(100))
                                    ),
                                    child: Icon(
                                        Icons.arrow_drop_down_outlined,
                                      color: bg1,
                                      size: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          SizedBox(height: 10,),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text("Withdrawal History",style: TextStyle(color: bg1,fontWeight: FontWeight.w600),)),
          ),

          SizedBox(height: 10,),

          Expanded(
            child: ListView.builder(
                itemCount: walletdata['walletWithdrawHistory'].length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [yellow, yellow2], // Specify your gradient colors
                                    begin: Alignment.topCenter, // Specify the alignment of the gradient (start from the left)
                                    end: Alignment.bottomCenter, // Specify the alignment of the gradient (end at the right)
                                  ),
                                borderRadius: BorderRadius.all(Radius.circular(5)),

                              ),

                              child: SvgPicture.asset(
                                'assets/svg/arrowtop.svg',
                                width: 10,
                                height: 10,
                                  fit: BoxFit.scaleDown

                              ),
                            ),

                            SizedBox(width: 10,),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(walletdata['walletWithdrawHistory'][index]['tnxID'],style: TextStyle(color: bg1,fontSize: 10),),



                                Text(walletdata['walletWithdrawHistory'][index]['walletUrl'],style: TextStyle(color: bg1,fontSize: 10)),
                              ],
                            ),

                            Expanded(child: SizedBox()),


                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [


                                Text('\$${walletdata['walletWithdrawHistory'][index]['withdrawAmount'].toString()}',style: TextStyle(color: bg1,fontSize: 17),),

                                Container(
                                  height: 12,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [yellow, yellow2], // Specify your gradient colors
                                        begin: Alignment.topCenter, // Specify the alignment of the gradient (start from the left)
                                        end: Alignment.bottomCenter, // Specify the alignment of the gradient (end at the right)
                                      ),
                                    borderRadius: BorderRadius.all(Radius.circular(5))
                                  ),
                                  child: Center(child: Text(walletdata['walletWithdrawHistory'][index]['status'],style: TextStyle(fontSize: 7,color: bg1),)),
                                ),


                              ],
                            ),




                          ],
                        ),
                        
                        Align(
                            alignment:Alignment.topLeft,
                            child: Container(
                                width:60,
                                height:10,
                                child: Text(walletdata['walletWithdrawHistory'][index]['createdAt'],style: TextStyle(color: btnttext,fontSize: 9),)))
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



