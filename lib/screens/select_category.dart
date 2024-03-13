import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:printlific/resources/assets.dart';
import 'package:printlific/screens/sub_categories_screen.dart';
import 'package:printlific/wigets/common_appbar.dart';
import 'package:printlific/wigets/common_button.dart';
import 'package:printlific/wigets/common_row.dart';

class SelectCategoryScreen extends StatefulWidget {
  const SelectCategoryScreen({super.key});

  @override
  State<SelectCategoryScreen> createState() => _SelectCategoryScreenState();
}

class _SelectCategoryScreenState extends State<SelectCategoryScreen> {

  var items = [
    {'images': Assets.backImage,'title': 'Canvas print', 'stitle': 'Upload photos, choose a size, and we’ll ship your beautiful canvas prints to your door.',
      'bcolor':'#FAF8C8'},
    {'images': Assets.backImage,'title': 'Plexi print', 'stitle': 'Upload photos, choose a size, and we’ll ship your beautiful canvas prints to your door.',
      'bcolor': '#DBEEF6' },
    {'images': Assets.backImage,'title': 'Art tray', 'stitle': 'Upload photos, choose a size, and we’ll ship your beautiful canvas prints to your door.',
      'bcolor': '#FBF1ED'},
    {'images': Assets.backImage,'title': 'Print on wood', 'stitle': 'Upload photos, choose a size, and we’ll ship your beautiful canvas prints to your door.',
      'bcolor': '#FAF8C8' },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // bottomNavigationBar: CommonButton(onTap: (){
      //
      // }, title: 'Next'),
      body: Stack(
        children: [
          CommonAppbar(title: '',),

          Column(
            children: [
             CommonRow(title: 'Select Category'),

              Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(
                     top: MediaQuery.of(context).size.height*0.000000000001,
                      left: 20,
                      right: 20
                  ),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 170,  //width of gridview in flutter
                          mainAxisExtent: 224,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 15,
                          childAspectRatio: 0.5
                      ),
                      itemCount: items.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index){
                        return getGridItems(index);
                      }),
                ),
              ),
            ],
          )


        ],
      ),
    );
  }

  getGridItems(int index) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(CupertinoPageRoute(builder: (context) => SubCategoryScreen()));
      },
      child: Container(
        child: Column(
          children: [
            Container(//logic for changing bordercolor on the basis of index value in gridview.builder in flutter
               height: 158,width: 158,
              decoration: ShapeDecoration(
                color: HexColor('#F4F4F4'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(width: 3,
                      color: HexColor(items[index]['bcolor'].toString()))
                )
              ),
              child: Container(
                 // height: 40,width: 107  ,
             // child: Image(image: AssetImage(items[index]['images'].toString()),),
               child: Image.asset(items[index]['images'].toString(),scale: 3.5,),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
             //  height: 13,width: 82,
              child: Text(items[index]['title'].toString(),textAlign: TextAlign.center,
                style: TextStyle(
                    color: HexColor('#020623'),
                    fontFamily: 'Montserrat Bold',
                    fontSize: 14,
                    fontWeight: FontWeight.w700
                ),
              ),
            ),

              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(items[index]['stitle'].toString(),textAlign: TextAlign.center,
                  style: TextStyle(
                      color: HexColor('#89807A'),
                      fontFamily: 'Montserrat Regular',
                      fontSize: 7,
                      fontWeight: FontWeight.w500,
                      height: 2,
                      letterSpacing: -0.00,
                  ),
                ),
              ),

          ],
        ),
      ),
    );
  }
}
