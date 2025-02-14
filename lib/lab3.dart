import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: DicerScreen());
  }
}

class DicerScreen extends StatefulWidget {
  @override
  _DicerScreenState createState() => _DicerScreenState();
}

class _DicerScreenState extends State<DicerScreen> {
  int dice1 = 1;
  int dice2 = 1;
  Random random = Random();

  void increment() {
    setState(() {
      dice1=random.nextInt(6)+1;
      dice2=random.nextInt(6)+1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('DUC8888'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        './images/dice$dice1.png',
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 20),
                      Image.asset(
                        './images/dice$dice2.png',
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  FloatingActionButton(onPressed: increment, child: Icon(Icons.circle))
                ]
            )
        )
    );
  }
}
