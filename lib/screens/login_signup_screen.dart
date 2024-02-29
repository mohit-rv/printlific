import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:printlific/resources/assets.dart';

class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({super.key});

  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
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
            ],
          )
        ],
      ),
    );
  }
}
