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
  int number = 1;
  Random random = Random();

  void increment() {
    setState(() {
      number=random.nextInt(5)+1;
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
                  Text('ASK THE BALL'),
                  TextButton(
                    onPressed: increment,
                      child: Image.asset(
                        'assets/images/ball$number.png',
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                  ),
                ]
            )
        )
    );
  }
}
