import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:printlific/resources/assets.dart';
import 'package:printlific/screens/edit_image_screen.dart';
import 'package:printlific/screens/select_edge_screen.dart';
import 'package:printlific/wigets/common_appbar.dart';
import 'package:printlific/wigets/common_button.dart';
import 'package:printlific/wigets/common_row.dart';

class ImagePreviewScreen extends StatefulWidget {
  const ImagePreviewScreen({super.key});

  @override
  State<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CommonButton(
        onTap: (){
          Navigator.of(context).push(CupertinoPageRoute(builder: (context) => SelectEdgeScreen()));
        },
        title: 'Next',
      ),
      body: Stack(
        children: [
          CommonAppbar(title: ''),

          Column(
            children: [
              CommonRow(title: 'Images Preview'),
              Container(
                height: 422,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(right: 24,left: 24,
                    top: MediaQuery.of(context).size.height*0.1),
                decoration: ShapeDecoration(
                    color: HexColor('#F5F5F5'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    )
                ),
                child: DottedBorder(
                  dashPattern: [8, 4],
                  strokeWidth: 1,
                  color: Color(0xff1F4CE0),
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child:
                    //getImages(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                  children: [
                                    Container(
                                      height: 152,
                                      width: 130,
                                      margin: EdgeInsets.only(top: 25, left: 0),
                                      decoration: ShapeDecoration(
                                          image: DecorationImage(image: AssetImage(Assets.print),fit:  BoxFit.cover),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                                      ),
                                    ),

                                     Positioned(
                                        right: 0,
                                        top: 20,
                                        child: InkWell(
                                          onTap: (){
                                            Navigator.of(context).push(CupertinoPageRoute(builder: (context) => EditImageScreen()));
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            child: Image(image: AssetImage(Assets.editIcon),
                                            ),
                                          ),
                                        ),
                                      ),


                                  ]
                              ),
//how can i show AssetImage(Assets.editIcon),on the topright corner of this AssetImage(Assets.print)
                              Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 69,
                                        width: 130,
                                        margin: EdgeInsets.only(top: 22),
                                        decoration: ShapeDecoration(
                                            image: DecorationImage(image: AssetImage(Assets.kkYellow)),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                                        ),
                                      ),

                                      Positioned(
                                        right: 0,
                                        top: 18,
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          child: Image(image: AssetImage(Assets.editIcon),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),

                                  Stack(
                                    children: [
                                      Container(
                                        height: 69,
                                        width: 130,
                                        margin: EdgeInsets.only(top: 10),
                                        decoration: ShapeDecoration(
                                            image: DecorationImage(image: AssetImage(Assets.thirdImageP)),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                                        ),
                                      ),

                                      Positioned(
                                        right: 0,
                                        top: 2,
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          child: Image(image: AssetImage(Assets.editIcon),
                                          ),
                                        ),
                                      ),

                                    ],
                                  )

                                ],
                              )
                            ],
                          ),
                        ),

                        Stack(
                          children: [
                            Container(
                              height: 88,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(top: 10),
                              decoration: ShapeDecoration(
                                  image: DecorationImage(image: AssetImage(Assets.fourthP)),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)
                                  )
                              ),
                            ),

                            Positioned(
                              right: 15,
                              top: 5,
                              child: Container(
                                height: 30,
                                width: 30,
                                child: Image(image: AssetImage(Assets.editIcon),
                                ),
                              ),
                            ),

                          ],
                        ),

                        Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              height: 88,
                              width: MediaQuery.of(context).size.width,
                              decoration: ShapeDecoration(
                                  image: DecorationImage(image: AssetImage(Assets.fiv)),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)
                                  )
                              ),
                            ),

                            Positioned(
                              right: 15,
                              top: 5,
                              child: Container(
                                height: 30,
                                width: 30,
                                child: Image(image: AssetImage(Assets.editIcon),
                                ),
                              ),
                            ),

                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              )
            ],
          )

        ],
      ),
    );
  }

  getImages(){
    return Column(
      children: [

        Stack(
          children: [
            Positioned(
              top: 0,
              right: 10,
              child: Image.asset(
                Assets.print, // replace with your actual path
                width: 130, // adjust the size as needed
                height: 152,
              ),
            ),

            // Overlay image (Assets.editIcon)
            Positioned(
              top: 0, // adjust the position as needed
              right: 30,
              child: Image.asset(
                Assets.editIcon, // replace with your actual path
                width: 30, // adjust the size as needed
                height: 30,
              ),
            ),
          ],
        )

      ],
    );
  }

}
