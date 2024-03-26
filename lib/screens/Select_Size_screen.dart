import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:printlific/screens/upload_image_screen.dart';
import 'package:printlific/wigets/common_appbar.dart';
import 'package:printlific/wigets/common_button.dart';
import 'package:printlific/wigets/common_row.dart';

import '../resources/assets.dart';

class SelectSizeScreen extends StatefulWidget {
  const SelectSizeScreen({super.key});

  @override
  State<SelectSizeScreen> createState() => _SelectSizeScreenState();
}

class _SelectSizeScreenState extends State<SelectSizeScreen> {


  String selected = "";
  int indexd = 0;
  var discList = [
    {'disc': '\$69.99'},
    {'disc': '\$69.99'},
  ];
//how to access the elements of list to show on display by using Text
  List<Map<String, dynamic>> itemsList = [
    {'isSelected': false, 'size': '4-piece 34x24','price': " \$380.00",'showPop': false,'show disc': false},
    {'isSelected': false, 'size': '4-piece 34x32','price': " \$420.00",'showPop': false,'show disc': false},
    {'isSelected': false, 'size': '5-piece 48x40','price': " \$480.00",'showPop': false,'show disc': false},
    {'isSelected': false, 'size': '5-piece 50x44','price': " \$488.00",'showPop': false,'show disc': false},
    {'isSelected': false, 'size': '6-piece 56x44','price': " \$610.00",'showPop': false,'show disc': false},
    {'isSelected': false, 'size': '6-piece 68x28','price': " \$588.00",'showPop': false,'show disc': false},
    {'isSelected': false, 'size': '6-piece 68x28','price': " \$89.00",'showPop': false,'show disc': true},
    {'isSelected': false, 'size': '7-piece 44x26','price': " \$99.00",'showPop': true,'show disc': false},
    {'isSelected': false, 'size': '9-piece 26x26','price': " \$109.00",'showPop': false,'show disc': false},
    {'isSelected': false, 'size': '9-piece 26x26','price': " \$57.00",'showPop': false,'show disc': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CommonButton(
        onTap: (){
          Navigator.of(context).push(CupertinoPageRoute(builder: (context) => UploadImageScreen()));
        },
        title: 'Next',
      ),
      body: Stack(
          children: [
            CommonAppbar(title: 'Select Size'),

            Container(
             // constraints: BoxConstraints.expand(),
              child: Column(
                children: [

                  CommonRow(title: 'Select Size'),

                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width*0.2,
                        left: 16,
                        bottom: 15
                    ),
                    child: Text('CHOOSE SIZE',
                      style: TextStyle(
                          fontFamily: 'Montserrat SemiBold',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 0.9
                      ),),
                  ),

                  Expanded(
                    child: Container(
                     // margin: EdgeInsets.only(bottom: 20),
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: itemsList.length,
                          itemBuilder: (context, index){
                            return getTable(index);
                          }),
                    ),
                  )
                ],
              ),
            )



          ],
        ),
    );
  }

  getTable(int index)  {
    bool isEven = index % 2 == 0;
    Color backgroundColor = isEven ? Colors.white70 : Colors.black12;
    return Container(
       margin: EdgeInsets.only(left: 16,right: 16,),
        child: Column(
          children: [
            Container(
              height: 45,
              //width: MediaQuery.of(context).size.width,
              decoration : ShapeDecoration(
                  color: isEven ? Colors.white10 : HexColor('#F4F4F4'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1),
                      side: BorderSide(width: 1,color: Colors.black12)
                  )
              ),
              child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  getCheckBox(index),
                   Container(
                    // alignment: Alignment.centerLeft,
                     child: Text(
                      itemsList[index]['size'].toString(),
                       style: TextStyle(
                         color: HexColor('#020623'),
                         fontFamily: 'Montserrat SemiBold',
                         fontSize: 13,
                         fontWeight: FontWeight.w500,
                         height: 2,
                         letterSpacing: -0.00,
                       ),
                     ),
                   ),

                  Container(
                   // alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      itemsList[index]['price'].toString(),
                        style: TextStyle(
                          color: HexColor('#020623'),
                          fontFamily: 'Montserrat SemiBold',
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          height: 2,
                          letterSpacing: -0.00,
                        )
                    ),
                  ),

                  itemsList[index]['showPop'] ?  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(
                        //left: 30
                    ),
                    child: Container(
                      width: 64,
                      height: 22,
                      margin: EdgeInsets.only(left: 30),
                      decoration: ShapeDecoration(
                        color: Color(0xff1999B5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1)
                        )
                      ),
                      child: Text('Popular!',textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat SemiBold',
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            height: 2,
                            letterSpacing: -0.00,
                          )
                      ),
                    ),
                  ): Container(),

                  itemsList[index]['show disc'] ? Container(
                    margin: EdgeInsets.only(
                        left: 30 ),
                    child: Text(
                      '\$69.99',
                        style: TextStyle(
                          color: Color(0xff1999B5),
                          fontFamily: 'Montserrat SemiBold',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          height: 2,
                          letterSpacing: -0.00,
                        )
                    ),
                  ): Container()

                ],
              ),
            )
          ],
        )
    );
     }

  getCheckBox(int index) {
    return Container(
      alignment: Alignment.topLeft,
      child: Checkbox(//how to give border width in checkbox in flutter
        checkColor: Colors.white,
        shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
        ),
        fillColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return const Color(0xff1999B5);
              }
              return Colors.white;
            }),
        side: const BorderSide(
          color: Colors.black12,
          width: 1,
        ),
        value: itemsList[index]['isSelected'],
        onChanged: (bool? value) {
          setState(() {
            for(var element in itemsList){
              element['isSelected'] = false;
            }
            itemsList[index]['isSelected'] = value;
            selected = "${itemsList[index]['size']} , ${itemsList[index]['price']} ${itemsList[index]['isSelected']}";
            print('CheckBox Selected: ${itemsList[index]['isSelected']}');
          });
        },
      ),
    );
  }





}
