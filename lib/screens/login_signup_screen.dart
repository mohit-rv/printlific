import 'dart:async';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:printlific/resources/assets.dart';
import 'package:printlific/screens/otp_varification_screen.dart';
import 'package:printlific/shared_preference/session_manager.dart';
import 'package:printlific/utils/common_functions.dart';
import 'package:printlific/wigets/common_button.dart';

class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({super.key});

  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {

  late TextEditingController _phoneController;
  final FocusNode _phoneNode = FocusNode();

  var countryCode = "+91";


  @override
  void initState() {
    _phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {

      },
      child: Scaffold(
        appBar: null,
        bottomNavigationBar: CommonButton(
            onTap: () async {

              if (!CommonFunctions().isPhoneNoValid(_phoneController.text)) {

                _phoneNode.requestFocus();

                Fluttertoast.showToast(msg: "Please enter a valid phone number");

              } else {

                await SessionManager().saveUserPhoneNo(_phoneController.text);
                await SessionManager().saveUserPhoneCode(countryCode);

                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => OTPVerificationScreen()));

              }

        },
            title: "Next"
        ),
        body: Stack(
          children: [
            Container(
              //margin: EdgeInsets.only(bottom: 40),
              height: 180,
              child: Image(
                image: AssetImage(Assets.screenBgImg),
                fit: BoxFit.fill,
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    color: Colors.transparent,
                    padding: EdgeInsets.only(top: 60, left: 23),
                    child: Image(
                      image: AssetImage(Assets.backIcon),
                      width: 19,
                      height: 19,
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  child: Image(
                    image: AssetImage(Assets.loginLogo),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 70, left: 22, right: 22),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Log in or Sign up\nto continue",
                    style: TextStyle(
                      fontFamily: "Montserrat Bold",
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16, left: 22, right: 22),
                  alignment: Alignment.centerLeft,
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: "We will send you an",
                        style: TextStyle(
                          fontFamily: "Montserrat Regular",
                          fontSize: 14,
                          color: HexColor("#606268"),
                        ),
                      ),
                      TextSpan(
                        text: " One Time Password\n(OTP)",
                        style: TextStyle(
                          fontFamily: "Montserrat Semibold",
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: " on this mobile number.",
                        style: TextStyle(
                          fontFamily: "Montserrat Regular",
                          fontSize: 14,
                          color: HexColor("#606268"),
                        ),
                      ),
                    ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40, left: 22,),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter mobile no.*",
                    style: TextStyle(
                      fontFamily: "Montserrat Regular",
                      fontSize: 15,
                      color: HexColor("#747474"),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      //padding: EdgeInsets.all(12),
                      margin: EdgeInsets.only(left: 22, right: 8, top: 8),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: HexColor("#DFDFDF"), width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            child: CountryCodePicker(
                              onChanged: (element) {
                                print(element.dialCode.toString());
                                setState(() {
                                  countryCode = element.dialCode.toString();
                                });
                              },
                              // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                              initialSelection: countryCode,
                              // optional. Shows only country name and flag
                              showCountryOnly: false,
                              showFlag: true,
                              // optional. Shows only country name and flag when popup is closed.
                              showOnlyCountryWhenClosed: false,
                              textStyle: TextStyle(
                                color: Color(0xFF191D31),
                                fontSize: 14,
                                fontFamily: 'Montserrat SemiBold',
                                fontWeight: FontWeight.w400,
                                height: 1,
                              ),
                              // optional. aligns the flag and the Text left
                              alignLeft: false,
                              searchDecoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search",
                                hintStyle: TextStyle(
                                  color: Color(0xFF94969D),
                                  fontSize: 15,
                                  fontFamily: 'Montserrat SemiBold',
                                  fontWeight: FontWeight.w400,
                                  height: 1.0,
                                  letterSpacing: -0.15,
                                ),
                                counterText: "",
                                isDense: true,
                                prefixIcon: Container(
                                  margin: EdgeInsets.only(right: 14),
                                  child: Image(
                                    image: AssetImage(Assets.searchIcon),
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                                prefixIconConstraints: BoxConstraints(
                                    minWidth: 30,
                                    maxWidth: 30,
                                    minHeight: 30,
                                    maxHeight: 30),
                                contentPadding: EdgeInsets.all(18),
                              ),
                              flagDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                              ),
                              searchStyle: TextStyle(
                                color: Color(0xFF191D31),
                                fontSize: 15,
                                fontFamily: 'Montserrat SemiBold',
                                fontWeight: FontWeight.w400,
                                height: 1.0,
                              ),
                              padding: EdgeInsets.all(0),
                              dialogTextStyle: TextStyle(
                                color: Color(0xFF394A5D),
                                fontSize: 12,
                                fontFamily: 'Montserrat SemiBold',
                                fontWeight: FontWeight.w400,
                                height: 1,
                              ),
                              flagWidth: 30,
                              boxDecoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:  BorderRadius.circular(30),
                              ),
                              dialogSize: Size(
                                  MediaQuery.of(context).size.width * 0.9,
                                  MediaQuery.of(context).size.height * 0.8
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 8),
                            child: Image(
                              image: AssetImage(Assets.codePickerArrow),
                              width: 20,
                              height: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8.5),
                        margin: EdgeInsets.only(right: 22, top: 8),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: _phoneController.text.isNotEmpty ? HexColor("#1999B5") : HexColor("#DFDFDF"),
                                width: 1.0
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(left: 8),
                          child: TextFormField(
                            controller: _phoneController,
                            focusNode: _phoneNode,
                            onChanged: (text) {
                              setState(() {

                              });
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your number",
                              hintStyle: TextStyle(
                                color: Color(0xFFA7A9B7),
                                fontSize: 15,
                                fontFamily: 'Montserrat SemiBold',
                                fontWeight: FontWeight.w400,
                                height: 1.0,
                              ),
                              counterText: "",
                              isDense: true,
                            ),
                            keyboardType: TextInputType.phone,
                            keyboardAppearance: Brightness.dark,
                            maxLines: 1,
                            maxLength: 10,
                            cursorColor: Color(0xFF394A5D),
                            style: TextStyle(
                              color: Color(0xFF191D31),
                              fontSize: 15,
                              fontFamily: 'Montserrat SemiBold',
                              fontWeight: FontWeight.w400,
                              height: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Text(
                    "Don’t have account?",
                    style: TextStyle(
                      fontFamily: "Montserrat Regular",
                      fontSize: 14,
                      color: HexColor("#606268"),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "Continue without account",
                    style: TextStyle(
                      fontFamily: "Montserrat Semibold",
                      fontSize: 14,
                      color: HexColor("#1999B5"),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }



}
