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
    {'images': Assets.grid1,'title': 'Canvas print', 'stitle': 'Upload photos, choose a size, and we’ll ship your beautiful canvas prints to your door.'},
    {'images': Assets.grid1,'title': 'Plexi print', 'stitle': 'Upload photos, choose a size, and we’ll ship your beautiful canvas prints to your door.'},
    {'images': Assets.grid1,'title': 'Art tray', 'stitle': 'Upload photos, choose a size, and we’ll ship your beautiful canvas prints to your door.'},
    {'images': Assets.grid1,'title': 'Print on wood', 'stitle': 'Upload photos, choose a size, and we’ll ship your beautiful canvas prints to your door.'},
    {'images': Assets.grid1,'title': 'Print on wood', 'stitle': 'Upload photos, choose a size, and we’ll ship your beautiful canvas prints to your door.'},
    {'images': Assets.grid1,'title': 'Print on wood', 'stitle': 'Upload photos, choose a size, and we’ll ship your beautiful canvas prints to your door.'},
    {'images': Assets.grid1,'title': 'Print on wood', 'stitle': 'Upload photos, choose a size, and we’ll ship your beautiful canvas prints to your door.'},
    {'images': Assets.grid1,'title': 'Print on wood', 'stitle': 'Upload photos, choose a size, and we’ll ship your beautiful canvas prints to your door.'},
    {'images': Assets.grid1,'title': 'Print on wood', 'stitle': 'Upload photos, choose a size, and we’ll ship your beautiful canvas prints to your door.'},
    {'images': Assets.grid1,'title': 'Print on wood', 'stitle': 'Upload photos, choose a size, and we’ll ship your beautiful canvas prints to your door.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CommonButton(onTap: (){
        Navigator.of(context).push(CupertinoPageRoute(builder: (context) => SubCategoryScreen()));
      }, title: 'Next'),
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
                          mainAxisSpacing: 10,
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
    return Container(
      child: Column(
        children: [
          Container(
            height: 164,width: 164,
          child: Image(image: AssetImage(items[index]['images'].toString()),
        //  fit: BoxFit,
          ),),
          Container(
           // margin: EdgeInsets.only(top: 10),
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
    );
  }
}
