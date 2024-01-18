import 'package:flutter/material.dart';

import '../../resources/color.dart';

class reportpage extends StatefulWidget {
  const reportpage({super.key});

  @override
  State<reportpage> createState() => _reportpageState();
}

class _reportpageState extends State<reportpage> {
  @override
  Widget build(BuildContext context) {

    final List<String> items = [
      'Direct Income',
      'Level Income ',
      'ROI Income',
    ];

    final List<String> numberitems = [
      '1',
      '2',
      '3',
      '4',
    ];

    String? selectedValue;
    String? selectedValue1;



    return  Scaffold(
      backgroundColor: sevensgbg,
      appBar: AppBar(
        backgroundColor: sevensgbg,
        title: Text("Report", style: TextStyle(color: yellow2, fontSize: 18)),
      ),
      body: Column(
        children: [

          SizedBox(height: 10,),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20),
            child: Container(
           decoration: BoxDecoration(
             color: bottomtabclr,
             borderRadius: BorderRadius.all(Radius.circular(10))
           ),
              height: 35,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: Text(
                      'Direct Income',
                      style: TextStyle(
                        fontSize: 12,
                        color: bg1,
                      ),
                    ),
                    items: items
                        .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (String? value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    icon: Icon(
                      Icons.arrow_drop_down, // You can use any other icon as needed
                      color: bg1
                    ),

                    ),

                  ),
              ),
            ),
          ),

          SizedBox(height: 10,),

          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: bottomtabclr,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                height: 30,
                width: 100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: Text(
                        'Select Level',
                        style: TextStyle(
                          fontSize: 9,
                          color: bg1,
                        ),
                      ),
                      items: numberitems
                          .map((String numberitems) => DropdownMenuItem<String>(
                        value: numberitems,
                        child: Text(
                          numberitems,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ))
                          .toList(),
                      value: selectedValue1,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue1 = value;
                        });
                      },
                      icon: Icon(
                          Icons.arrow_drop_down, // You can use any other icon as needed
                          color: bg1,

                      ),

                    ),

                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 10,),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: btnttext,
              thickness: .3,
            ),
          ),







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

