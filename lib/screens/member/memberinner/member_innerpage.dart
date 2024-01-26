import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../resources/color.dart';
import '../../../services/member_service.dart';
import '../../../support/logger.dart';
import '../addmember/add_member.dart';


class memberinnerpage extends StatefulWidget {
  memberinnerpage({super.key,required this.id});

  String? id;

  @override
  State<memberinnerpage> createState() => _memberinnerpageState();
}

class _memberinnerpageState extends State<memberinnerpage> {


  String userId='';


  bool _isLoading = true;
  var membersinnerpage;

  Future _memberinner() async {
    _isLoading=true;
    setState(() {
    });
    membersinnerpage=null;

    var response = await MemberService.memberslistinginner(userId);
    log.i('Product inner service. $response');
    setState(() {
      _isLoading = false;
      membersinnerpage = response.data;
      print("ProductInnerpage....$membersinnerpage");
    });
  }



  @override
  void initState() {
    userId=widget.id ??'';
    super.initState();
    _memberinner();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: sevensgbg,
        title: Text("Member Inner", style: TextStyle(color: yellow2, fontSize: 18)),
      ),

      backgroundColor: sevensgbg,

      body:  _isLoading
          ?  Center(
          child:CircularProgressIndicator()
      )
          :ListView.builder(
          itemCount: membersinnerpage['child1'].length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (){
                userId=membersinnerpage['child1'][index]['_id'];
                _memberinner();
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
                                    child: Text("Sponcer Id",style: TextStyle(color: bg1,fontSize: 10),),
                                  ),
                                  SizedBox(height: 5,),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20,),
                                    child: Text(membersinnerpage['sponserId'],style: TextStyle(color: bg1,fontSize: 10),),
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
                                    child: Text( membersinnerpage['child1'][index]['username'],style: TextStyle(color: bg1,fontSize: 10),),
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
                                        child: Center(child: Text(membersinnerpage['child1'][index]['packageName'],style: TextStyle(color: btnttext,fontSize: 10),)),
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
                                        child: Text( membersinnerpage['child1'][index]['address'],style: TextStyle(color: btnttext,fontSize: 10),)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(height: 10,),
                                    Text("Phone Number",style: TextStyle(color: bg1,fontSize: 10),),
                                    SizedBox(height: 5,),
                                    Text(membersinnerpage['child1'][index]['phone'].toString(),style: TextStyle(color: btnttext,fontSize: 10),),
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
                                    Text(membersinnerpage['child1'][index]['email'],style: TextStyle(color: btnttext,fontSize: 10)),
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


      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(Icons.add,color: btnttext,),
        backgroundColor: yellow,
        onPressed: () {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const addmember()),
            );
          });
        },
      ),


    );

  }
}



