import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:printlific/resources/assets.dart';
import 'package:printlific/screens/on_boarding_screen.dart';
import 'package:printlific/utils/list_animation_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    timeDilation = 5.0;

    Future.delayed(Duration(seconds: 5), () {

      timeDilation = 1.0;

      Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => const OnBoardingScreen()));

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: HexColor("#1F4CE0"),
      body: Stack(
        children: [
          ListAnimation(),
          Container(
            color: HexColor("#1F4CE0E0").withOpacity(0.5),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Card(
              color: Colors.transparent,
              borderOnForeground: false,
              semanticContainer: false,
              shadowColor: Colors.transparent,
              child: Container(
                margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/5, right: MediaQuery.of(context).size.width/5, bottom: MediaQuery.of(context).size.width/3),
                height: 60,
                child: Image(
                  image: AssetImage(Assets.nameImg),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
