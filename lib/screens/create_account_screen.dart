import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:printlific/resources/assets.dart';
import 'package:printlific/screens/login_screen.dart';
import 'package:printlific/wigets/common_button.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {

  bool isVisible = false;
  bool isPassVisible = false;
  bool isChecked = false;
  bool name = false;
  bool email = false;
  bool phone = false;
  bool pass = false;
  bool pass2 = false;
  bool confPass = false;
  bool validEmail = false;

 late TextEditingController nameController ;
 late TextEditingController emailController;
 late TextEditingController phoneController ;
 late TextEditingController passwordController ;
 late TextEditingController confirmPassController ;


 late FocusNode nameNode = FocusNode();
 late FocusNode emailNode = FocusNode();
 late FocusNode passwordNode = FocusNode();
 late FocusNode confirmNode = FocusNode();
 late FocusNode phoneNode = FocusNode();

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
     nameController = TextEditingController();
     emailController = TextEditingController();
     phoneController = TextEditingController();
     passwordController = TextEditingController();
     confirmPassController = TextEditingController();
     nameNode = FocusNode();
    emailNode = FocusNode();
    passwordNode = FocusNode();
    confirmNode = FocusNode();
    phoneNode = FocusNode();
  }

  nameError() {
   return Container(
     margin: EdgeInsets.only(right: 200),
     child: Text(name ? '': 'Enter name',style: TextStyle(
         fontFamily: "Montserrat Regular",
         fontSize: 13,
         color: Colors.red)),
   );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    nameNode.dispose();
    emailNode.dispose();
    passwordNode.dispose();
    confirmNode.dispose();
    phoneNode.dispose();
  }


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: _appBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.start,
            children: [

              _appBar(),

              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text('Create your account',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: "Montserrat Bold",
                        fontSize: 22,
                        color: HexColor('#182035'),
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: "Montserrat Regular",
                      fontSize: 13,
                      color: HexColor('#606268'),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(CupertinoPageRoute(builder: (context) => LoginScreen()));
                      print('Sign in');
                    },
                    child: Text(' Sign in',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: "Montserrat Regular",
                        fontSize: 13,
                        color: HexColor('#1F4CE0'),
                      ),
                    ),
                  ),
                ],
              ),


              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 25,top: 20),
                child: Text('Full name',textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: "Montserrat Regular",
                    fontSize: 13,
                    color: HexColor('#747474'),
                  ),
                ),
              ),
              getNameField(),
            Container(
              margin: EdgeInsets.only(right: 220),
              child: Text(name ? 'Enter name': '',
                  style: TextStyle(
                  fontFamily: "Montserrat SemiBold",
                  fontSize: 13,
                  color: Colors.red)),
            ),

              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 25,top: 20),
                child: Text('Email',textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: "Montserrat Regular",
                    fontSize: 13,
                    color: HexColor('#747474'),
                  ),
                ),
              ),
              getEmailField(),
              emailController.text.isEmpty ? Container(
                margin: EdgeInsets.only(right: 220),
                child: Text(email ? 'Enter email': '',
                    style: TextStyle(
                    fontFamily: "Montserrat SemiBold",
                    fontSize: 13,
                    color: Colors.red)),
              ):
              Container(
                margin: EdgeInsets.only(right: 170),
                child: Text(validEmail ? 'Enter valid email id': '',
                    style: TextStyle(
                        fontFamily: "Montserrat SemiBold",
                        fontSize: 13,
                        color: Colors.red)),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 25,top: 20),
                child: Text('Phone Number',textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: "Montserrat Regular",
                    fontSize: 13,
                    color: HexColor('#747474'),
                  ),
                ),
              ),
              getPhoneField(),
              Container(
                margin: EdgeInsets.only(right: 200),
                child: Text(phone ? 'Enter phone no': '',
                    style: TextStyle(
                    fontFamily: "Montserrat SemiBold",
                    fontSize: 13,
                    color: Colors.red)),
              ),


              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 25,top: 20),
                child: Text('Password',textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: "Montserrat Regular",
                    fontSize: 13,
                    color: HexColor('#747474'),
                  ),
                ),
              ),
              getPasswordField(),
              passwordController.text.isEmpty ? Container(
                margin: EdgeInsets.only(right: 200),
                child: Text(pass ? 'Enter password': '',style: TextStyle(
                    fontFamily: "Montserrat SemiBold",
                    fontSize: 13,
                    color: Colors.red)),
              ) :
              Container(
                margin: EdgeInsets.only(right: 210),
                child: Text(pass2 ? 'invalid pass ': '',
                    style: TextStyle(
                    fontFamily: "Montserrat SemiBold",
                    fontSize: 13,
                    color: Colors.red)),
              ),


              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 25,top: 20),
                child: Text('Confirm Password',textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: "Montserrat Regular",
                    fontSize: 13,
                    color: HexColor('#747474'),
                  ),
                ),
              ),
              confirmPassField(),
              Container(
                margin: EdgeInsets.only(right: 130),
                child: Text(confPass ? 'password is not matching': '',
                    style: TextStyle(
                    fontFamily: "Montserrat SemiBold",
                    fontSize: 13,
                    color: Colors.red)),
              ),

              Container(
                margin: EdgeInsets.only(top: 10,right: 3,left: 3),
                child: Row(//mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    getTermsAndCheck(),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          //how to apply diffrent operations on a line of text in flutter
                          // text: 'Hello ',
                          // style: DefaultTextStyle.of(context).style,
                          children:  <TextSpan>[
                            TextSpan(text: 'By hitting the "Register" button, you agree to the',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Montserrat Light",
                                  fontSize: 12,
                                  color: Color(0xff747474)
                              ),),
                            TextSpan(text: ' Terms conditions',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Montserrat Light",
                                  fontSize: 12,
                                  color: Color(0xff1F4CE0),
                                ),
                                recognizer: TapGestureRecognizer()..onTap=() {
                                  print('Terms conditions');
                                }
                            ),
                            TextSpan(text: ' &',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Montserrat Light",
                                  fontSize: 12,
                                  color: Color(0xff1F4CE0),
                                )
                            ),
                            TextSpan(text: ' Privacy Policy',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: "Montserrat Light",
                                fontSize: 12,
                                color: Color(0xff1F4CE0),
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {
                                print('Privacy Policy');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 20),
                child: CommonButton(
                    onTap: (){

                       if(nameController.text.isEmpty){
                         setState(() {
                           name= true;
                         });
                         nameNode.requestFocus();
                         if(emailController.text.isEmpty) {
                           setState(() {
                             email = true;
                             //  emailNode.hasFocus;
                           });
                           if(phoneController.text.isEmpty){
                             setState(() {
                               phone = true;
                             });
                             if(passwordController.text.isEmpty){
                               setState(() {
                                 pass = true;
                               });
                               // if(confirmPassController.text.isEmpty){
                               //   setState(() {
                               //     confPass = true;
                               //   });
                               // }
                             }
                           }
                         }
                       }
                       else if(emailController.text.isEmpty) {
                         setState(() {
                           email = true;
                         });
                         emailNode.requestFocus();
                         print('Emptey email id');
                       }
                       else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                           .hasMatch(emailController.text)) {
                         setState(() {
                           validEmail = true;
                         });
                         emailNode.requestFocus();
                         print('invalid email id');
                       }
                      else if(phoneController.text.isEmpty){
                        setState(() {
                          phone = true;
                         // phoneNode.hasFocus;
                        });
                        phoneNode.requestFocus();
                        print('Emptey phone number');
                      }
                      else if(passwordController.text.isEmpty){
                        setState(() {
                          pass = true;
                        });
                        passwordNode.requestFocus();
                        print('Emptey password');
                      }
                      else if(passwordController.text.isNotEmpty){
                         if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                             .hasMatch(passwordController.text)) {
                           setState(() {
                             pass2 = true;
                           });
                           passwordNode.requestFocus();
                           print('invalid password');
                         }
                      }
                      else if(confirmPassController.text.isNotEmpty){
                        print('confirmpass is not empty');
                        if(confirmPassController.text == passwordController.text){
                         setState(() {
                           confPass = true;
                         });
                         confirmNode.requestFocus();
                         print('password is matching');
                       }else {
                          setState(() {
                            confPass = false;
                          });
                          print('password is not matching');
                        }
                       }
                      else {
                        setState(() {
                          name = false;
                          email = false;
                          validEmail = false;
                          phone = false;
                          pass = false;
                          pass2 = false;
                          confPass = false;
                          print('register succesfully');
                        });
                      }

                    },
                    title: 'Register'
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 0),
                width: MediaQuery.of(context).size.width,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(image: AssetImage(Assets.oppline),height: 1,width: 98,),
                    Text('Or Register up with',
                    style: TextStyle(
                      color: HexColor('#B6B6B6'),
                      fontFamily: 'Montserrat Regular',
                      fontSize: 11.25,
                      fontWeight: FontWeight.w500
                    ),
                    ),
                    Image(image: AssetImage(Assets.line),height: 1,width: 98,),

                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 20,bottom: 10),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Image(image: AssetImage(Assets.google),height: 39,width: 39,)),
                    Image(image: AssetImage(Assets.facebook),height: 39,width: 39,)
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

//appbar ki height mobile ki adhi screen ke baraber kaise kare


  getNane() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 52,
      margin: EdgeInsets.only(top: 5, left: 24, right: 24),

      child:  TextFormField(
        controller: nameController,
        autofocus: true,
        onChanged: (value) {
         if(value.length==0){
            FocusScope.of(context).hasFocus;
          }
        },
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 1,
                color: Color(0xFFD8DADC),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 1,
                color: Color(0xFFD8DADC),// Set the desired color here
              ),
            ),
            hintText: "Full Name",
            hintStyle: TextStyle(
              color: Color(0xFFA7A9B7),
              fontSize: 14,
              fontFamily: 'Montserrat SemiBold',
              fontWeight: FontWeight.w400,
              height: 1.0,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
              width: 1,
                color: Color(0xFFD8DADC),
            ),
            ),
            prefixIcon: Container(
              margin: EdgeInsets.only(right: 10,left: 10),
              child: Image(
                image: AssetImage(Assets.user),
                width: 4,
                height: 4,
              ),
            ),
            errorStyle: TextStyle(color: Colors.redAccent,fontSize: 12),
            prefixIconConstraints: BoxConstraints(
              minWidth: 44,
              maxHeight: 44,
              minHeight: 44,
              maxWidth: 44,
            ),
            isDense: true,
           // contentPadding: EdgeInsets.all(18)
        ),
        cursorColor: Color(0xFFA7A9B7),
        validator: (val){
          if(val!.isEmpty){
            return "Required";
          }else{
            return null;
          }
        },
        style: TextStyle(
          color: Colors.black54,
          fontSize: 14,
          fontFamily: 'Montserrat SemiBold',
          fontWeight: FontWeight.w400,
          height: 1.0,
        ),
      ),
    );
  }

  _appBar() {
    return PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, 400),
      child: Container(

        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Stack(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Container(
                child: Image(image: AssetImage(Assets.screenBgImg),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),


            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 32,
                height: 32,
                margin: EdgeInsets.only(top: 35,left: 15),
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Image(
                  image: AssetImage(Assets.backIcon),
                  color: Colors.black,
                ),
              ),
            ),


            Container(
              margin: EdgeInsets.only(top: 100,left: 80,bottom: 0),
              child: Image(
                image: AssetImage(Assets.loginLogo),
                alignment: Alignment.center,
                height: 52,width: 202,
              ),
            ),


          ],
        ),
      ),
    );
  }


  getNameField() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 52,
      margin: EdgeInsets.only(top: 5, left: 24, right: 24),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: name ? Colors.red : Color(0xFFD8DADC),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Container(
          alignment: Alignment.center,
          child: TextFormField(
            controller: nameController,
            focusNode: nameNode,
            validator: (value){
              if(value==null || value.isEmpty){
                return 'Please Enter your full name';
              }else {return null;}
            },
            onChanged: (text) {
              setState(() {
                name = false;
              });
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Full Name",
                hintStyle: TextStyle(
                  color: Color(0xFFA7A9B7),
                  fontSize: 14,
                  fontFamily: 'Montserrat SemiBold',
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                ),
                counterText: "",
                prefixIcon: Container(
                  margin: EdgeInsets.only(right: 8),
                  child: const Image(
                    image: AssetImage(Assets.user),
                    width: 24,
                    height: 24,
                  ),
                ),
                prefixIconConstraints: BoxConstraints(
                  minWidth: 34,
                  maxHeight: 34,
                  minHeight: 34,
                  maxWidth: 34,
                ),
                isDense: true,
                contentPadding: EdgeInsets.all(18)),
            keyboardType: TextInputType.name,
            maxLines: 1,
            cursorColor: Color(0xFFA7A9B7),
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Montserrat SemiBold',
              fontWeight: FontWeight.w400,
              height: 1.0,
            ),
          ),
        ),
      ),
    );
  }
  getEmailField() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 52,
      margin: EdgeInsets.only(top: 5, left: 24, right: 24),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color:emailController.text.isEmpty ? (email ? Colors.red: Color(0xFFD8DADC)) :
                                           (validEmail ? Colors.red: Color(0xFFD8DADC)),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Container(
          alignment: Alignment.center,
          child: TextFormField(
            controller: emailController,
            focusNode: emailNode,
            validator: (value){
              if(value==null || value.isEmpty){
                return 'Please enter email id';
              }else {return null;}
            },
            onChanged: (text) {
              setState(() {
                email = false;
                validEmail = false;
              });
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "yourname@gmail.com",
                hintStyle: TextStyle(
                  color: Color(0xFFA7A9B7),
                  fontSize: 14,
                  fontFamily: 'Montserrat SemiBold',
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                ),
                counterText: "",
                prefixIcon: Container(
                  margin: EdgeInsets.only(right: 8),
                  child: const Image(
                    image: AssetImage(Assets.email),
                    width: 24,
                    height: 24,
                  ),
                ),
                prefixIconConstraints: BoxConstraints(
                  minWidth: 34,
                  maxHeight: 34,
                  minHeight: 34,
                  maxWidth: 34,
                ),
                isDense: true,
                contentPadding: EdgeInsets.all(18)),
            keyboardType: TextInputType.name,
            maxLines: 1,
            cursorColor: Color(0xFFA7A9B7),
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Montserrat SemiBold',
              fontWeight: FontWeight.w400,
              height: 1.0,
            ),
          ),
        ),
      ),
    );
  }

  getPhoneField() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 52,
      margin: EdgeInsets.only(top: 5, left: 24, right: 24),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: phone ? Colors.red: Color(0xFFD8DADC),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Container(
          alignment: Alignment.center,
          child: TextFormField(
            controller: phoneController,
            focusNode: phoneNode,
            validator: (value){
              if(value==null || value.isEmpty){
                return 'Enter phone number';
              }else {return null;}
            },
            onChanged: (text) {
              setState(() {
                phone= false;
              });
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "123-456-789",
                hintStyle: TextStyle(
                  color: Color(0xFFA7A9B7),
                  fontSize: 14,
                  fontFamily: 'Montserrat SemiBold',
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                ),
                counterText: "",
                prefixIcon: Container(
                  margin: EdgeInsets.only(right: 8),
                  child: const Image(
                    image: AssetImage(Assets.phone),
                    width: 24,
                    height: 24,
                  ),
                ),
                prefixIconConstraints: BoxConstraints(
                  minWidth: 34,
                  maxHeight: 34,
                  minHeight: 34,
                  maxWidth: 34,
                ),
                isDense: true,
                contentPadding: EdgeInsets.all(18)),
            keyboardType: TextInputType.number,
            maxLength: 10,
            cursorColor: Color(0xFFA7A9B7),
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Montserrat SemiBold',
              fontWeight: FontWeight.w400,
              height: 1.0,
            ),
          ),
        ),
      ),
    );
  }

  getPasswordField() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 52,
      margin: EdgeInsets.only(top: 5, left: 24, right: 24),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: passwordController.text.isEmpty ? (pass ? Colors.red: Color(0xFFD8DADC)) :
                                                   (pass2 ? Colors.red : Color(0xFFD8DADC))
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Container(
          alignment: Alignment.center,
          child: TextFormField(
            controller: passwordController,
            focusNode:  passwordNode,
            validator: (value){
              if(value==null || value.isEmpty){
                return 'Enter password';
              }else {return null;}
            },
            onChanged: (text) {
              setState(() {
                pass = false;
                pass2 = false;
              });
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter your password",
                hintStyle: TextStyle(
                  color: Color(0xFFA7A9B7),
                  fontSize: 14,
                  fontFamily: 'Montserrat SemiBold',
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                ),
                counterText: "",
                prefixIcon: Container(
                  margin: EdgeInsets.only(right: 8),
                  child: const Image(
                    image: AssetImage(Assets.keyIcon),
                    width: 24,
                    height: 24,
                  ),
                ),
                prefixIconConstraints: BoxConstraints(
                  minWidth: 34,
                  maxHeight: 34,
                  minHeight: 34,
                  maxWidth: 34,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    !isVisible
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    //change icon based on boolean value
                    color: isVisible
                        ? HexColor("#838383")
                        : HexColor("#838383"),
                    size: 22,
                  ),
                  onPressed: () {
                    setState(() {
                      isVisible =
                      !isVisible; //change boolean value
                    });
                  },
                ),
                isDense: true,
                contentPadding: EdgeInsets.all(18)),
            keyboardType: TextInputType.name,
            obscureText: !isVisible,
            maxLines: 1,
            cursorColor: Color(0xFFA7A9B7),
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Montserrat SemiBold',
              fontWeight: FontWeight.w400,
              height: 1.0,
            ),
          ),
        ),
      ),
    );
  }

  confirmPassField() {
    return Container(
      padding: EdgeInsets.only(left: 12),
      margin: EdgeInsets.only(top: 5, left: 24, right: 24),
      height: 52,
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1,
            color: confPass ? Colors.red : Color(0xFFD8DADC),),
          borderRadius: BorderRadius.circular(12)
        )
      ),
      child: TextFormField(
        controller: confirmPassController,
        focusNode: confirmNode,
        validator: (value){
          if(value==null || value.isEmpty){
            return 'Please Enter your full name';
          }else if(value!=passwordController.text){
            return 'Passwaord is not matching';
          }
          else {return null;}
        },
        onChanged: (text) {
          setState(() {
            confPass = false;
          });
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Container(
            margin: EdgeInsets.only(right: 8),
            child: Image(
              image: AssetImage(Assets.keyIcon),
              height: 20,width: 20,
            ),
          ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 34,
              maxHeight: 34,
              minHeight: 34,
              maxWidth: 34,
            ),
          suffixIcon: Container(
            margin: EdgeInsets.only(right: 15),
            child: IconButton(
              icon: isPassVisible ?  Icon(Icons.visibility_off_rounded, color: HexColor('#747474'),size: 22,):
              Icon(Icons.visibility, color: HexColor('#747474'),size: 22,),
              onPressed: () {
                setState(() {
                  isPassVisible = !isPassVisible;
                });
              },
            ),
          ),
          hintText: 'Confirm password',
          hintStyle: TextStyle(
            color: Color(0xFFA7A9B7),
            fontSize: 14,
            fontFamily: 'Montserrat SemiBold',
            fontWeight: FontWeight.w400,
            height: 1.0,
          ),
          contentPadding: EdgeInsets.all(18),
          isDense: false
        ),
        maxLines: 1,
        cursorColor: Color(0xFFA7A9B7),
        obscureText: isPassVisible,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: 'Montserrat SemiBold',
          fontWeight: FontWeight.w400,
          height: 1.0,
        ),
      ),
    );

  }


  getTermsAndCheck() {
    return Container(
      alignment: Alignment.topLeft,
      child: Checkbox(
        checkColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        fillColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return const Color(0xFF005AC6);
              }
              return Colors.black12;
            }),
        side: const BorderSide(
          color: Colors.transparent,
          width: 0,
        ),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            //isChecked = value ?? false;
            isChecked = !isChecked;
            print('CheckBox Selected');
          });
        },
      ),
    );
  }


}
