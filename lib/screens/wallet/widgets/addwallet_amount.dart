import 'package:flutter/material.dart';
import 'package:octtaviewnew/screens/wallet/widgets/qrcode_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../navigation/bottom_navigation.dart';
import '../../../resources/color.dart';
import '../../../services/wallet_service.dart';
import '../../../support/logger.dart';

class addwalletamount extends StatefulWidget {
  const addwalletamount({super.key});

  @override
  State<addwalletamount> createState() => _addwalletamountState();
}

class _addwalletamountState extends State<addwalletamount> {

  var userid;
  var walletdata;
  bool isLoading = false;

  String? amount;
  bool hidePassword = true;
  String? transactionPassword;
  String? walletUrl;
  bool isButtonDisabled = true;

  TextEditingController _amountController = TextEditingController();
  double enteredAmount = 0.0;


  Future addmoney() async {
    try {
      setState(() {});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      userid = prefs.getString('userid');
      var reqData = {
        'amount': enteredAmount,
        'transactionPassword': transactionPassword,
        'walletWithdrawUrl': walletUrl,
      };
      print(reqData);

      var response = await WalletService.addwalletamount(reqData);
      log.i('add money  . $response');

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => Bottomnav()),
      // );
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

    if (enteredAmount == null || enteredAmount == 0) {
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


  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set the initial value of the TextField to the reduced amount
    amountController.text = (enteredAmount * 0.96).toStringAsFixed(2);
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
                controller: _amountController,
                keyboardType: TextInputType.number,
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
                    enteredAmount = double.tryParse(text) ?? 0.0;
                  });
                },
                style: TextStyle(color: bg1,fontSize: 14), // Change this to your desired color
              ),
            ),
          ),

          SizedBox(height: 10,),


          Text(
            '4% Reduced Amount: ${(enteredAmount * 0.96).toStringAsFixed(2)}', // Calculate the reduced amount
            style: TextStyle(color:yellow, fontSize: 16), // Change this to your desired color
          ),

          SizedBox(height: 10,),




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
                          child: Text("Confirm Deposit",style: TextStyle(fontSize: 14,color: bg1),))
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
