import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../resources/color.dart';
import '../../../services/member_service.dart';
import '../../../support/logger.dart';
import '../addmember/add_member.dart';


class tableveltwo extends StatefulWidget {
   tableveltwo({super.key});

  @override
  State<tableveltwo> createState() => _tableveltwoState();
}

class _tableveltwoState extends State<tableveltwo> {


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
          itemCount: memberdata['child2'].length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
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
                                  child: Text("Sponcer Id",style: TextStyle(color: bg1,fontSize: 10),),
                                ),
                                SizedBox(height: 5,),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 20,),
                                  child: Text(memberdata['sponserId'],style: TextStyle(color: bg1,fontSize: 10),),
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
                                  child: Text( memberdata['child2'][index]['username'],style: TextStyle(color: bg1,fontSize: 10),),
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
                                      child: Center(child: Text(memberdata['child2'][index]['packageName'],style: TextStyle(color: btnttext,fontSize: 10),)),
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
                                      child: Text( memberdata['child2'][index]['address'],style: TextStyle(color: btnttext,fontSize: 10),)),
                                ],
                              ),
                              Column(
                                children: [
                                  SizedBox(height: 10,),
                                  Text("Phone Number",style: TextStyle(color: bg1,fontSize: 10),),
                                  SizedBox(height: 5,),
                                  Text(memberdata['child2'][index]['phone'].toString(),style: TextStyle(color: btnttext,fontSize: 10),),
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
                                  Text(memberdata['child2'][index]['email'],style: TextStyle(color: btnttext,fontSize: 10)),
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



