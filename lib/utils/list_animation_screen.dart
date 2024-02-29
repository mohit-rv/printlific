import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:hexcolor/hexcolor.dart';

import '../resources/assets.dart';


class ListAnimation extends StatefulWidget {
  const ListAnimation({super.key});

  @override
  State<ListAnimation> createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation> {

  ScrollController _controller = ScrollController();
  ScrollController _controller2 = ScrollController();
  ScrollController _controller3 = ScrollController();

  List<String> _list = [
    Assets.splashImg1_1,
    Assets.splashImg1_2,
    //Assets.splashImg1_3,
    Assets.splashImg1_1,
    Assets.splashImg1_2,
    //Assets.splashImg1_3,
    Assets.splashImg1_1,
    Assets.splashImg1_2,
    //Assets.splashImg1_3,
    Assets.splashImg1_1,
    Assets.splashImg1_2,
    //Assets.splashImg1_3,
    Assets.splashImg1_1,
    Assets.splashImg1_2,
    /// etc...
  ];

  List<String> _list2_1 = [
    Assets.splashImg2_1,
    Assets.splashImg2_2,
    //Assets.splashImg2_3,
    Assets.splashImg2_1,
    Assets.splashImg2_2,
    //Assets.splashImg2_3,
    Assets.splashImg2_1,
    Assets.splashImg2_2,
    //Assets.splashImg2_3,
    Assets.splashImg2_1,
    Assets.splashImg2_2,
    //Assets.splashImg2_3,
    Assets.splashImg2_1,
    Assets.splashImg2_2,
    //Assets.splashImg2_3,
    /// etc...
  ];

  List<String> _list3_1 = [
    Assets.splashImg3_1,
    Assets.splashImg3_2,
   // Assets.splashImg3_3,
    Assets.splashImg3_1,
    Assets.splashImg3_2,
    //Assets.splashImg3_3,
    Assets.splashImg3_1,
    Assets.splashImg3_2,
    //Assets.splashImg3_3,
    Assets.splashImg3_1,
    Assets.splashImg3_2,
    //Assets.splashImg3_3,
    Assets.splashImg3_1,
    Assets.splashImg3_2,
    //Assets.splashImg3_3,
    /// etc...
  ];

  /// [_list2] holds duplicate data and is used to append to [_list].
  List<String> _list2 = [];
  List<String> _list2_2 = [];
  List<String> _list3_2 = [];

  bool _listAppended = false;
  bool _listAppended2 = false;
  bool _listAppended3 = false;

  @override
  void initState() {

    _list2.addAll(_list);
    _list2_2.addAll(_list2_1);
    _list3_2.addAll(_list3_1);

    /// To auto-start the animation when the screen loads.
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      /*Future.delayed(const Duration(milliseconds: 700), () {



      });*/

      setState(() {
        _startScroll();
      });

    });

    _controller.addListener(
          () {
        if (_controller.position.pixels >
            _controller.position.maxScrollExtent * 0.90) {
          if (_listAppended == false) {
            _list.addAll(_list2);
            _listAppended = true;
          }
        }

        /// The [_controller] will listen for when the animation cycle completes,
        /// so this can immediately re-start from the completed position.
        if (_controller.position.pixels ==
            _controller.position.maxScrollExtent) {
          _listAppended = false;
          setState(() {});
          WidgetsBinding.instance.addPostFrameCallback(
                (timeStamp) {
              _startScroll();
            },
          );
        }
      },
    );

    _controller2.addListener(
          () {
        if (_controller2.position.pixels >
            _controller2.position.maxScrollExtent * 0.90) {
          if (_listAppended2 == false) {
            _list2_1.addAll(_list2_2);
            _listAppended2 = true;
          }
        }

        /// The [_controller] will listen for when the animation cycle completes,
        /// so this can immediately re-start from the completed position.
        if (_controller2.position.pixels ==
            _controller2.position.maxScrollExtent) {
          _listAppended2 = false;
          setState(() {});
          WidgetsBinding.instance.addPostFrameCallback(
                (timeStamp) {
              _startScroll();
            },
          );
        }
      },
    );

    _controller3.addListener(
          () {
        if (_controller3.position.pixels >
            _controller3.position.maxScrollExtent * 0.90) {
          if (_listAppended3 == false) {
            _list3_1.addAll(_list3_2);
            _listAppended3 = true;
          }
        }

        /// The [_controller] will listen for when the animation cycle completes,
        /// so this can immediately re-start from the completed position.
        if (_controller3.position.pixels ==
            _controller3.position.maxScrollExtent) {
          _listAppended3 = false;
          setState(() {});
          WidgetsBinding.instance.addPostFrameCallback(
                (timeStamp) {
              _startScroll();
            },
          );
        }

        ScrollDirection scrollDirection = _controller3.position.userScrollDirection;
        if (scrollDirection != ScrollDirection.idle)
        {
          double scrollEnd = _controller3.offset + (scrollDirection == ScrollDirection.reverse
              ? 20
              : -20);
          scrollEnd = min(
              _controller3.position.maxScrollExtent,
              max(_controller3.position.minScrollExtent, scrollEnd));
          _controller3.jumpTo(scrollEnd);
        }
      },
    );

    /*Future.delayed(const Duration(seconds: 1), () {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: Duration(seconds: 1 * 10), curve: Curves.linear);
    });*/

    //👉 If you want infinite scrolling use the following code
    /*scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // Scroll has reached the end, reset the position to the beginning.
        scrollController.jumpTo(scrollController.position.minScrollExtent);
      }
    });*/

    /*WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 200), curve: Curves.easeOut);
      }
    });*/
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void _startScroll() {

    Future.delayed(Duration(milliseconds: 300), () {

      _controller.animateTo(_controller.position.maxScrollExtent,
          duration: Duration(milliseconds: 8000), curve: Curves.linear);

    });

    Future.delayed(Duration(milliseconds: 600), () {

      _controller2.animateTo(_controller2.position.maxScrollExtent,
          duration: Duration(milliseconds: 8000), curve: Curves.linear);

    });

    Future.delayed(Duration(milliseconds: 900), () {

      _controller3.animateTo(_controller3.position.maxScrollExtent,
          duration: Duration(milliseconds: 8000), curve: Curves.linear);

    });


  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    //executeAfterBuild();
    _runsAfterBuild();
    return Scaffold(
      backgroundColor: HexColor("#1F4CE0"),
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  controller: _controller,
                  reverse: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: _list.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        //width: 125,
                        //height: 131,
                        child: Image.asset(_list[index]),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  controller: _controller2,
                  reverse: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: _list2_1.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        //width: 125,
                        //height: 131,
                        child: Image.asset(_list2_1[index]),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  controller: _controller3,
                  reverse: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: _list3_1.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        //width: 125,
                        //height: 131,
                        child: Image.asset(_list3_1[index]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Container(
            color: HexColor("#1F4CE0").withOpacity(0.7),
          )
        ],
      ),
    );
  }

  Future<void> _runsAfterBuild() async {
    //timeDilation = 5.0;
    await Future.delayed(Duration.zero); // <-- Add a 0 dummy waiting time
    // This code runs after build ...
  }

  Future<void> executeAfterBuild() async {
    timeDilation = 5.0;
    await Future.delayed(Duration.zero);
    // this code will get executed after the build method
    // because of the way async functions are scheduled
  }
}
