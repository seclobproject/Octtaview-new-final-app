import 'package:flutter/material.dart';
import 'package:octtaviewnew/screens/wallet/widgets/qrcode_page.dart';

import '../../../resources/color.dart';

class addwalletamount extends StatefulWidget {
  const addwalletamount({super.key});

  @override
  State<addwalletamount> createState() => _addwalletamountState();
}

class _addwalletamountState extends State<addwalletamount> {
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
                  hintText: 'Service Charge 4% deducted',
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
                  hintText: 'Total Amount',
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

                ),
                style: TextStyle(color: bg1,fontSize: 14),
              ),
            ),
          ),

          SizedBox(height: 40,),

          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => qrcodepage()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
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
            ),
          ),


        ],
      ),
    );
  }
}
