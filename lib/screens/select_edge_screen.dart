import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:printlific/resources/assets.dart';
import 'package:printlific/wigets/common_appbar.dart';
import 'package:printlific/wigets/common_button.dart';
import 'package:printlific/wigets/common_row.dart';

class SelectEdgeScreen extends StatefulWidget {
  const SelectEdgeScreen({super.key});

  @override
  State<SelectEdgeScreen> createState() => _SelectEdgeScreenState();
}

class _SelectEdgeScreenState extends State<SelectEdgeScreen> {

  var itemList = [
    {'image': Assets.gridfirst, 'title':'Thin gallery wrap (0.75)','stitle': 'Ipsum dolor sit amet, dolor elit consectetur this adipiscing.',
    'price': 'Starting at +\$17.00'},
    {'image': Assets.gridfirst, 'title':'Thick gallery wrap (1.5)','stitle': 'Ipsum dolor sit amet, dolor elit consectetur this adipiscing.',
      'price': 'Starting at +\$27.00'},
    {'image': Assets.gridSecond, 'title':'Framed canvas','stitle': 'Ipsum dolor sit amet, dolor elit consectetur this adipiscing.',
      'price': 'Starting at +\$35.00'},
    {'image': Assets.gridThird, 'title':'Rolled in a tube','stitle': 'Ipsum dolor sit amet, dolor elit consectetur this adipiscing.',
      'price': 'No Charge'},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CommonButton(
        onTap: (){},
        title: 'Next',
      ),
      body: Stack(
        children: [
          CommonAppbar(title: ''),
          Column(
            children: [
              CommonRow(title: 'Select Edge'),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height*0.02,
                      right: 16,left: 16),
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: itemList.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 170,
                        mainAxisExtent: 195,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 20
                      ),
                      itemBuilder: (context, index){
                        return getGridItems(index);
                      }
                  ),
                ),
              )
            ],
          )


        ],
      ),
    );
  }

  getGridItems(int index) {
        return Container(
          padding: EdgeInsets.all(5),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
              side: BorderSide(color: Colors.black12,width: 1)
            )
          ),
          child: Column(
            children: [
              Container(
                width: 151,height: 81,
                  child: Image(image: AssetImage(itemList[index]['image'].toString(),))),
              Container(
                width: 104,height: 40,
               child: Text(itemList[index]['title'].toString(),textAlign: TextAlign.center,
               style: TextStyle(
                 fontWeight: FontWeight.w600,
                 fontSize: 13,
                 fontFamily: 'Montserrat SemiBold',
                 color: Colors.black,
                 //letterSpacing: 0.9,
               ),
               ),
              ),
              Container(
                child: Text(itemList[index]['stitle'].toString(),textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 9,
                    fontFamily: 'Montserrat Regular',
                    color: HexColor('#7B7B7B'),
                    letterSpacing: 0.03,
                    height: 2
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(itemList[index]['price'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                    fontFamily: 'Montserrat Bold',
                    color: HexColor('#1F4CE0'),
                    decoration: TextDecoration.underline,
                    decorationColor: HexColor('#1F4CE0'), // Set the color here
                    decorationThickness: 2.0,
                    //letterSpacing: 0.01,
                  ),
                ),
              ),


            ],
          ),
        );
  }

}
