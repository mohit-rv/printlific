import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:printlific/screens/select_category.dart';
import 'package:printlific/wigets/common_button.dart';

import '../resources/assets.dart';
import 'create_account_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();



  FocusNode passwordNode = FocusNode();
  FocusNode emailNode = FocusNode();

  bool isVisible = false;
  bool isSelect = false;
  bool emailError = false;
  bool passError = false;
  bool pass2Error = false;
  bool validEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
              _appBar(),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Login your account',
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

            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Still don’t have an account?',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: "Montserrat Regular",
                    fontSize: 13,
                    color: HexColor('#606268'),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(CupertinoPageRoute(builder: (context) => CreateAccountScreen()));
                    print(' Register');
                  },
                  child: Text(' Register',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: "Montserrat SemiBold",
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
            emailController.text.isEmpty ?  Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 25),
              child: Text(emailError ? 'Enter email id': '',style: TextStyle(
                  fontFamily: "Montserrat SemiBold",
                  fontSize: 13,
                  color: Colors.red)),
            ):
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 25),
              child: Text(
                  validEmail ? 'Enter valid email id': '',style: TextStyle(
                  fontFamily: "Montserrat SemiBold",
                  fontSize: 13,
                  color: Colors.red)),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 25,top: 2),
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
            Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 25),
                child: passController.text.isEmpty ? Text(
                    passError ? 'Enter Password': '',style: TextStyle(
                    fontFamily: "Montserrat SemiBold",
                    fontSize: 13,
                    color: Colors.red)) :
                Text(
                    pass2Error ? 'Password length should be at leat 8': '',style: TextStyle(
                    fontFamily: "Montserrat SemiBold",
                    fontSize: 13,
                    color: Colors.red))

            ),


            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                   getTermsAndCheck(),
                  Text('Keep me logged in',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: "Montserrat Light",
                      fontSize: 12,
                      color: HexColor('#747474'),
                    ),
                  ),


                  Container(
                    margin: EdgeInsets.only(left: 50),
                    child: Text('Forgot password?',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: "Montserrat Light",
                        fontSize: 12,
                        color: HexColor('#747474'),
                      ),
                    ),
                  ),


                ],
              ),
            ),



            Container(
              margin: EdgeInsets.only(top: 20),
              child: CommonButton(
              //     onTap: (){
              //
              //      if(emailController.text.isEmpty){
              //            setState(() {
              //              emailError = true;
              //            });
              //         if(passController.text.isEmpty){
              //          setState(() {
              //          passError = true;
              //        });
              //      }
              //      emailNode.requestFocus();
              //      }
              //      else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              //          .hasMatch(emailController.text)){
              //          setState(() {
              //            validEmail = true;
              //          });
              //      }
              //      else if(passController.text.isEmpty){
              //        setState(() {
              //          passError = true;
              //        });
              //        passwordNode.requestFocus();
              //      }
              //      else if(!RegExp(r'^.{8,}$').hasMatch(passController.text)) {
              //          setState(() {
              //            pass2Error = true;
              //          });
              //          print('at least 8 length');
              //      }
              //      else {
              //        setState(() {
              //          emailError = false;
              //          passError = false;
              //        });
              //        Navigator.of(context).push(CupertinoPageRoute(builder: (context) => SelectCategoryScreen()));
              //        print('succesfully login');
              //      }
              //
              // },


                onTap: (){
                  Navigator.of(context).push(CupertinoPageRoute(builder: (context) => SelectCategoryScreen()));
                },
                  title: 'Login'),
            ),

            Container(
              margin: EdgeInsets.only(top: 0),
              width: MediaQuery.of(context).size.width,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(image: AssetImage(Assets.oppline),height: 1,width: 98,),
                  Text('Or Login up with',
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
                 fit: BoxFit.cover,
                ),
              ),
            ),


            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              radius: 100,
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 18,
                height: 18,
                margin: EdgeInsets.only(top: 50,left: 10),
                child: Image(
                  image: AssetImage(Assets.backIcon),
                  color: Colors.black,
                ),
              ),
            ),


            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 100,),
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
            color: emailController.text.isEmpty ? (emailError ? Colors.red: Color(0xFFD8DADC)) :
                                                  (validEmail ? Colors.red:  Color(0xFFD8DADC))
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
                emailError = false;
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
            color: passController.text.isEmpty ? (passError ? Colors.red: Color(0xFFD8DADC)) :
                                                (pass2Error ? Colors.red: Color(0xFFD8DADC) )
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
            controller: passController,
            focusNode:  passwordNode,
            validator: (value){
              if(value==null || value.isEmpty){
                return 'Enter password';
              }else {return null;}
            },
            onChanged: (text) {
              setState(() {
                 passError = false;
                 pass2Error = false;
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
        value: isSelect,
        onChanged: (bool? value) {
          setState(() {
            //isChecked = value ?? false;
            isSelect = !isSelect;
            print('CheckBox Selected');
          });
        },
      ),
    );
  }

}
