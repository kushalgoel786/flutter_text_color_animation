import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Color> textColorList = [
    Colors.pink,
    Colors.orange,
    Colors.blue,
    Colors.purple,
  ];

  int activeColorIndex = 0;
  Color activeTextColor;

  void animateColor() {
    Timer timer = Timer.periodic(Duration(seconds: 2), (time) {
      setState(() {
        activeTextColor = textColorList[activeColorIndex];
      });
      // ++ in dart, operators in dart all and all
      activeColorIndex = activeColorIndex == 3 ? 0 : activeColorIndex + 1;
    });
  }

  @override
  void initState() {
    activeTextColor = textColorList[activeColorIndex];
    activeColorIndex++;
    animateColor();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
            ),
            height: 60.0,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 25.0),
                    //Applies Text Style to the whole Widget Tree in its child property
                    AnimatedDefaultTextStyle(
                      duration: Duration(seconds: 1),
                      child: Text("KUSHAL"),
                      style: TextStyle(
                        fontFamily: "JosefinSlab",
                        fontWeight: FontWeight.w200,
                        letterSpacing: 15.0,
                        fontSize: 30.0,
                        color: activeTextColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'ABCD2',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(width: 30.0),
                    Text(
                      'ABCD2',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(width: 30.0),
                    Text(
                      'ABCD2',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(width: 40.0),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//mouse region enter exit color animation stop
