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
        home: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ColorNote(note: 'do'),
                  ColorNote(note: 're'),
                  ColorNote(note: 'mi'),
                  ColorNote(note: 'fa'),
                  ColorNote(note: 'sol'),
                  ColorNote(note: 'la'),
                  ColorNote(note: 'si'),
                ]
            )
        )
    );
  }
}

class ColorNote extends StatelessWidget{
  final String note;
  final Color color;
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> _playSound() async {
    await _audioPlayer.play(AssetSource('notes/$note.mp3'));
  }

  ColorNote({
    super.key,
    required this.note,
  }) : color=_getColor(note);

  static Color _getColor(String note){
    switch(note){
      case 'do':
        return Colors.red;
      case 're':
        return Colors.orange;
      case 'mi':
        return Colors.yellow;
      case 'fa':
        return Colors.green;
      case 'sol':
        return Colors.blue;
      case 'la':
        return Colors.purple;
      case 'si':
        return Colors.deepPurple;
      default :
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _playSound,
      child: Container(
        color: color,
        height: 100,
      ),
    );
  }
}
