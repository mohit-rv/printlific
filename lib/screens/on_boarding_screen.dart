import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:printlific/resources/assets.dart';
import 'package:printlific/screens/login_signup_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {


  double imageSize = 100;

  @override
  void initState() {

    Future.delayed(Duration(milliseconds: 200), () {

      setState(() {
        imageSize = double.infinity;
      });

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
      InkWell(
        onTap: () {

          Navigator.of(context).push(CupertinoPageRoute(builder: (context) => LoginSignUpScreen()));

        },
        child: Container(
          height: 60,
          margin: EdgeInsets.only(left: 22, right: 22, bottom: 30),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            color: HexColor("#1F4CE0"),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              "Get Started",
              style: TextStyle(
                fontFamily: "Montserrat SemiBold",
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 40),
              child: Image(
                image: AssetImage(Assets.screenBgImg),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: imageSize,
                  height: 390,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 35, left: 20, right: 20),
                  child: AnimatedSize(
                    curve: Curves.fastOutSlowIn,
                    duration: Duration(seconds: 1),
                    child: Container(
                      alignment: Alignment.center,
                      child: Image(
                        image: AssetImage(Assets.onBoardingImg),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50, left: 22, right: 22),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Discover The",
                  style: TextStyle(
                    fontFamily: "Montserrat Bold",
                    fontSize: 40,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                //height: 90,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 15, right: MediaQuery.of(context).size.width / 3),
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(),
                  image: DecorationImage(
                      image: AssetImage(Assets.textBgImg),
                    fit: BoxFit.cover
                  ),
                ),
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 8),
                  child: Text(
                    "wonderful",
                    style: TextStyle(
                      fontFamily: "Montserrat Bold",
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 22, right: 22),
                alignment: Alignment.centerLeft,
                child: Text(
                  "world!",
                  style: TextStyle(
                    fontFamily: "Montserrat Bold",
                    fontSize: 40,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 22, right: 22),
                alignment: Alignment.centerLeft,
                child: Text(
                  "lorem ipsum dolor sit amet, dolor the consectetur adipiscing elit",
                  style: TextStyle(
                    fontFamily: "Montserrat Light",
                    fontSize: 17,
                    color: HexColor("#89807A"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
