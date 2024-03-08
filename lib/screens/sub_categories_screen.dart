import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:printlific/screens/Select_Size_screen.dart';
import 'package:printlific/wigets/common_appbar.dart';
import 'package:printlific/wigets/common_button.dart';

import '../resources/assets.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen({super.key});

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {

  var listItems = [
    {'images': Assets.firstImage,'title': 'Single panel frame only','stitle': 'Upload photos, choose a size, and we’ll ship your beautiful canvas prints to your door.' },
    {'images': Assets.secondImage,'title': 'Gallery wall','stitle': 'Upload photos, choose a size, and we’ll ship your beautiful canvas prints to your door.' },
    {'images': Assets.thirdImage,'title': 'Split canvas','stitle': 'Upload photos, choose a size, and we’ll ship your beautiful canvas prints to your door.' },
    {'images': Assets.firstImage,'title': 'Rolled in a tube','stitle': 'Upload photos, choose a size, and we’ll ship your beautiful canvas prints to your door.' },
    {'images': Assets.firstImage,'title': 'Rolled in a tube','stitle': 'Upload photos, choose a size, and we’ll ship your beautiful canvas prints to your door.' },
    {'images': Assets.firstImage,'title': 'Rolled in a tube','stitle': 'Upload photos, choose a size, and we’ll ship your beautiful canvas prints to your door.' },
    {'images': Assets.firstImage,'title': 'Rolled in a tube','stitle': 'Upload photos, choose a size, and we’ll ship your beautiful canvas prints to your door.' },
    {'images': Assets.firstImage,'title': 'Rolled in a tube','stitle': 'Upload photos, choose a size, and we’ll ship your beautiful canvas prints to your door.' },
    {'images': Assets.firstImage,'title': 'Rolled in a tube','stitle': 'Upload photos, choose a size, and we’ll ship your beautiful canvas prints to your door.' },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CommonButton(onTap: (){
        Navigator.of(context).push(CupertinoPageRoute(builder: (context) => SelectSizeScreen()));
      }, title: 'Next'),
      body: Stack(
        children: [
          CommonAppbar(title: 'Select sub categories'),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height*0.079
            ),
            child: ListView.builder(
              itemCount: listItems.length,
                itemBuilder: (context, index){
              return getListItems(index);
            }),
          ),

        ],
      ),
    );
  }

  getListItems(int index)  {
    return Container(
      height: 121,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
          top: 12,right: 15,left: 15
      ),
      decoration: ShapeDecoration(
        color: Color(0xffF4F4F4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        )
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
               Container(
                 margin: EdgeInsets.only(right: 15,left: 20),
                 child: Image(image: AssetImage(listItems[index]['images'].toString()),
                    height: 70,width: 108,
                 ),
               ),

                Expanded(
                  child: Container(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [

                         Container(
                             child: Text(listItems[index]['title'].toString(),
                               style: TextStyle(
                                   color: HexColor('#020623'),
                                   fontFamily: 'Montserrat Bold',
                                   fontSize: 14,
                                   fontWeight: FontWeight.w700,
                                    //height: 1,
                               ),
                             ),
                           ),


                          Container(
                             margin: EdgeInsets.only(top: 5),
                             child: Text(listItems[index]['stitle'].toString(),textAlign: TextAlign.start,
                               style: TextStyle(
                                 color: HexColor('#89807A'),
                                 fontFamily: 'Montserrat Regular',
                                 fontSize: 7,
                                 fontWeight: FontWeight.w500,
                                 height: 2,
                                 letterSpacing: 0.5,
                               ),
                             ),
                           ),


                       ],
                     ),
                   ),
                ),




          ],
        ),
      ),
    );
  }

}
