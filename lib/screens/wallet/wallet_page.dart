import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octtaviewnew/screens/wallet/widgets/addwallet_amount.dart';
import '../../resources/color.dart';

class walletpage extends StatefulWidget {
  const walletpage({super.key});

  @override
  State<walletpage> createState() => _walletpageState();
}

class _walletpageState extends State<walletpage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: sevensgbg,
      appBar: AppBar(
        backgroundColor: sevensgbg,
        title: Text("Wallet", style: TextStyle(color: yellow2, fontSize: 18)),
      ),
      body: Column(

        children: [
          SizedBox(height: 10,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 150,
              width: 400,
              decoration: BoxDecoration(
                color: bottomtabclr,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),

              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 35,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10,),
                            child: Text("Wallet Amount",style: TextStyle(color: bg1,fontSize: 10),),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10,),
                            child: Text("₹100.00",style: TextStyle(color: textcolor2,fontSize: 20,fontWeight: FontWeight.w700),),
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 35,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10,),
                            child: Text("Total Referral Amount",style: TextStyle(color: bg1,fontSize: 10),),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10,),
                            child: Text("₹50.00",style: TextStyle(color: textcolor2,fontSize: 20,fontWeight: FontWeight.w700),),
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 35,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10,),
                            child: Text("Total Daily Bonus",style: TextStyle(color: bg1,fontSize: 10),),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10,),
                            child: Text("₹0.2",style: TextStyle(color: textcolor2,fontSize: 20,fontWeight: FontWeight.w700),),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 10,),
                  
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Submit the request, and within  48\nhour , the funds were credited to \nyour account",
                          style: TextStyle(color: btnttext,fontSize: 8),),

                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => addwalletamount()));
                          },
                          child: Container(
                            height: 20,
                            // width: 120,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [yellow, yellow2], // Specify your gradient colors
                                  begin: Alignment.topCenter, // Specify the alignment of the gradient (start from the left)
                                  end: Alignment.bottomCenter, // Specify the alignment of the gradient (end at the right)
                                ),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                children: [
                                  Text("Request withdrawal money",style: TextStyle(fontSize: 7,color: btnttext),),
                                  SizedBox(width: 5,),
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      color: textcolor2,
                                      borderRadius: BorderRadius.all(Radius.circular(100))
                                    ),
                                    child: Icon(
                                        Icons.arrow_drop_down_outlined,
                                      color: bg1,
                                      size: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          SizedBox(height: 10,),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text("Withdrawal History",style: TextStyle(color: bg1,fontWeight: FontWeight.w600),)),
          ),

          SizedBox(height: 10,),

          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [yellow, yellow2], // Specify your gradient colors
                                    begin: Alignment.topCenter, // Specify the alignment of the gradient (start from the left)
                                    end: Alignment.bottomCenter, // Specify the alignment of the gradient (end at the right)
                                  ),
                                borderRadius: BorderRadius.all(Radius.circular(5)),

                              ),

                              child: SvgPicture.asset(
                                'assets/svg/arrowtop.svg',
                                width: 10,
                                height: 10,
                                  fit: BoxFit.scaleDown

                              ),
                            ),

                            SizedBox(width: 10,),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Occt123",style: TextStyle(color: bg1,fontSize: 10),),
                                Text("Faizy",style: TextStyle(color: bg1,fontSize: 10)),
                              ],
                            ),

                            Expanded(child: SizedBox()),


                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("₹500",style: TextStyle(color: bg1,fontSize: 17),),

                                Container(
                                  height: 12,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [yellow, yellow2], // Specify your gradient colors
                                        begin: Alignment.topCenter, // Specify the alignment of the gradient (start from the left)
                                        end: Alignment.bottomCenter, // Specify the alignment of the gradient (end at the right)
                                      ),
                                    borderRadius: BorderRadius.all(Radius.circular(5))
                                  ),
                                  child: Center(child: Text("Pending",style: TextStyle(fontSize: 7,color: bg1),)),
                                ),


                              ],
                            ),




                          ],
                        ),
                        
                        Align(
                            alignment:Alignment.topLeft,
                            child: Text("26 October 2023 10:30 PM",style: TextStyle(color: btnttext,fontSize: 9),))
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



