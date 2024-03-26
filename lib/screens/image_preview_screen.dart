import 'dart:io';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path_provider/path_provider.dart';
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

  String? image;
  CroppedFile? _croppedFile;

  @override
  void initState() {
    super.initState();
    // Set default asset image path
    image = Assets.editImage;
    print('default image path $image');
  }


  Future<void> _cropImage() async {
    if (image != null) {
      print('$image');
      ByteData data = await rootBundle.load(image!);
      List<int> bytes = data.buffer.asUint8List();
      String tempImagePath = (await getTemporaryDirectory()).path + '/temp_image.png';

      await File(tempImagePath).writeAsBytes(bytes);

      CroppedFile? cropped = await ImageCropper().cropImage(
        sourcePath: tempImagePath,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop',
            cropGridColor: Colors.black,
            toolbarColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(title: 'Crop'),
        ],
      );

      if (cropped != null) {
        setState(() {
           _croppedFile = cropped;
        //  image = File(cropped.path) as String?;
          print('Image cropped');
        });
      }
    }
  }

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
                   // margin: EdgeInsets.only(top: 20),
                    child:
                    //getImages(),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 20,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20,right: 20,left: 20),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Stack(
                                    children: [
                                      Container(
                                        height: 152,
                                        width: 130,
                                        margin: EdgeInsets.only(top: 0, left: 0),
                                        decoration: ShapeDecoration(
                                            image: DecorationImage(image: AssetImage(Assets.print),fit:  BoxFit.cover),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                                        ),
                                      ),

                                       Positioned(
                                          right: 0,
                                          top: 0,
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.of(context).push(CupertinoPageRoute(builder: (context) => EditImageScreen(image: Assets.print)));
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
                                Container(
                                  height: 152,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 69,
                                            width: 130,
                                            margin: EdgeInsets.only(top: 0),
                                            decoration: ShapeDecoration(
                                                image: DecorationImage(image: AssetImage(Assets.kkYellow)),
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                                            ),
                                          ),

                                          Positioned(
                                            right: 0,
                                            top: 0,
                                            child: InkWell(
                                              onTap: (){
                                                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => EditImageScreen(image: Assets.editImage)));
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                child: Image(image: AssetImage(Assets.editIcon),
                                                ),
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
                                            margin: EdgeInsets.only(top: 0),
                                            decoration: ShapeDecoration(
                                                image: DecorationImage(image: AssetImage(Assets.thirdImageP)),
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                                            ),
                                          ),

                                          Positioned(
                                            right: 0,
                                            top: 0,
                                            child: InkWell(
                                              onTap: (){
                                                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => EditImageScreen(image: Assets.thirdImageP)));
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                child: Image(image: AssetImage(Assets.editIcon),
                                                ),
                                              ),
                                            ),
                                          ),

                                        ],
                                      )

                                    ],
                                  ),
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
                                child: InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(CupertinoPageRoute(builder: (context) => EditImageScreen(image: Assets.thirdImageP)));                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    child: Image(image: AssetImage(Assets.editIcon),
                                    ),
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
                                child: InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(CupertinoPageRoute(builder: (context) => EditImageScreen(image: Assets.thirdImageP)));
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    child: Image(image: AssetImage(Assets.editIcon),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),

                        ],
                      ),
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
//please suggest a dependency in flutter whose croppper i can customize according to my desigen or need
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
