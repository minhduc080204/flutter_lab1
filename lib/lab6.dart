import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
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
        home: QuizzlerScreen(),
    );
  }
}

class QuizzQuestion {
  static const List<String> question = [
    "1 + 1 = 3",
    "Bạn chưa có người yêu ư",
    "VKU là trường top 1 Miền Trung",
    "Trái Đất là hình tròn",
    "Minh Đức dẹp trai nhất VKU",
  ];
}

class QuizzlerScreen extends StatefulWidget{
  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<QuizzlerScreen>{

  int number = 0;
  Random random = Random();

  void answer() {
    setState(() {
      number=random.nextInt(5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*2/3,
            child: Center(
              child: Text(
                'Question: '+ QuizzQuestion.question[number],
                style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Column(
              spacing: 20,
              children: [
                Expanded(child: ElevatedButton(
                  onPressed: answer,
                  child: Text("True", style: TextStyle(color: Colors.white, fontSize: 20),),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: Size(double.infinity, 0)
                  ),
                )),
                Expanded(child: ElevatedButton(
                  onPressed: answer,
                  child: Text("False", style: TextStyle(color: Colors.white, fontSize: 20),),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: Size(double.infinity, 0)
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}