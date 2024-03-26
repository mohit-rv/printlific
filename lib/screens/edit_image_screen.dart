import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printlific/wigets/common_row.dart';

import '../resources/assets.dart';


class EditImageScreen extends StatefulWidget {

  final image;
  const EditImageScreen({super.key,required this.image});

  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

class _EditImageScreenState extends State<EditImageScreen> {

  Color currentTextColor = Colors.white;
  double currentTextSize = 20.0;
  TextAlign? currentTextAlignment = TextAlign.center;
//how to make
  void addTextFeature(Offset position) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context,MyState){
            return  AlertDialog(
              backgroundColor: Colors.white,
              title: Text('Add Text'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    TextField(
                      controller: nameController, // Pass the controller to the TextField
                      onChanged: (value) {
                        nameController.text = value;
                        // You can listen to changes in the TextField text here if needed
                      },
                      decoration: InputDecoration(hintText: 'Enter text'),
                      maxLines: 2,
                      keyboardType: TextInputType.multiline,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Text Color:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    ColorPicker(
                      pickerColor: currentTextColor,
                      onColorChanged: (Color color) {
                        setState(() {
                          currentTextColor = color;
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Text Size:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Slider(
                      value: currentTextSize,
                      min: 10,
                      max: 40,
                      divisions: 6,
                      label: currentTextSize.round().toString(),
                      onChanged: (double value) {
                        MyState(() {
                          currentTextSize = value;
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Text Alignment:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    DropdownButton<TextAlign>(
                      value: currentTextAlignment,
                      items: [
                        DropdownMenuItem<TextAlign>(
                          value: TextAlign.left,
                          child: Text('Left'),
                        ),
                        DropdownMenuItem<TextAlign>(
                          value: TextAlign.center,
                          child: Text('Center'),
                        ),
                        DropdownMenuItem<TextAlign>(
                          value: TextAlign.right,
                          child: Text('Right'),
                        ),
                      ],
                      onChanged: (TextAlign? value) {
                        MyState(() {
                          currentTextAlignment = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Add'),
                  onPressed: () {
                    setState(() {
                      textWidgets.clear();
                      textWidgets.add(
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            nameController.text, // Use controller's text
                            style: TextStyle(
                              color: currentTextColor,
                              fontSize: currentTextSize,
                              fontWeight: FontWeight.bold,
                              //fontFamily: 'Montserrat Bold'
                            ),
                            softWrap: true,
                            textAlign: currentTextAlignment ?? TextAlign.center,
                          ),
                        ),
                      );
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
           },

        );
      },
    );
  }

  List<Widget> textWidgets = [];

  //final image = Image(image: AssetImage(Assets.editImage,),height: 433,);

  TextEditingController noteController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  String? image;
  CroppedFile? _croppedFile;
  //String? _namedFile;
 // File? _namedFile;



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
              toolbarTitle: 'Cropper',
              backgroundColor: Colors.white,
              statusBarColor: Colors.white,
              cropGridColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.square,
              lockAspectRatio: false,
          ),
          IOSUiSettings(title: 'Crop'),
        ],
      );

      if (cropped != null) {
        setState(() {
          _croppedFile = cropped;   //cropped file

          print('Image cropped');
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    noteController = TextEditingController();
    image = Assets.editImage;
    print('default image path $image');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    noteController.dispose();
  }

  bool zoom = false;
  bool rotate = false;
  bool name = false;   //name bottom space
  bool note = false;
  bool size = false;
  bool textFieldName = false;
  bool textFieldNote = false;
  bool nameConfirm = false;
  bool editedText = true;
  bool removeIcons = false;



  double _containerWidth = 100.0;
  double _containerHeight = 100.0;
  double _containerLeft = 0.0;
  double _containerTop = 0.0;
  double _rotationAngle = 0.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
         actions: [
           name ? Container(
             margin: EdgeInsets.only(right: 20),
             child: InkWell(
               onTap: (){
                 // setState(() {
                 //  // name = false;
                 //   removeIcons = true;
                 // });
               },
               child: Icon(Icons.save),
             ),
           ) : Container(),
         ],
        flexibleSpace: CommonRow(
          title: '',
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _croppedFile==null ? getbackImageWithName():
               // nameConfirm ?
               //  Container(
               //      height: 433,
               //      width: MediaQuery.of(context).size.width,
               //      child: Image.file(File(_namedFile!.path),)):
               Container(
                   height: 433,
                   width: MediaQuery.of(context).size.width,
                   child: Image.file(File(_croppedFile!.path),)),

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
                   controller: nameController,
                   onTap: (){
                     setState(() {
                        textFieldName = true;
                     });
                   },//how to make container which size increase when content under container has occupie full size and size will incrrease up to a limit then text will go on the next line
                   onChanged: (value){
                     setState(() {
                       print('change');
                       nameController.text = value;
                     });
                   },
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
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     InkWell(
                         onTap: (){
                           setState(() {
                           //  nameNote = false;
                             name = true;
                             textFieldName = true;
                             removeIcons = false;
                           });
                         },
                         child: Image(image: AssetImage(Assets.cancel),height: 38,width: 38,
                           color: HexColor('#A0A9FC'),
                         )),
                     InkWell(
                         onTap: (){
                           setState(() {
                            // nameNote = false;
                             name = true;
                             textFieldName = true;
                             removeIcons = true;
                            // nameConfirm = true;
                           //  if (image != null) {
                               // setState(() {
                               //   image = _namedFile;   //cropped file
                               //   print('Image named');
                               // });


                            // }
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
                    controller: noteController,
                    onTap: (){
                      setState(() {
                        textFieldNote = true;
                      });
                    },
                    onChanged: (value){
                      setState(() {
                        noteController.text = value;
                      });
                    },
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
                              note = false;
                              textFieldName = false;
                            });
                          },
                          child: Image(image: AssetImage(Assets.cancel),height: 38,width: 38,
                          color: HexColor('#A0A9FC'),
                          )),
                      InkWell(
                            onTap: (){
                              setState(() {
                                note = false;
                                textFieldName = false;
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
            margin: EdgeInsets.only(top: 20,left: 20),
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

                      Container(
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
                  margin: EdgeInsets.only(top: 28,left: 30),
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

                          _cropImage();

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
                        child: Text('Zoom & \nRotate',textAlign: TextAlign.center,
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
                // Container(
                //   margin: EdgeInsets.only(top: 50,left: 20,right: 15),
                //   child: Column(
                //     children: [
                //
                //       InkWell(
                //         onTap: (){
                //           setState(() {
                //             zoom = false;
                //             name= false;
                //             rotate= true;
                //             note = false;
                //             size= false;
                //           });
                //         },
                //         highlightColor: Colors.transparent,
                //         splashColor: Colors.transparent,
                //         child: Stack(
                //           children: [
                //             Container(
                //               height: 50,width: 50,
                //               child: Image(
                //                 image: AssetImage(Assets.Ellipse),
                //                 fit: BoxFit.cover,
                //                 color: rotate ? HexColor('#1F4CE0'): HexColor('#F4F4F4'),
                //               ),
                //             ),
                //
                //             Positioned(
                //               top: 13,left: 13,
                //               child: Image(
                //                   image: AssetImage(Assets.rotate),    height: 25,width: 25,
                //                   color: rotate ? Colors.white : Colors.black
                //               ),
                //             )
                //
                //           ],
                //         ),
                //       ),
                //
                //       Container(
                //         margin: EdgeInsets.only(top: 5),
                //         child: Text('Rotate',
                //           style: TextStyle(
                //             // fontFamily: '',
                //               fontSize: 13,
                //               fontWeight: FontWeight.w500,
                //               color: HexColor('#020623')
                //           ),
                //         ),
                //       )
                //
                //     ],
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.only(top: 10,left: 40,right: 0),
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
                            textFieldName = true;
                          //  nameNote = true;
                          });
                        //  Navigator.push(context, MaterialPageRoute(builder: (context) => NameImage()));
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
                  margin: EdgeInsets.only(top: 10,left: 40,right: 0),
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
                            textFieldName = true;
                            textFieldNote = true;
                          //  nameNote = true;
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
          ),


            // Container(
            //   margin: EdgeInsets.only(right: 18,left: 18,top: 10),
            //   child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       InkWell(
            //           onTap: (){
            //
            //           },
            //           child: Image(image: AssetImage(Assets.cancel),height: 38,width: 38,
            //             color: HexColor('#A0A9FC'),
            //           )),
            //       InkWell(
            //           onTap: (){
            //
            //           },
            //           child: Image(image: AssetImage(Assets.right),height: 38,width: 38,color: HexColor('#A0A9FC'),))
            //     ],
            //   ),
            // )

          ]
        ),
      ),
    );
  }


  getbackImageWithName() {
    return textFieldName  ?
             Stack(
               children: [
                 Container(
                   height: 433,
                   width: MediaQuery.of(context).size.width,
                   child: Image(
                     image: AssetImage(Assets.editImage),
                     fit: BoxFit.cover,
                   ),
                 ),

                 Positioned(
                   left: _containerLeft,
                   top: _containerTop,
                   child: GestureDetector(   //for position
                     onPanUpdate: (details) {
                       setState(() {
                         _containerLeft += details.delta.dx;
                         _containerTop += details.delta.dy;
                       });
                     },
                     child: Stack(
                       children: [
                         Container(
                           constraints: BoxConstraints(
                             minHeight: _containerHeight,
                             minWidth: _containerWidth,
                           ),
                           decoration: BoxDecoration(
                             color: Colors.transparent,
                             border: Border.all(
                               color: removeIcons ? Colors.transparent: Colors.black87,
                               width: 2.0,
                             ),
                           ),
                           child: Column(
                             children: [
                               ...textWidgets
                             ],
                           ),
                         ),

                         Positioned(
                          bottom: 0,
                           right: 0,
                           child: removeIcons ? Container():
                           GestureDetector(
                             //for sizing
                             onPanUpdate: (details) {
                               setState(() {
                                 _containerWidth += details.delta.dx;
                                 _containerHeight += details.delta.dy;
                               });
                             },
                             child: Icon(Icons.add_circle),
                           ),
                         ),

                       ],
                     ),
                   ),
                 ),
                 // Other operations on the container area
                 Positioned(
                     left: _containerLeft - 20,
                     top: _containerTop - 20,
                     child: removeIcons ? Container():
                     GestureDetector(
                       onTapDown: (TapDownDetails details){
                         print('add text');
                         addTextFeature(details.localPosition);
                       }, child: Icon(Icons.mode_edit_outline_outlined,),)
                 ),
                 // Positioned(
                 //   left: _containerLeft + _containerWidth - 4,
                 //   top: _containerTop + _containerHeight - 4,
                 //   child: GestureDetector(
                 //     //for sizing
                 //     onPanUpdate: (details) {
                 //       setState(() {
                 //         _containerWidth += details.delta.dx;
                 //         _containerHeight += details.delta.dy;
                 //       });
                 //     },
                 //     child: Icon(Icons.add_circle),
                 //   ),
                 // ),

               ],
             ) :
             Container(
               height: 433,
               width: MediaQuery.of(context).size.width,
               child: Image(
                 image: AssetImage(Assets.editImage),
                 fit: BoxFit.cover,
               ),
             );
     }
     //how can i save these changes as a imagefile whereas black border,And icons should be removed


  getbackImageWithNote() {
    return textFieldNote ?
    Stack(
      children: [
        Container(
          height: 433,
          width: MediaQuery.of(context).size.width,
          child: Image(
            image: AssetImage(Assets.editImage),
            fit: BoxFit.cover,
          ),
        ),

        Positioned(
          left: _containerLeft,
          top: _containerTop,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                _containerLeft += details.delta.dx;
                _containerTop += details.delta.dy;
              });
            },
            child: Container(
              width: _containerWidth,
              height: _containerHeight,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.black54,
                  width: 2.0,
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    Text(
                      '${noteController.text}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(onTapDown: (TapDownDetails details){
                      addTextFeature(details.localPosition);
                    }, child: Icon(Icons.mode_edit_outline_outlined,color: Colors.white,),)
                  ],
                ),
              ),
            ),
          ),
        )

      ],
    ) :

    Container(
      height: 433,
      width: MediaQuery.of(context).size.width,
      child: Image(
        image: AssetImage(Assets.editImage),
        fit: BoxFit.cover,
      ),
    );
  }


}
