import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../resources/color.dart';
import '../../wallet/widgets/qrcode_page.dart';

class packages extends StatefulWidget {
  const packages({super.key});

  @override
  State<packages> createState() => _packagesState();
}

class _packagesState extends State<packages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sevensgbg,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: bg1, //change your color here

        ),
        backgroundColor: sevensgbg,
        title: Text("Package", style: TextStyle(color: yellow2, fontSize: 18)),
      ),

      body: Column(
        children: [

          SizedBox(height: 10,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 120,
              width: 400,
              decoration: BoxDecoration(
                  color: bottomtabclr,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),

              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Wallet Amount     :  ",style: TextStyle(color: bg1,fontSize: 10),),
                        Text("Gold",style: TextStyle(color: btnttext,fontSize: 19,fontWeight: FontWeight.w700),),

                        Expanded(child: SizedBox()),
                        
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const qrcodepage()),
                            );
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [yellow, yellow2], // Specify your gradient colors
                                  begin: Alignment.topCenter, // Specify the alignment of the gradient (start from the left)
                                  end: Alignment.bottomCenter, // Specify the alignment of the gradient (end at the right)
                                ),
                              borderRadius: BorderRadius.all(Radius.circular(100))
                            ),

                            child: SvgPicture.asset(
                              "assets/svg/arrowdown.svg",
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        )
                        
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Package Amount  :  ",style: TextStyle(color: bg1,fontSize: 10),),
                        Text("₹200.00",style: TextStyle(color: btnttext,fontSize: 19,fontWeight: FontWeight.w700),),
                        Expanded(child: SizedBox()),
                        Text("Add Fund",style: TextStyle(color: btnttext,fontSize: 10),),
                      ],
                    ),




                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 20,),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text("Transaction History",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15,color: bg1),)),
          ),

          SizedBox(height: 20,),

          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${index + 1}",style: TextStyle(color: btnttext,fontSize: 10),),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("26 October 2023",style: TextStyle(color: btnttext,fontSize: 10)),
                                Text("10:30 PM",style: TextStyle(color: btnttext,fontSize: 10)),
                              ],
                            ),
                            Text("CPIA2XUZ8DJEXRS\nZWFZV1MS82Y",style: TextStyle(color: btnttext,fontSize: 10)),
                            Text("₹ 101.00",style: TextStyle(color: btnttext,fontSize: 10)),

                            Container(
                              height: 20,
                              width: 50,
                              decoration: BoxDecoration(
                                color: greendark,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Center(child: Text("Rejected",style: TextStyle(fontSize: 8,color: bg1),)),
                            )
                          ],
                        ),
                        SizedBox(height: 5,),
                        Divider(
                          color: btnttext,
                          thickness: .3,
                        ),
                      ],
                    ),
                  );
                }),
          ),


        ],
      ),

    );
  }
}