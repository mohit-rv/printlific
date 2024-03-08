import 'package:flutter/material.dart';

import '../resources/assets.dart';

class CommonAppbar extends StatelessWidget {
  final String title;
  const CommonAppbar({required this.title});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, 400),
      child: Container(
        //margin: EdgeInsets.only(bottom: 50),
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Stack(
          children: [
            Container(
              height: 140,
              width: MediaQuery.of(context).size.width,
              child: Container(
                child: Image(image: AssetImage(Assets.bockground),
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
                    margin: EdgeInsets.only(top: 40,left: 10,bottom: 60),
                    child: Image(
                      image: AssetImage(Assets.backIcon),
                      color: Colors.black,
                    ),
                  ),
                ),

                Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(top: 40,left: 5,bottom: 30),
                    child: Text(title,
                      style: TextStyle(
                        color: Color(0xff020623),
                        fontSize: 16,
                        fontFamily: 'Montserrat SemiBold',
                        fontWeight: FontWeight.w600,
                        height: 1.0,
                      ),

                    )),

          ],
        ),
      ),
    );
  }
}
