import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../navigation/bottom_navigation.dart';
import '../../../resources/color.dart';
import '../../../services/home_service.dart';
import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';


class verificationpage extends StatefulWidget {
  const verificationpage({super.key});

  @override
  State<verificationpage> createState() => _verificationpageState();
}

class _verificationpageState extends State<verificationpage> {

  String? imageUrl;
  var userid;
  String? refrence;


  Future<void> uploadImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = (prefs.getString('userid') ?? "");

    try {
      if (imageUrl == null) {
        print("Please pick an image first");
        return;
      }

      FormData formData = FormData.fromMap({
        'aadhaar': await MultipartFile.fromFile(imageUrl!),

      });

      var response = await HomeService.verificationimage(formData);

      if (response.statusCode == 200) {

        print("Image uploaded successfully");
        print(response.data);
      } else {
        // Handle error
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Bottomnav()),
        );
        print(response.statusCode);
        print(response.data);
      }
    } catch (e) {
      print("Exception during image upload: $e");
    }
  }




  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageUrl = pickedFile.path;
      });
    }
  }





  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: sevensgbg,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          GestureDetector(
            onTap: (){
              pickImage();
            },
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  gradient: LinearGradient(
                    colors: [yellow, yellow2],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Image.asset(
                  'assets/png/upload.png',
                  height: 10,
                  width: 10,

                ),
              ),
            ),
          ),

          SizedBox(height: 20,),


          Text("National ID Card  or Driving License Upload ",style: TextStyle(fontSize: 12,color: bg1),),


          SizedBox(height: 50,),


          SizedBox(height: 10,),


          imageUrl != null
              ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Image.file(File(imageUrl!)),
          )
              : Text("No image selected",style: TextStyle(color: Colors.red),),
          SizedBox(height: 10),

          InkWell(
            onTap: (){
              uploadImage();
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
                    child: Text("Upload",style: TextStyle(fontSize: 12,color: bg1),)),
              ),
            ),
          ),


        ],
      ),

    );
  }
}
