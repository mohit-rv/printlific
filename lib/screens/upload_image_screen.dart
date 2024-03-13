import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:printlific/screens/image_preview_screen.dart';
import 'package:printlific/wigets/common_appbar.dart';
import 'package:printlific/wigets/common_button.dart';
import 'package:printlific/wigets/common_row.dart';

import '../resources/assets.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {

  File? selectedImage;
  File? selectedImage2;
  File? selectedImage3;
  File? selectedImage4;
  File? selectedImage5;

  void _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  void _pickSecondImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage2 = File(pickedFile.path);
      });
    }
  }

  void _pickThirdImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage3 = File(pickedFile.path);
      });
    }
  }

  void _pickFourthImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage4 = File(pickedFile.path);
      });
    }
  }

  void _pickFifthImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage5 = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CommonButton(
        onTap: () {
          Navigator.of(context).push(CupertinoPageRoute(builder: (context) => ImagePreviewScreen()));
        },
        title: 'Next',
      ),
      body: Stack(
        children: [
          CommonAppbar(title: ''),
          Column(
            children: [
              CommonRow(title: 'Upload Images'),
              Container(
                height: 430,
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
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 12,left: 12,
                            top: 10),
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: Text('Let’s get started by adding your photos!Drag and drop or click in the boxes below.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: HexColor('#263238'),
                            fontFamily: 'Montserrat SemiBold',
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 0,right: 8,left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (){
                                _pickImage();
                              },
                              child: selectedImage == null ?  Container(
                                height: 158,
                                width: 130,
                                margin: EdgeInsets.only(top: 10),
                                decoration: ShapeDecoration(
                                    image: DecorationImage(image: AssetImage(Assets.firstUpload),fit:  BoxFit.cover),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                                ),
                                // child: Image(image: AssetImage(Assets.firstUpload)),
                              ) :
                              Stack(
                                children: [
                                  Card(
                                    elevation: 4,
                                    margin: EdgeInsets.only(top: 0,right: 0,left: 10),
                                    child: Container(
                                      height: 150,
                                      width: 124,
                                      decoration: ShapeDecoration(
                                          image: DecorationImage(image: FileImage(selectedImage!),fit:  BoxFit.cover),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                                      ),
                                      // child: Image(image: AssetImage(Assets.firstUpload)),
                                    ),
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 115,bottom: 0),
                                        height: 25,
                                        width: 25,
                                        child: Image(image: AssetImage(Assets.editIcon),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),

                            ),

                            Container(
                              margin: EdgeInsets.only(left: 0,top: 10,right: 0),
                              child: Column(
                                children: [

                                  InkWell(
                                      onTap: (){
                                        _pickSecondImage();
                                      },
                                      child: selectedImage2==null ?
                                      Container(
                                        height: 72,
                                        width:  130,
                                        margin: EdgeInsets.only(left: 8,right: 4),
                                        decoration: ShapeDecoration(
                                            image:
                                            DecorationImage(image: AssetImage(Assets.secondUpload),fit:  BoxFit.cover),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                                        ),
                                      ):
                                      Stack(
                                        children: [
                                          Card(
                                            elevation: 4,
                                            margin: EdgeInsets.only(top: 0,right: 4,left: 8,bottom: 0),
                                            child: Container(
                                              height: 69,
                                              width:  115,
                                              decoration: ShapeDecoration(
                                                  image:
                                                  DecorationImage(image: FileImage(selectedImage2!),fit:  BoxFit.cover),
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                                              ),
                                              // child: Image(image: AssetImage(Assets.secondUpload)),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(left: 105,),
                                                height: 25,
                                                width: 25,
                                                child: Image(image: AssetImage(Assets.editIcon),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                  ),


                                  InkWell(
                                    onTap: (){
                                      _pickThirdImage();
                                    },
                                    child: selectedImage3==null ?
                                    Container(
                                      height: 72,
                                      width:  130,
                                      margin: EdgeInsets.only(left: 8,right: 4,top: 10),
                                      decoration: ShapeDecoration(
                                          image:
                                          DecorationImage(image: AssetImage(Assets.secondUpload),fit:  BoxFit.contain),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                                      ),
                                      // child: Image(image: AssetImage(Assets.secondUpload)),
                                    ):
                                    Stack(
                                      children: [
                                        Card(
                                          elevation: 4,
                                          margin: EdgeInsets.only(top: 10,right: 4,left: 8,bottom: 10),
                                          child: Container(
                                            height: 69,
                                            width:  115,
                                            decoration: ShapeDecoration(
                                                image:
                                                DecorationImage(image: FileImage(selectedImage3!),fit:  BoxFit.cover),
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                                            ),
                                            // child: Image(image: AssetImage(Assets.secondUpload)),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(left: 110,top: 7),
                                              height: 25,
                                              width: 25,
                                              child: Image(image: AssetImage(Assets.editIcon),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),

                                  ),
                                ],
                              ),
                            ),



                          ],
                        ),
                      ),

                      InkWell(
                          onTap: () {
                            _pickFourthImage();
                          },
                          child: selectedImage4==null ? Container(
                            margin: EdgeInsets.only(top: 5),
                            height: 92,
                            width:  MediaQuery.of(context).size.width,
                            child: Image(image: AssetImage(Assets.thirdUpload),
                              fit: BoxFit.contain,
                            ),
                          ) :
                          Stack(
                            children: [
                              Card(
                                elevation: 4,
                                margin: EdgeInsets.only(top: 5,right: 24,left: 24),
                                child: Container(
                                  height: 78,
                                  width:  MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: FileImage(selectedImage4!),fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 15,top: 0),
                                    height: 25,
                                    width: 25,
                                    child: Image(image: AssetImage(Assets.editIcon),
                                    ),
                                  ),
                                ],
                              )


                            ],
                          )
                      ),

                      InkWell(
                          onTap: () {
                            _pickFifthImage();
                          },
                          child: selectedImage5==null ? Container(
                            margin: EdgeInsets.only(top: 12),
                            height: 92,
                            width:  MediaQuery.of(context).size.width,
                            child: Image(image: AssetImage(Assets.thirdUpload),
                              fit: BoxFit.contain,
                            ),
                          ) :
                          Stack(
                            children: [
                              Card(
                                elevation: 4,
                                margin: EdgeInsets.only(top: 12,right: 24,left: 24),
                                child: Container(
                                  height: 78,
                                  width:  MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: FileImage(selectedImage5!),fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 15,top: 5),
                                    height: 25,
                                    width: 25,
                                    child: Image(image: AssetImage(Assets.editIcon),
                                    ),
                                  ),
                                ],
                              )


                            ],
                          )
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),

        ],
      ),
    );
  }
}
