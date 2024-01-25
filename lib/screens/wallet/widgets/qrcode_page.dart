import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../navigation/app_drawer.dart';
import '../../../navigation/bottom_navigation.dart';
import '../../../resources/color.dart';
import '../../../services/capitalamount_service.dart';
import '../../../support/logger.dart';
import '../../withdrawal/withdrawal_page.dart';

class qrcodepage extends StatefulWidget {
  const qrcodepage({super.key});

  @override
  State<qrcodepage> createState() => _qrcodepageState();
}

class _qrcodepageState extends State<qrcodepage> {


  var userid;
  bool hidePassword = true;
  bool isButtonDisabled = true;
  bool isLoading = false;




  List package = [];

  String? amount= '';
  String? transactionCode;


  Future addmoney() async {
    try {
      setState(() {});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      userid = prefs.getString('userid');
      var reqData = {
        'amount': amount,
        'transactionCode': transactionCode,
      };

      var response = await CapitalService.capitalamountsend(reqData);
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
      isButtonDisabled = transactionCode == null ||
          amount == null;

    });
  }

  bool validateForm() {


    if (transactionCode == null || transactionCode!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid transation number'),
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



    return true;
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: sevensgbg,
      appBar: AppBar(
        backgroundColor: sevensgbg,
        iconTheme: IconThemeData(
          color: bg1,
        ),
        title: Text("Withdrawal Fund", style: TextStyle(color: yellow2, fontSize: 18)),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 20,),

            Center(
                child: Text("Enter your amount",style: TextStyle(fontSize: 12,color: bg1),)),

            SizedBox(height: 10,),

            // Container(
            //   height: 30,
            //   width: 90,
            //   decoration: BoxDecoration(
            //       color: bottomtabclr,
            //       borderRadius: BorderRadius.all(Radius.circular(5))
            //   ),
            //   child: Center(
            //     child: Text("200.00",style: TextStyle(
            //       color: bg1
            //     ),),
            //   ),
            // ),

            Container(
              height: 40,
              width: 145,
              decoration: BoxDecoration(
                  color: bottomtabclr,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: TextField(
                decoration: InputDecoration(
                  // hintText: 'Enter your userid',
                  hintStyle: TextStyle(color: yellow),
                  contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: yellow, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: yellow),
                  ),

                ),
                onChanged: (text) {
                  setState(() {
                    amount=text;
                  });
                },
                style: TextStyle(color: bg1,fontSize: 14),
              ),
            ),

            SizedBox(height: 40,),


            Text(
              "USDT.BEP20 Deposit = ${amount != null ? '\$$amount' : '\$0'}",
              style: TextStyle(
                fontSize: 14,
                color: amount != null && amount != 0 ? bg1 : Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),


            SizedBox(height: 20,),
            
            
            Image.asset('assets/png/qrcode.png'),

            SizedBox(height: 20,),
            
            Text("(inducing base amount + Transaction fee)",style: TextStyle(color: bluegreay,fontSize: 12),),

            SizedBox(height: 20,),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 45,
                width: 400,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: yellow
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Copy text to clipboard
                        Clipboard.setData(ClipboardData(text: "TTXzewFCuXAFSPL9u9Z1ST1KGWSyj3MD6q"));
                        // You can add a feedback message if needed
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Text copied to clipboard')),
                        );
                      },
                      child: Text("TTXzewFCuXAFSPL9u9Z1ST1KGWSyj3MD6q", style: TextStyle(color: bg1, fontSize: 12)),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        border: Border.all(color: yellow),
                        gradient: LinearGradient(
                          colors: [yellow, yellow2],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: GestureDetector(
                        onTap: (){
                          Clipboard.setData(ClipboardData(text: "TTXzewFCuXAFSPL9u9Z1ST1KGWSyj3MD6q"));
                          // You can add a feedback message if needed
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Text copied to clipboard')),
                          );
                        },
                          child: Center(child: Text("copy", style: TextStyle(fontSize: 12, color: bg1)))),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 25,),
            
            
            // Text("Transaction Number : TTCNI022000800594",style: TextStyle(fontSize: 12,color: bg1),),



            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 50,

                decoration: BoxDecoration(
                    color: bottomtabclr,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Transaction Number',
                    hintStyle: TextStyle(color: yellow),
                    contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: yellow, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: yellow),
                    ),

                  ),

                  onChanged: (text) {
                    setState(() {
                      transactionCode = text;
                    });
                  },
                  style: TextStyle(color: bg1,fontSize: 14),
                ),
              ),
            ),

            SizedBox(height: 25,),
            



            InkWell(
              onTap: () {
                if (validateForm()) {
                  // Set isLoading to true to show the loader
                  setState(() {
                    isLoading = true;
                  });

                  // Perform your asynchronous operation, for example, createleave()
                  addmoney().then((result) {
                    // After the operation is complete, set isLoading to false
                    setState(() {
                      isLoading = false;
                    });

                    // Add a delay to keep the loader visible for a certain duration
                    Future.delayed(Duration(seconds: 2), () {
                      // After the delay, you can perform any additional actions if needed
                    });
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    Container(
                        height: 45,
                        width: 400,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [yellow, yellow2], // Specify your gradient colors
                              begin: Alignment.topCenter, // Specify the alignment of the gradient (start from the left)
                              end: Alignment.bottomCenter, // Specify the alignment of the gradient (end at the right)
                            ),
                            border: Border.all(color:yellow ),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child:Center(
                            child: Text("Confirm Deposit",style: TextStyle(fontSize: 14,color: bg1),))
                    ),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
