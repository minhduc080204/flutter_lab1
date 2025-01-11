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
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('I am Richessssssssssssss'),),
          ),
          body: Center(
              child: Column(
                children: <Widget>[
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiEn5X6_FIewxinf57HUeNe_DVlfwVZTP3EQ&s',
                    // URL của hình ảnh
                    width: 600,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                ],
              )
          ),
        )
    );
  }
}