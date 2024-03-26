import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:printlific/screens/on_boarding_screen.dart';

import '../resources/assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> carouselItems = [
    Assets.silder_Image,
    Assets.silder_Image,
    Assets.silder_Image,
    Assets.silder_Image,
  ];

  CarouselController buttonCarouselController = CarouselController();
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: ExactAssetImage(Assets.background),fit: BoxFit.cover)
        ),
        child: Column(
          children: [
            appBar(),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                //  margin: EdgeInsets.only(),
                  child: CarouselSlider.builder(
                    itemCount: carouselItems.length,
                    carouselController: buttonCarouselController,
                    options: CarouselOptions(
                      //height: 380,
                      enlargeCenterPage: true,
                      viewportFraction: 0.75,
                      enlargeFactor: 0.1,
                      aspectRatio: 1 / 1,
                      //padEnds: true,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      initialPage: currentPage,
                      reverse: false,
                      pauseAutoPlayOnTouch: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentPage = index;
                         // print('current page');
                        });
                      },//how to give shadow inside the container from top right in flutter
                    ),
                    itemBuilder: (BuildContext context, int index, int realIndex) {
                      return Container(
                        // decoration: BoxDecoration(
                        //   boxShadow: [
                        //     BoxShadow(
                        //       color: Colors.red.withOpacity(0.5),
                        //       spreadRadius: 10,
                        //       blurRadius: 0,
                        //       offset: Offset(0, -5),
                        //     ),
                        //     BoxShadow(
                        //       color: Colors.grey.withOpacity(0.5),
                        //       spreadRadius: 20,
                        //       blurRadius: 7,
                        //       offset: Offset(3, 0),
                        //     ),
                        //   ],
                        // ),
                        margin: EdgeInsets.only(top: 0,left: 0,bottom: 10),
                        child: Image.asset(
                          carouselItems[index],    width: 250,height: 320,
                        //  fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
        
                Positioned(
                  left: MediaQuery.of(context).size.width/6, right: MediaQuery.of(context).size.width/6.2,
                  child: Container(
                    width: 250,
                    height: 370,
                     alignment: Alignment.center,
                    /*decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: -10,
                          blurRadius: 0,
                          offset: Offset(0, -5),
                        ),
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: -20,
                          blurRadius: 7,
                          offset: Offset(3, 0),
                        ),
                      ],
                    ),*/
                     //margin: EdgeInsets.only(top: 0,left: 35),
                     child: Container(
                       decoration: ShapeDecoration(
                         shape: RoundedRectangleBorder(),
                         image: DecorationImage(
                             image: AssetImage(Assets.Coframe),
                           //width: 250,
                           fit: BoxFit.fill,
                           // color: Colors.white,
                         ),
                         ),
                       // child: Stack(
                       //   children: [
                       //     Positioned(child: Image(
                       //    //   image: AssetImage(),
                       //     ))
                       //   ],
                       // )
                       // child: Container(
                       //   child: Image(image: AssetImage(Assets.Coframe),color: Colors.white,),
                       // ),
                       ),
                  ),
                ),

        
              ],
            ),

            Container(
              margin: EdgeInsets.only(top: 5),
              child: Image(image: AssetImage(Assets.ColorLine),
              width: MediaQuery.of(context).size.width,
                height: 2,
              ),
            ),
        
        
            Container(
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //     begin: Alignment.topLeft,
              //     end: Alignment.bottomRight,
              //     colors: [
              //       HexColor('#0066FF'),
              //       HexColor('#3250FF'),
              //       HexColor('#A020FF'),
              //     ]
              //   )
             // ),
              child: Column(
                children: [
                  Container(
                    //height: 250,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 16,left: 21),
                    child: Text(
                      'Shoot.\nUpload.\nCreate.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
        
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 21),
                          child: ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                colors: [
                                  HexColor('#0066FF'),
                                  HexColor('#3250FF'),
                                  HexColor('#A020FF'),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds);
                            },
                            child: Text(
                              'Start exploring',
                              style: TextStyle(
                                fontFamily: 'Montserrat SemiBold',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
        
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(CupertinoPageRoute(builder: (context) => OnBoardingScreen()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Image(image: AssetImage(Assets.gradient_icon),
                              height: 58,width: 58,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
        
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Login/',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                        ),
                        Text('SignUp',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
        
        
        
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(100.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        color: Colors.black,
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 30),
            child: Image(
              image: AssetImage(Assets.title_printlific),
              width: 200,
              height: 51,
            ),
          ),
        ),
      ),
    );
  }

  Widget getSlider(int index) {
    double scale = 2.2;
    if (currentPage == index) {
      scale = 1.2; // Increase size for the current image
    }
    return Transform.scale(
      scale: scale,
      child: Container(
        width: 304,
        height: 474,
        child: Image.asset(
          carouselItems[index],
          fit: BoxFit.cover,
        ),
      ),
    );
  }


}

