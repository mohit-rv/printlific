import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:printlific/wigets/common_appbar.dart';
import 'package:printlific/wigets/common_button.dart';
import 'package:printlific/wigets/common_row.dart';

import '../resources/assets.dart';

class EditImageScreen extends StatefulWidget {
  const EditImageScreen({super.key});

  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

class _EditImageScreenState extends State<EditImageScreen> {

  final image = Image(image: AssetImage(Assets.editImage,),height: 433,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: CommonButton(
      //   onTap: (){},
      //   title: 'Next',
      // ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: CommonRow(
          title: '',
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 433,
            width: MediaQuery.of(context).size.width,
            child: Image(
              image: AssetImage(Assets.editImage),
              fit: BoxFit.cover,
            ),
          ),

          Container(
            //height: 95,
            margin: EdgeInsets.only(top: 20,left: 12,right: 20),
            child: Row(
              children: [
               Container(
                 margin: EdgeInsets.only(top: 10,right: 10),
                 child: Column(
                   children: [

                     Stack(
                       children: [
                         Container(
                           height: 50,width: 50,
                           child: Image(
                             image: AssetImage(Assets.Ellipse),
                             fit: BoxFit.cover,
                           ),
                         ),

                         Positioned(
                            top: 17,left: 16,
                           child: Image(
                             image: AssetImage(Assets.size),height: 19,width: 19,
                           ),
                         )

                       ],
                     ),

                     Container(
                       margin: EdgeInsets.only(top: 5),
                       child: Text('Size',
                       style: TextStyle(
                         // fontFamily: '',
                         fontSize: 13,
                         fontWeight: FontWeight.w500,
                         color: HexColor('#020623')
                       ),
                       ),
                     )

                   ],
                 ),
               ),
               Container(
                  margin: EdgeInsets.only(top: 28,left: 10,right: 0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){


                          //how to perform zoom and crop in flutter
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: 50,width: 50,
                              child: Image(
                                image: AssetImage(Assets.Ellipse),
                                fit: BoxFit.cover,
                               // color: HexColor('#1F4CE0'),
                              ),
                            ),

                            Positioned(
                              top: 17,left: 16,
                              child: Image(
                                image: AssetImage(Assets.Subtract),
                                height: 19,width: 19,
                               // color: Colors.white,
                              ),
                            )

                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text('Zoom',
                          style: TextStyle(
                            // fontFamily: '',
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: HexColor('#020623')
                          ),
                        ),
                      )

                    ],
                  ),
                ),
               Container(
                 margin: EdgeInsets.only(top: 50,left: 20,right: 15),
                  child: Column(
                    children: [

                      Stack(
                        children: [
                          Container(
                            height: 50,width: 50,
                            child: Image(
                              image: AssetImage(Assets.Ellipse),
                              fit: BoxFit.cover,
                            ),
                          ),

                          Positioned(
                            top: 13,left: 13,
                            child: Image(
                              image: AssetImage(Assets.rotate),    height: 25,width: 25,
                            ),
                          )

                        ],
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text('Rotate',
                          style: TextStyle(
                            // fontFamily: '',
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: HexColor('#020623')
                          ),
                        ),
                      )

                    ],
                  ),
                ),
               Container(
                 margin: EdgeInsets.only(top: 25,left: 5,right: 10),
                  child: Column(
                    children: [

                      Stack(
                        children: [
                          Container(
                            height: 50,width: 50,
                            child: Image(
                              image: AssetImage(Assets.Ellipse),
                              fit: BoxFit.cover,
                            ),
                          ),

                          Positioned(
                            top: 17,left: 16,
                            child: Image(
                              image: AssetImage(Assets.Rectangle),height: 19,width: 19,
                            ),
                          )

                        ],
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text('Name',
                          style: TextStyle(
                            // fontFamily: '',
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: HexColor('#020623')
                          ),
                        ),
                      )

                    ],
                  ),
                ),
               Container(
                 margin: EdgeInsets.only(top: 2,left: 8),
                  child: Column(
                    children: [

                      Stack(
                        children: [
                          Container(
                            height: 50,width: 50,
                            child: Image(
                              image: AssetImage(Assets.Ellipse),
                              fit: BoxFit.cover,
                            ),
                          ),

                          Positioned(
                            top: 17,left: 16,
                            child: Image(
                              image: AssetImage(Assets.StandUpRectangle),    height: 19,width: 19,
                            ),
                          )

                        ],
                      ),

                      Container(//how to make image rotate meter
                        margin: EdgeInsets.only(top: 5),
                        child: Text('Note',
                          style: TextStyle(
                            // fontFamily: '',
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: HexColor('#020623')
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }

  getCroppBox() {
    return Container(
        //flutter code of

    );
  }

}
