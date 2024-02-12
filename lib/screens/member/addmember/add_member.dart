import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../navigation/bottom_navigation.dart';
import '../../../resources/color.dart';
import '../../../services/member_service.dart';
import '../../../support/logger.dart';

class addmember extends StatefulWidget {
  const addmember({super.key});

  @override
  State<addmember> createState() => _addmemberState();
}

class _addmemberState extends State<addmember> {


  var userid;
  var packagedropdownvalue;
  bool hidePassword = true;
  bool hidePassword1 = true;
  bool isButtonDisabled = true;
  bool isLoading = false;


  List package = [];

  String? username;
  String? email;
  String? phone;
  String? address;
  String? password;
  String? tnxpassword;


  Future addmember() async {
    try {
      setState(() {});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      userid = prefs.getString('userid');
      var reqData = {
        'username': username,
        'email': email,
        'phone': phone,
        "address": address,
        "transactionPassword":tnxpassword,
        "password": password,
      };
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Member Add Successfully'),
      ));
      var response = await MemberService.addmember(reqData);
      log.i('add member create . $response');

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => Bottomnav()),
      // );
    } catch (error) {
      // Handle specific error cases
      if (error.toString().contains("User already exists!")) {
        // Show a SnackBar or AlertDialog to inform the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User already exists!'),
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        // Handle other errors or rethrow them if not handled here
        throw ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User already exists!'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }


  void updateButtonState() {
    setState(() {
      isButtonDisabled = username == null ||
          email == null ||
          phone == null ||
          address == null ||
          password == null ||
          tnxpassword == null ||
          packagedropdownvalue == null;
    });
  }

  bool validateForm() {
    if (username == null || username!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid name'),
          duration: Duration(seconds: 3),
        ),
      );
      return false;
    }

    if (email == null ||
        !RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
            .hasMatch(email!)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid email address'),
          duration: Duration(seconds: 3),
        ),
      );
      return false;
    }

    if (phone == null || phone!.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Phone number must be at least 10 numbers long'),
          duration: Duration(seconds: 3),
        ),
      );
      return false;
    }

    if (address == null || address!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid address'),
          duration: Duration(seconds: 3),
        ),
      );
      return false;
    }


    if (password == null || password!.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password must be at least 6 characters long'),
          duration: Duration(seconds: 3),
        ),
      );
      return false;
    }

    if (tnxpassword == null || tnxpassword!.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password must be at least 6 characters long'),
          duration: Duration(seconds: 3),
        ),
      );
      return false;
    }

    return true;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sevensgbg,
      appBar: AppBar(
        backgroundColor: sevensgbg,
        title: Text("Add member", style: TextStyle(color: yellow2, fontSize: 18)),
      ),
      body:Column(
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
                  hintText: 'Name',
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
                    username=text;
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
                  hintText: 'Email ID',
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
                    email=text;
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
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Phone Number',
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
                    phone=text;
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
                  hintText: 'Address',
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
                    address=text;
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

                  hintText: 'Password',
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
                    password=text;
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
                obscureText: hidePassword1,
                decoration: InputDecoration(

                  hintText: 'Transaction Password',
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
                    tnxpassword=text;
                  });
                },
                style: TextStyle(color: bg1,fontSize: 14),
              ),
            ),
          ),

          SizedBox(height: 20,),

          

          // GestureDetector(
          //   onTap: (){
          //     // Navigator.of(context).push(MaterialPageRoute(builder: (context) => qrcodepage()));
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 20),
          //     child: Container(
          //         height: 45,
          //         width: 400,
          //         decoration: BoxDecoration(
          //             gradient: LinearGradient(
          //               colors: [yellow, yellow2], // Specify your gradient colors
          //               begin: Alignment.topCenter, // Specify the alignment of the gradient (start from the left)
          //               end: Alignment.bottomCenter, // Specify the alignment of the gradient (end at the right)
          //             ),
          //             border: Border.all(color:yellow ),
          //             borderRadius: BorderRadius.all(Radius.circular(10))
          //         ),
          //         child:Center(
          //             child: Text("Submit",style: TextStyle(fontSize: 14,color: bg1),))
          //     ),
          //   ),
          // ),


          InkWell(
            onTap: () {
              if (validateForm()) {
                // Set isLoading to true to show the loader
                setState(() {
                  isLoading = true;
                });

                // Perform your asynchronous operation, for example, createleave()
                addmember().then((result) {
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
                          child: Text("Submit",style: TextStyle(fontSize: 14,color: bg1),))
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
