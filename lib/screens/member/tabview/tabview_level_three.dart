import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../resources/color.dart';
import '../../../services/member_service.dart';
import '../../../support/logger.dart';
import '../addmember/add_member.dart';


class tablevelthree extends StatefulWidget {
  tablevelthree({super.key});

  @override
  State<tablevelthree> createState() => _tablevelthreeState();
}

class _tablevelthreeState extends State<tablevelthree> {


  var userid;
  var memberdata;
  bool _isLoading = true;

  Future _Memberdetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');
    var response = await MemberService.Getmemberdata();
    log.i('Home data Show.. $response');
    setState(() {
      memberdata = response;

    });
  }

  Future _initLoad() async {
    await Future.wait(
      [
        _Memberdetails()
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

      body:  _isLoading
          ?  Center(
          child:CircularProgressIndicator()
      )
          :ListView.builder(
          itemCount: memberdata['child3'].length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (){

              },
              child: Column(
                children: [

                  SizedBox(height: 10,),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    child: Container(

                      width: 400,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color:yellow2
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  SizedBox(height: 10,),

                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20,),
                                    child: Text("Sponsor Id",style: TextStyle(color: bg1,fontSize: 10),),
                                  ),
                                  SizedBox(height: 5,),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20,),
                                    child: Text(memberdata['ownSponserId'],style: TextStyle(color: bg1,fontSize: 10),),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  SizedBox(height: 10,),

                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20,),
                                    child: Text("Name",style: TextStyle(color: bg1,fontSize: 10),),
                                  ),
                                  SizedBox(height: 5,),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20,),
                                    child: Text( memberdata['child3'][index]['username'],style: TextStyle(color: bg1,fontSize: 10),),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  SizedBox(height: 10,),

                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20,),
                                    child: Text("Package",style: TextStyle(color: bg1,fontSize: 10),),
                                  ),
                                  SizedBox(height: 5,),
                                  Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 20,),
                                      child: Container(
                                        height: 15,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          gradient: LinearGradient(
                                            colors: [yellow, yellow2], // Specify your gradient colors
                                            begin: Alignment.topCenter, // Specify the alignment of the gradient (start from the left)
                                            end: Alignment.bottomCenter, // Specify the alignment of the gradient (end at the right)
                                          ),
                                        ),
                                        child: Center(child: Text(memberdata['child3'][index]['packageName'],style: TextStyle(color: btnttext,fontSize: 10),)),
                                      )
                                  ),
                                ],
                              ),
                            ],
                          ),

                          SizedBox(height: 10,),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(
                              color: yellow2,
                            ),
                          ),


                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10,),
                                    Text("Address",style: TextStyle(color: bg1,fontSize: 10),),
                                    SizedBox(height: 5,),
                                    Container(
                                        width: 100,
                                        child: Text( memberdata['child3'][index]['address'],style: TextStyle(color: btnttext,fontSize: 10),)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(height: 10,),
                                    Text("Phone Number",style: TextStyle(color: bg1,fontSize: 10),),
                                    SizedBox(height: 5,),
                                    Text(maskPhoneNumber(memberdata['child3'][index]['phone'].toString()), style: TextStyle(color: btnttext, fontSize: 10)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(height: 10,),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 20,),
                                      child: Text("Email",style: TextStyle(color: bg1,fontSize: 10),),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(maskPhoneNumber(memberdata['child3'][index]['email'].toString()), style: TextStyle(color: btnttext, fontSize: 10)),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),


      // floatingActionButton: FloatingActionButton(
      //   // isExtended: true,
      //   child: Icon(Icons.add,color: btnttext,),
      //   backgroundColor: yellow,
      //   onPressed: () {
      //     setState(() {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => const addmember()),
      //       );
      //     });
      //   },
      // ),


    );

  }
}



String maskPhoneNumber(String phoneNumber) {
  // Define the number of characters to display before masking
  int visibleChars = 4;

  // Check if the phone number is not null and has enough characters
  if (phoneNumber != null && phoneNumber.length >= visibleChars) {

    String visiblePart = phoneNumber.substring(phoneNumber.length - visibleChars);

    // Create the masked part with stars
    String maskedPart = '*' * (phoneNumber.length - visibleChars);

    // Concatenate the visible and masked parts
    return '$maskedPart$visiblePart';
  } else {
    // Return the original phone number if it's null or too short
    return phoneNumber;
  }
}