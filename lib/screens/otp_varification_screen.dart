import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:printlific/screens/dashboard_screen.dart';
import 'package:printlific/shared_preference/session_manager.dart';
import 'package:printlific/wigets/common_button.dart';

import '../resources/assets.dart';

class OTPVerificationScreen extends StatefulWidget {



  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {

  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();

  var userPhone = "";
  var phoneCode = "";
  bool invalidOtp = false;
  var otp = "";
  bool isResendOTP = true;

  int currentSeconds = 0;
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 30;
  late Timer timer;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int? milliseconds]) {
    var duration = interval;
    timer = Timer.periodic(duration, (timer) {
      setState(() {
        print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds){
          timer.cancel();
          isResendOTP = false;
        }
      });
    });
  }

  @override
  void initState() {

    getUserData();
    startTimeout();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CommonButton(
        title: "Submit",
        onTap: () {

          if (otp != "123456") {

            setState(() {
              invalidOtp = true;
            });

          } else {

            showPopup();

          }

        },
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
                  "OTP Verification",
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
                      text: "Enter the code from the sms we sent to\n",
                      style: TextStyle(
                        fontFamily: "Montserrat Regular",
                        fontSize: 14,
                        color: HexColor("#606268"),
                      ),
                    ),
                    TextSpan(
                      text: "${phoneCode} ${userPhone}",
                      style: TextStyle(
                        fontFamily: "Montserrat Semibold",
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                  ),
                ),
              ),
              isResendOTP ? Container(
                margin: EdgeInsets.only(top: 50),
                child: Text(
                  timerText,
                  style: TextStyle(
                    fontFamily: "Montserrat Bold",
                    fontSize: 16,
                    color: HexColor("#1999B5"),
                  ),
                ),
              ) : Container(
                margin: EdgeInsets.only(top: 70),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: OtpPinField(
                    key: _otpPinFieldController,
                    autoFillEnable: false,

                    ///for Ios it is not needed as the SMS autofill is provided by default, but not for Android, that's where this key is useful.
                    textInputAction: TextInputAction.done,

                    ///in case you want to change the action of keyboard
                    /// to clear the Otp pin Controller
                    onSubmit: (text) {
                      print('Entered pin is $text');
                      otp = text;
                      setState(() {

                      });
                      /// return the entered pin
                    },
                    onChange: (text) {
                      print('Enter on change pin is $text');
                      setState(() {
                        invalidOtp = false;
                      });
                      /// return the entered pin
                    },
                    onCodeChanged: (code) {
                      print('onCodeChanged  is $code');
                    },

                    /// to decorate your Otp_Pin_Field
                    otpPinFieldStyle: OtpPinFieldStyle(
                      /// border color for inactive/unfocused Otp_Pin_Field
                      defaultFieldBorderColor: invalidOtp ? HexColor("#EB4335") :HexColor("#DFDFDF"),

                      /// border color for active/focused Otp_Pin_Field
                      activeFieldBorderColor: HexColor("#1999B5"),

                      /// Background Color for inactive/unfocused Otp_Pin_Field
                      defaultFieldBackgroundColor: Colors.white,

                      /// Background Color for active/focused Otp_Pin_Field
                      activeFieldBackgroundColor: Colors.white,

                      /// Background Color for filled field pin box
                      filledFieldBackgroundColor: Colors.white,

                      /// border Color for filled field pin box
                      filledFieldBorderColor:  invalidOtp ? HexColor("#EB4335") : HexColor("#1999B5"),

                      fieldBorderRadius: 7.0,
                      fieldBorderWidth: 1.0,

                    ),
                    maxLength: 6,

                    /// no of pin field
                    showCursor: true,

                    /// bool to show cursor in pin field or not
                    cursorColor: Colors.indigo,

                    /// to choose cursor color
                    /*upperChild: Column(
                      children: [
                        SizedBox(height: 30),
                        Icon(Icons.flutter_dash_outlined, size: 150),
                        SizedBox(height: 20),
                      ],
                    ),
                    middleChild: Column(
                      children: [
                        SizedBox(height: 30),
                        ElevatedButton(
                            onPressed: () {
                              _otpPinFieldController.currentState?.clearOtp(); // clear controller
                            },
                            child: Text('clear OTP')),
                        SizedBox(height: 10),
                        ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage())), child: Text('Next Class')),
                        SizedBox(height: 30),
                      ],
                    ),*/
                    //showCustomKeyboard: true,

                    ///bool which manage to show custom keyboard
                    // customKeyboard: Container(),
                    /// Widget which help you to show your own custom keyboard in place if default custom keyboard
                    showDefaultKeyboard: true,

                    ///bool which manage to show default OS keyboard
                    //cursorWidth: 3,

                    /// to select cursor width
                    mainAxisAlignment: MainAxisAlignment.center,

                    /// place otp pin field according to yourself

                    /// predefine decorate of pinField use  OtpPinFieldDecoration.defaultPinBoxDecoration||OtpPinFieldDecoration.underlinedPinBoxDecoration||OtpPinFieldDecoration.roundedPinBoxDecoration
                    ///use OtpPinFieldDecoration.custom  (by using this you can make Otp_Pin_Field according to yourself like you can give fieldBorderRadius,fieldBorderWidth and etc things)
                    otpPinFieldDecoration: OtpPinFieldDecoration.defaultPinBoxDecoration
                ),

                /*OtpTextField(
                  numberOfFields: 6,
                  //borderColor: HexColor("#1999B5"),
                  enabledBorderColor: invalidOtp ? HexColor("#EB4335") :HexColor("#DFDFDF"),
                  focusedBorderColor: HexColor("#1999B5"),
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  fieldWidth: 48,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  textStyle: TextStyle(
                    fontFamily: "Montserrat Semibold",
                    fontSize: 24,
                    color: Colors.black,
                  ),
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                    setState(() {
                      invalidOtp = false;
                    });
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode){
                    print(verificationCode);
                    otp = verificationCode;
                    setState(() {

                    });
                    *//*showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text("Verification Code"),
                            content: Text('Code entered is $verificationCode'),
                          );
                        }
                    );*//*
                  }, // end onSubmit
                ),*/
              ),
              !isResendOTP ? Container(
                margin: EdgeInsets.only(top: 16),
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        "I didn't receive any code.",
                        style: TextStyle(
                          fontFamily: "Montserrat Regular",
                          fontSize: 14,
                          color: HexColor("#606268"),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {

                        startTimeout();

                        setState(() {
                          isResendOTP = true;
                        });


                      },
                      child: Container(
                        child: Text(
                          "Resend",
                          style: TextStyle(
                            fontFamily: "Montserrat Semibold",
                            fontSize: 14,
                            color: HexColor("#1999B5"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ) : Container(

              )
            ],
          )
        ],
      ),
    );
  }

  showPopup() {
    showModalBottomSheet(
        context: context,
        enableDrag: false,
        isDismissible: false,
        useRootNavigator: true,
        //bounce: false,
        elevation: 8,
        barrierColor: Colors.black54,
        backgroundColor: Colors.white,
        //closeProgressThreshold: 0.3,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(38),
            topLeft: Radius.circular(38),
          ),
        ),
        builder: (builder) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter mystate) {
                return AnimatedPadding(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeOut,
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: getPopupWidget() //childWidget(mystate, type)
                );
                /*SingleChildScrollView(
              child: AnimatedPadding(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeOut,
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: childWidget(mystate, type)),
            );*/
              });
        }
    );
  }

  getPopupWidget() {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Container(
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(38),
                topRight: Radius.circular(38),
              ),
            ),
            color: Colors.white
        ),
        child: Stack(
          children: [
            Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(38),
                    topRight: Radius.circular(38),
                  ),
                ),
              ),
              child: Image(
                image: AssetImage(Assets.registerSuccessPopupBg),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              //height: 547,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 0.2),
                  colors: [Color(0x00FDFDFE), Colors.white],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(38),
                    topRight: Radius.circular(38),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        'Register Successfully',
                        style: TextStyle(
                          color: Color(0xFF191D31),
                          fontSize: 20,
                          fontFamily: 'Montserrat bold',
                          fontWeight: FontWeight.w600,
                          height: 1.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'Congratulation! your account is created.\nPlease login to get amazing experience.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFA7A9B7),
                          fontSize: 14,
                          fontFamily: 'Montserrat Semibold',
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 26),
                      child: CommonButton(
                        onTap: () {

                          timer.cancel();
                          Navigator.of(context).pop();
                          Navigator.of(context).push(CupertinoPageRoute(builder: (context) => DashboardScreen()));


                        },
                        title: "Go to Homepage",
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getUserData() async {

    userPhone = (await SessionManager().getUserPhoneNo()).toString();
    phoneCode = (await SessionManager().getUserPhoneCode()).toString();

    setState(() {

    });

  }
}
