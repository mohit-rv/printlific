

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:printlific/resources/assets.dart';

class CommonRow extends StatelessWidget {

  final String title;
  const CommonRow({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return    Row(
      children: [
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
            margin: EdgeInsets.only(top: 50
                ,left: 10,bottom: 26),
            child: Image(
              image: AssetImage(Assets.backIcon),
              color: Colors.black,
            ),
          ),
        ),

        Expanded(
          child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.topCenter,
              //margin: EdgeInsets.only(top: 45,left: 80,bottom: 26),
              margin: EdgeInsets.only(top: 48,bottom: 26),
              child: Text(title,
                style: TextStyle(
                  color: Color(0xff020623),
                  fontSize: 16,
                  fontFamily: 'Montserrat SemiBold',
                  fontWeight: FontWeight.w600,
                  height: 1.0,
                ),

              )),
        ),
      ],
    );
  }
}
