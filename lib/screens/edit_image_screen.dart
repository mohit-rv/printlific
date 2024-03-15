import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:printlific/wigets/common_appbar.dart';
import 'package:printlific/wigets/common_button.dart';
import 'package:printlific/wigets/common_row.dart';

import '../resources/assets.dart';

class EditImageScreen extends StatefulWidget {

  final image;
  const EditImageScreen({super.key,required this.image});

  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

class _EditImageScreenState extends State<EditImageScreen> {

  final image = Image(image: AssetImage(Assets.editImage,),height: 433,);

  TextEditingController fieldController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    fieldController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    fieldController.dispose();
  }

  bool zoom = false;
  bool rotate = false;
  bool name = false;
  bool note = false;
  bool size = false;
  bool nameNote = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: CommonRow(
          title: '',
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            backImage(),

             name ?
             Container(
             child: Column(
             children: [
               Container(
                 margin: EdgeInsets.only(top: 12,left: 18),
                 alignment: Alignment.topLeft,
                 child: Text('Name',textAlign: TextAlign.left,
                     style: TextStyle(
                         fontSize: 12,
                         fontWeight: FontWeight.w400,
                         color: HexColor('#939393')
                     )
                 ),
               ),
               Container(
                 width: MediaQuery.of(context).size.width,
                 height: 140,
                 margin: EdgeInsets.only(right: 18,left: 18,top: 5),
                 decoration: ShapeDecoration(
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(12),
                         side: BorderSide(width: 1,color: HexColor('#939393'))
                     )
                 ),
                 child: TextField(
                   controller: fieldController,
                   decoration: InputDecoration(
                     border: InputBorder.none,
                     contentPadding: EdgeInsets.all(8)
                   ),
                   cursorColor: Color(0xFFA7A9B7),
                   
                   style: TextStyle(
                     color: HexColor('#656565'),
                     fontSize: 12,
                     fontFamily: 'Montserrat SemiBold',
                     fontWeight: FontWeight.w500,
                     height: 1.0,
                   ),
                 ),
               ),
               Container(
                 margin: EdgeInsets.only(right: 18,left: 18,top: 10),
                 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     InkWell(
                         onTap: (){
                           setState(() {
                             nameNote = false;
                             name = false;
                           });
                         },
                         child: Image(image: AssetImage(Assets.cancel),height: 38,width: 38,
                           color: HexColor('#A0A9FC'),
                         )),
                     InkWell(
                         onTap: (){
                           setState(() {
                             nameNote = false;
                             name = false;
                           });
                         },
                         child: Image(image: AssetImage(Assets.right),height: 38,width: 38,color: HexColor('#A0A9FC'),))
                   ],
                 ),
               )
             ],
           ),
         )   :

            note ?
            Container(
            child: Column(
              children: [

                Container(
                  margin: EdgeInsets.only(top: 12,left: 18),
                  alignment: Alignment.topLeft,
                  child: Text('Note',textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: HexColor('#939393')
                    )
                  ),
                ),


                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 140,
                  margin: EdgeInsets.only(right: 18,left: 18,top: 5),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(width: 1,color: HexColor('#939393'))
                    )
                  ),
                  child: TextField(
                    controller: fieldController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                        contentPadding: EdgeInsets.all(8)
                    ),
                    cursorColor: Color(0xFFA7A9B7),
                    style: TextStyle(
                      color: HexColor('#656565'),
                      fontSize: 12,
                      fontFamily: 'Montserrat SemiBold',
                      fontWeight: FontWeight.w500,
                      height: 1.0,
                    ),
                  ),
                  ),

                Container(
                  margin: EdgeInsets.only(right: 18,left: 18,top: 10),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: (){
                            setState(() {
                              nameNote = false;
                              note = false;
                            });
                          },
                          child: Image(image: AssetImage(Assets.cancel),height: 38,width: 38,
                          color: HexColor('#A0A9FC'),
                          )),
                      InkWell(
                            onTap: (){
                              setState(() {
                                nameNote = false;
                                note = false;
                              });
                            },
                          child: Image(image: AssetImage(Assets.right),height: 38,width: 38,
                            color: HexColor('#A0A9FC'),))
                    ],
                  ),
                )


              ],
            ),
          )  :
            Container(
            //height: 95,
            margin: EdgeInsets.only(top: 20,left: 12,right: 20),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10,right: 10),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            zoom = false;
                            name= false;
                            rotate= false;
                            note = false;
                            size= true;
                          });
                        },
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Stack(
                          children: [
                            Container(
                              height: 50,width: 50,
                              child: Image(
                                image: AssetImage(Assets.Ellipse),
                                fit: BoxFit.cover,
                                color: size ? HexColor('#1F4CE0'): HexColor('#F4F4F4'),
                              ),
                            ),

                            Positioned(
                              top: 17,left: 15,
                              child: Image(
                                  image: AssetImage(Assets.size),height: 19,width: 19,
                                  color:  size ? Colors.white: Colors.black
                              ),
                            )

                          ],
                        ),
                      ),

                      Container(//how to make a box in flutter which size and postion we can change and
                        margin: EdgeInsets.only(top: 5),
                        child: Text('Size',
                          style: TextStyle(
                            // fontFamily: '',
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color:  HexColor('#020623')
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
                          setState(() {
                            zoom = true;
                            name= false;
                            rotate= false;
                            note = false;
                            size= false;
                          });
                          // _cropImage();
                          //how to perform zoom and crop in flutter
                        },
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Stack(
                          children: [
                            Container(
                              height: 50,width: 50,
                              child: Image(
                                image: AssetImage(Assets.Ellipse),
                                fit: BoxFit.cover,
                                color: zoom ? HexColor('#1F4CE0'): HexColor('#F4F4F4'),
                              ),
                            ),

                            Positioned(
                              top: 17,left: 15,
                              child: Image(
                                image: AssetImage(Assets.Subtract),
                                height: 19,width: 19,
                                color: zoom ? Colors.white : Colors.black,
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

                      InkWell(
                        onTap: (){
                          setState(() {
                            zoom = false;
                            name= false;
                            rotate= true;
                            note = false;
                            size= false;
                          });
                        },
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Stack(
                          children: [
                            Container(
                              height: 50,width: 50,
                              child: Image(
                                image: AssetImage(Assets.Ellipse),
                                fit: BoxFit.cover,
                                color: rotate ? HexColor('#1F4CE0'): HexColor('#F4F4F4'),
                              ),
                            ),

                            Positioned(
                              top: 13,left: 13,
                              child: Image(
                                  image: AssetImage(Assets.rotate),    height: 25,width: 25,
                                  color: rotate ? Colors.white : Colors.black
                              ),
                            )

                          ],
                        ),
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

                      InkWell(
                        onTap: (){
                          setState(() {
                            zoom = false;
                            name= true;
                            rotate= false;
                            note = false;
                            size= false;
                            nameNote = true;
                          });
                        },
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Stack(
                          children: [
                            Container(
                              height: 50,width: 50,
                              child: Image(
                                image: AssetImage(Assets.Ellipse),
                                fit: BoxFit.cover,
                                color: name ? HexColor('#1F4CE0'): HexColor('#F4F4F4'),
                              ),
                            ),

                            Positioned(
                              top: 17,left: 15,
                              child: Image(
                                image: AssetImage(Assets.Rectangle),height: 19,width: 19,
                                color: name ? Colors.white: Colors.black,
                              ),
                            )

                          ],
                        ),
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

                      InkWell(
                        onTap: (){
                          setState(() {
                            zoom = false;
                            name= false;
                            rotate= false;
                            note = true;
                            size= false;
                            nameNote = true;
                          });
                        },
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Stack(
                          children: [
                            Container(
                              height: 50,width: 50,
                              child: Image(
                                image: AssetImage(Assets.Ellipse),
                                fit: BoxFit.cover,
                                color: note ? HexColor('#1F4CE0'): HexColor('#F4F4F4'),
                              ),
                            ),

                            Positioned(
                              top: 17,left: 15,
                              child: Image(
                                image: AssetImage(Assets.StandUpRectangle),    height: 19,width: 19,
                                color: note ? Colors.white: Colors.black,
                              ),
                            )

                          ],
                        ),
                      ),

                      Container(
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

          ]
        ),
      ),
    );
  }


  backImage() {
    return Stack(
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
          decoration: BoxDecoration(
            color: Colors.black12,
          ),
          //how we can make a box in flutter which size we can change
        )

      ],
    );
  }



  CroppedFile? _croppedFile;

  Future<void> _cropImage() async {
    var imageFile = await DefaultAssetBundle.of(context).loadString(Assets.editImage);
    if (imageFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
          WebUiSettings(
            context: context,
            presentStyle: CropperPresentStyle.dialog,
            boundary: const CroppieBoundary(
              width: 520,
              height: 520,
            ),
            viewPort:
            const CroppieViewPort(width: 480, height: 480, type: 'circle'),
            enableExif: true,
            enableZoom: true,
            showZoomer: true,
          ),
        ],
      );
      if (croppedFile != null) {
        setState(() {
          _croppedFile = croppedFile;
        });
      }
    }
  }

  //how to make a container whose size and position we can change and we can perform aother opertion on the area it covers in flutter

}
