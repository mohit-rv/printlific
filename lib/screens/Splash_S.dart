import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:printlific/screens/first_screen.dart';
import 'package:printlific/screens/on_boarding_screen.dart';

import '../resources/assets.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late final AnimationController _animationController1 = AnimationController(
    duration: Duration(seconds: 15),
    vsync: this,
  )..repeat(reverse: true);

  late final AnimationController _animationController2 = AnimationController(
    duration: Duration(seconds: 9),
    vsync: this,
  )..repeat(reverse: true);



  @override
  void dispose() {
    _animationController1.dispose();
    _animationController2.dispose();
    super.dispose();
  }
  late double initialTop=200;
  late double initialBottom=200;

  @override
  void initState() {
    super.initState();
    // Calculate initial positions based on screen dimensions
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        initialTop = MediaQuery.of(context).size.height * 0.75;
        initialBottom = MediaQuery.of(context).size.height * 0.4;
      });
    });

    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => const HomeScreen()));
    });
  }

  double small = 430;
  double big = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image(
              image: AssetImage(Assets.splash_back_Image),
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            bottom: 0,
            child: Container(
              height: 203,
              width: 603,
              decoration: BoxDecoration(
                image: DecorationImage(image: ExactAssetImage(Assets.Ellipse_14),
                fit: BoxFit.cover
                )
              ),
            ),
          ),

          movingBolls(_animationController1, Assets.Ellipse_16, initialTop),
          bottomMovingBoll(_animationController2, Assets.Ellipse_17, initialBottom),
          Center(
            child: Container(
              width: 578,
              height: 378,
              decoration: BoxDecoration(
               // color: Colors.transparent,
                image: DecorationImage(
                  image: ExactAssetImage(Assets.Ellipse_13),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black12.withOpacity(0.0),
                  ),
                ),
              ),
            ),
          ),


          Center(
            child: Container(
              width: 246,
              height: 95,
              child: Image(
                image: AssetImage(Assets.Frame_33),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget movingBolls(AnimationController animationController, String asset, double initialTop) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        double top = initialTop - (animationController.value * initialTop);
        //print(top);
        // Ensure the container stays within the visible area
        top = top.clamp(0, initialTop);
        return Positioned(
          right: 60,
          bottom: top,
          child: Container(
            height: 116,
            width: 116,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(asset),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black12.withOpacity(0.0),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget bottomMovingBoll(AnimationController animationController, String asset, double initialBottom) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        double bottom = initialBottom - (animationController.value * initialBottom);
        // Ensure the container stays within the visible area
        bottom = bottom.clamp(0, initialBottom);
        return Positioned(
          left: 60,
          bottom: bottom,
          child: Container(
            height: 87,
            width: 87,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(asset),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black12.withOpacity(0.0),
                ),
              ),
            ),
          ),
        );
      },
    );
  }


}

