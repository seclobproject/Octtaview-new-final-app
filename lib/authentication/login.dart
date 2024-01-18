import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../navigation/bottom_navigation.dart';
import '../resources/color.dart';
import '../services/login_service.dart';
import '../support/logger.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {


  bool hidePassword = true;
  String? email;
  String? password;
  bool isLoading = false;
  bool _isLoader = false;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();



  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });
    var reqData = {
      'email': email,
      'password': password,
    };
    try {

      var response = await LoginService.login(reqData);

      if (response['sts'] == '01') {
        log.i('Login Success');
        print('User ID: ${response['id']}');
        print('Token: ${response['access_token']}');

        // _saveAndRedirectToHome(response['access_token'], response['name']);
        _saveAndRedirectToHome(response['access_token'],response['id']);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Login Success'),
        ));
        gotoHome();
      }

      else {
        // log.e('Login failed: ${response['msg']}');

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Login failed: ${response['msg']}'),
        ));

        loginpage();
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
        _isLoader = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Incorrect Username and password   '),
      ));
      log.e('Error during login: $error');
    }
  }



  void _saveAndRedirectToHome(usertoken, userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", usertoken);
    await prefs.setString("userid", userId);
  }

  gotoHome() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Bottomnav()),
            (route) => false);
  }




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: sevensgbg,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text("User ID",style: TextStyle(color: bg1),)),
          ),

        SizedBox(height: 10,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Enter your userid',
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
                email = text;
              });
            },
            style: TextStyle(color: bg1,fontSize: 14),
          ),
        ),

          SizedBox(height: 20,),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text("Password",style: TextStyle(color: bg1),)),
          ),

          SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter your password',
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
                  password = text;
                });
              },
              style: TextStyle(color: bg1,fontSize: 14),
            ),
          ),

          SizedBox(height: 40,),


          InkWell(
            onTap: (){
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Bottomnav()));

              _login();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 40,
                width: 400,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [yellow, yellow2], // Specify your gradient colors
                    begin: Alignment.topCenter, // Specify the alignment of the gradient (start from the left)
                    end: Alignment.bottomCenter, // Specify the alignment of the gradient (end at the right)
                  ),
                  borderRadius: BorderRadius.circular(10), // Optional: Add borderRadius to round the corners
                ),
                child: Center(
                    child: Text("LOGIN",style: TextStyle(fontSize: 12,color: bg1),)),
              ),
            ),
          )




        ],
      ),
    );
  }
}
