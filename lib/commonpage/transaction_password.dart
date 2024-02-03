import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../navigation/bottom_navigation.dart';
import '../resources/color.dart';
import '../services/profile_service.dart';
import '../support/logger.dart';

class transactionpassword extends StatefulWidget {
  const transactionpassword({super.key});

  @override
  State<transactionpassword> createState() => _transactionpasswordState();
}

class _transactionpasswordState extends State<transactionpassword> {



  var userid;
  var walletdata;
  bool isLoading = false;

  String? newPassword;
  bool isButtonDisabled = true;
  bool hidePassword1 = true;
  bool hidePassword = true;


  Future changetnxpassword() async {
    try {
      setState(() {});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      userid = prefs.getString('userid');
      var reqData = {
        'newPassword': newPassword,
      };

      var response = await ProfileService.changetransactionpassword(reqData);
      log.i('Change password . $response');

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Bottomnav()),
      );
    } catch (error) {
      // Handle specific error cases
      if (error.toString().contains("change password failed")) {
        // Show a SnackBar or AlertDialog to inform the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('change password failed'),
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
      isButtonDisabled = newPassword == null ;

    });
  }

  bool validateForm() {


    if (newPassword == null || newPassword!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid Password'),
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
          color:bg1, //change your color here
        ),
        centerTitle: true,
        title: Text("Change password",style: TextStyle(color: bg1,fontSize: 16),),

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
                obscureText: hidePassword1,
                decoration: InputDecoration(
                  hintText: 'New password',
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
                    icon: hidePassword1
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        hidePassword1 = !hidePassword1;
                      });
                    },
                  ),

                ),

                onChanged: (text) {
                  setState(() {
                    newPassword=text;
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
                  hintText: 'Confirm password',
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
                    newPassword=text;
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
                changetnxpassword().then((result) {
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
                          child: Text("Change Password",style: TextStyle(fontSize: 14,color: bg1),))
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
