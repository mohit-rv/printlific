import 'package:flutter/material.dart';
import 'package:printlific/wigets/common_appbar.dart';

class SelectSizeScreen extends StatefulWidget {
  const SelectSizeScreen({super.key});

  @override
  State<SelectSizeScreen> createState() => _SelectSizeScreenState();
}

class _SelectSizeScreenState extends State<SelectSizeScreen> {

  var itemsList = [
    {'isSelected': false, 'size': '4-piece 34x24','price': "''380.00"},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            CommonAppbar(title: 'Select Size'),

            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width*0.4
              ),
              child: Text('CHOOSE SIZE',
              style: TextStyle(
                fontFamily: 'Montserrat SemiBold',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 2,
                letterSpacing: 0.9
              ),),
            ),


            Container(
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [

                      ],
                    ),
                  )
                ],
              )
            )

          ],
        ),
      ),
    );
  }
}
