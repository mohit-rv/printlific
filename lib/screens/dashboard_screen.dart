//import 'package:card_slider/card_slider.dart';
import 'dart:ui';

import 'package:card_slider/card_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:printlific/resources/assets.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  List<Widget> valuesWidget = [];

  final List<String> images = [
    'https://fastly.picsum.photos/id/859/500/800.jpg?hmac=wRNre6VOBM2FFa7uQBD4pjl_dhELSRWDVHJ45cwL1c4',
    'https://fastly.picsum.photos/id/859/500/800.jpg?hmac=wRNre6VOBM2FFa7uQBD4pjl_dhELSRWDVHJ45cwL1c4',
    'https://fastly.picsum.photos/id/859/500/800.jpg?hmac=wRNre6VOBM2FFa7uQBD4pjl_dhELSRWDVHJ45cwL1c4',
  ];

  int currentPage = 0;

  @override
  void initState() {



    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    valuesWidget.clear();

    valuesWidget.add(
        Container(
            //height: MediaQuery.of(context).size.height * 0.8,
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
                ),
                image: DecorationImage(
                    image: AssetImage(Assets.dashboardSliderImg),
                    fit: BoxFit.fill
                )
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 1.0,
                sigmaY: 0.0,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
                    ),
                    image: DecorationImage(
                        image: AssetImage(Assets.dashboardSliderBg),
                        fit: BoxFit.fill
                    )
                ),
                /*child: Stack(
                  children: [
                    Image(
                      image: AssetImage(Assets.dashboardSliderImg),
                      fit: BoxFit.cover,
                    ),
                    Image(
                      image: AssetImage(Assets.dashboardSliderBg),
                      fit: BoxFit.fill,
                    )
                  ],
                ),*/
              ),
            )

          /*Align(
              alignment: Alignment.center,
              child: Text(
                "Slider",
                style: const TextStyle(
                    fontSize: 28,
                    color: Colors.white
                ),
              ),
            ),*/
        ),
    );

    valuesWidget.add(
        Container(
            //height: MediaQuery.of(context).size.height * 0.8,
            margin: EdgeInsets.only(left: 20, right: 20),
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
                ),
                image: DecorationImage(
                    image: AssetImage(Assets.dashboardSliderImg),
                    fit: BoxFit.fill
                )
              //color: Colors.black.withOpacity(0.8)
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 1.0,
                sigmaY: 0.0,
              ),
              child: Container(
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
                    ),
                    /*image: DecorationImage(
                        image: AssetImage(Assets.dashboardSliderBg),
                        fit: BoxFit.fill
                    ),*/
                  color: Colors.white.withOpacity(0.8),
                  //color: Colors.black.withOpacity(0.8)
                ),
              ),
            )
          /*Stack(
              children: [
                Image(
                  image: AssetImage(Assets.dashboardSliderImg),
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Colors.black.withOpacity(0.8),
                )
                Image(
                  image: AssetImage(Assets.dashboardSliderBg),
                  fit: BoxFit.fill,
                )
              ],
            )

          Align(
              alignment: Alignment.center,
              child: Text(
                "Slider2",
                style: const TextStyle(
                    fontSize: 28,
                    color: Colors.white
                ),
              ),
            ),*/
        ),
    );

    valuesWidget.add(
        Container(
            //height: MediaQuery.of(context).size.height * 0.8,
          margin: EdgeInsets.only(left: 40, right: 40),
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
                ),
                image: DecorationImage(
                    image: AssetImage(Assets.dashboardSliderImg),
                    fit: BoxFit.fill
                )
              //color: Colors.black.withOpacity(0.8)
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 1.0,
                sigmaY: 0.0,
              ),
              child: Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)
                    ),
                  ),
                  /*image: DecorationImage(
                        image: AssetImage(Assets.dashboardSliderBg),
                        fit: BoxFit.fill
                    ),*/
                  color: Colors.white.withOpacity(0.8),
                  //color: Colors.black.withOpacity(0.8)
                ),
              ),
            )
          /*Align(
              alignment: Alignment.center,
              child: Text(
                "Slider3",
                style: const TextStyle(
                    fontSize: 28,
                    color: Colors.white
                ),
              ),
            ),*/
        ),
    );

    return Scaffold(
      appBar: null,
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        //height: 300,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
          ),
          /*image: DecorationImage(
            image: AssetImage(Assets.dashboardSliderBg),
            fit: BoxFit.fill
          )*/
        ),
        /*child: PageView.builder(
          itemCount: images.length,
          scrollDirection: Axis.vertical,
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
          itemBuilder: (context, index) {

            double scale = 1.0 - (index / images.length) * 0.5;

            return Transform.scale(
              scale: scale,
              child: Card(
                margin: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
            return Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(images[index]),
                        fit: BoxFit.fill
                      ),
                      color: Colors.transparent
                    ),
                    child: Image.network(
                      images[index],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            );
          },
        ),*/

        child : GestureDetector(
          onVerticalDragStart: (dragDetails) {

            print(dragDetails.globalPosition);
            print(dragDetails.localPosition);

          },
          child: CardSlider(
            cards: valuesWidget,
            bottomOffset: .0020,
            cardWidth: MediaQuery.of(context).size.width,
            //cardHeight: MediaQuery.of(context).size.height * 0.8,
            containerHeight: MediaQuery.of(context).size.height - 100,
            cardHeight: 1.6,
            itemDotOffset: 0.75,
            itemDotWidth: 10,
            blurValue: 0,
            itemDot: (index) {
              print(index);

              return Container(
              );
            },
            //containerHeight: MediaQuery.of(context).size.height * 0.8,
          ),
        ),
      ),
    );
  }

}
