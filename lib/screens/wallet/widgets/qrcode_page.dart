import 'package:flutter/material.dart';

import '../../../resources/color.dart';

class qrcodepage extends StatefulWidget {
  const qrcodepage({super.key});

  @override
  State<qrcodepage> createState() => _qrcodepageState();
}

class _qrcodepageState extends State<qrcodepage> {
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

          Center(
              child: Text("Enter your amount",style: TextStyle(fontSize: 12,color: bg1),)),

          SizedBox(height: 10,),

          Container(
            height: 30,
            width: 90,
            decoration: BoxDecoration(
                color: bottomtabclr,
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: Center(
              child: Text("200.00",style: TextStyle(
                color: bg1
              ),),
            ),
          ),

          SizedBox(height: 40,),


          Text("USDT.BEP20 Deposit = 100.88",style: TextStyle(fontSize: 14,color: bg1,fontWeight: FontWeight.w700),),


          SizedBox(height: 20,),
          
          
          Image.asset('assets/png/qrcode.png'),

          SizedBox(height: 20,),
          
          Text("(inducing base amount + Transaction fee)",style: TextStyle(color: bluegreay,fontSize: 12),),

          SizedBox(height: 20,),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 45,
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(
                  color: yellow
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("http://www.octtaview.com/index.html",style: TextStyle(color: bg1),),
                  SizedBox(width: 10,),
                  Container(
                    height: 20,
                    width: 45,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: yellow
                      ),
                        gradient: LinearGradient(
                          colors: [yellow, yellow2],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Center(child: Text("copy",style: TextStyle(fontSize: 12,color: bg1),)),
                  )
                ],
              ),
            ),
          ),

          SizedBox(height: 25,),
          
          
          Text("Transaction Number : TTCNI022000800594",style: TextStyle(fontSize: 12,color: bg1),),

          SizedBox(height: 40,),
          
          
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height:40,
              width: 400,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [yellow, yellow2], // Specify your gradient colors
                    begin: Alignment.topCenter, // Specify the alignment of the gradient (start from the left)
                    end: Alignment.bottomCenter, // Specify the alignment of the gradient (end at the right)
                  ),
                border: Border.all(
                  color: yellow
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Center(child: Text("Confirm Deposit",style: TextStyle(fontSize: 12,color: bg1,fontWeight: FontWeight.w700),)),
            ),
          ),

        ],
      ),
    );
  }
}
