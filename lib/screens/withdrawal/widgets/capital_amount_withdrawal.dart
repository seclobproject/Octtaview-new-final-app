import 'package:flutter/material.dart';
import 'package:octtaviewnew/screens/wallet/widgets/qrcode_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../navigation/bottom_navigation.dart';
import '../../../resources/color.dart';
import '../../../services/capitalamount_service.dart';
import '../../../services/wallet_service.dart';
import '../../../support/logger.dart';

class capitalamountwithdrawals extends StatefulWidget {
  const capitalamountwithdrawals({super.key});

  @override
  State<capitalamountwithdrawals> createState() => _capitalamountwithdrawalsState();
}

class _capitalamountwithdrawalsState extends State<capitalamountwithdrawals> {

  var userid;
  var walletdata;
  bool isLoading = false;

  String? amount;
  bool hidePassword = true;
  String? transactionPassword;
  String? walletUrl;
  bool isButtonDisabled = true;


  // Future addmoney() async {
  //   try {
  //     setState(() {});
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     userid = prefs.getString('userid');
  //     var reqData = {
  //       'amount': amount,
  //       'transactionPassword': transactionPassword,
  //       'walletUrl': walletUrl,
  //     };
  //
  //     var response = await CapitalService.capitalamountwithdrawal(reqData);
  //     log.i('add money  . $response');
  //
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => Bottomnav()),
  //     );
  //   } catch (error) {
  //     // Handle specific error cases
  //     if (error.toString().contains("Money send failed")) {
  //       // Show a SnackBar or AlertDialog to inform the user
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Money send failed'),
  //           duration: Duration(seconds: 3),
  //         ),
  //       );
  //     } else {
  //       // Handle other errors or rethrow them if not handled here
  //       throw ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Withdraw only permitted after 90 days from the last fund addition'),
  //           duration: Duration(seconds: 3),
  //         ),
  //       );
  //     }
  //   }
  // }

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

      var response = await CapitalService.capitalamountwithdrawal(reqData);
      log.i('add money  . $response');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Capital Withdrawal Successfull'),
      ));

      if (response['success'] == false && response['statusCode'] == 401) {
        // Show a SnackBar or AlertDialog for wrong transaction password
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Wrong Transaction Password'),
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Bottomnav()),
        );
      }
    } catch (error) {
      // Handle other errors or rethrow them if not handled here
      if (error.toString().contains("Money send failed")) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Money send failed'),
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        throw ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Withdraw only permitted after 90 days from the last fund addition'),
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


    if (transactionPassword == null || transactionPassword!.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password must be at least 6 characters long'),
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


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: sevensgbg,
      appBar: AppBar(
        backgroundColor: sevensgbg,
        iconTheme: IconThemeData(
          color: bg1,
        ),
        title: Text("Capital Withdrawal", style: TextStyle(color: yellow2, fontSize: 18)),
      ),
      body: Column(
        children: [

          SizedBox(height: 20,),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                  color: bottomtabclr,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Amount',
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
          ),


          SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                  color: bottomtabclr,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Payment URL',
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
                    walletUrl=text;
                  });
                },
                style: TextStyle(color: bg1,fontSize: 14),
              ),
            ),
          ),

          SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                  color: bottomtabclr,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: TextField(
                obscureText: hidePassword,
                decoration: InputDecoration(
                  hintText: 'Transaction password',
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

                  suffixIcon: IconButton(
                    icon: hidePassword
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),

                ),

                onChanged: (text) {
                  setState(() {
                    transactionPassword=text;
                  });
                },
                style: TextStyle(color: bg1,fontSize: 14),
              ),
            ),
          ),

          SizedBox(height: 40,),

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
                          child: Text("Withdraw",style: TextStyle(fontSize: 14,color: bg1),))
                  ),

                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}
