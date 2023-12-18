import 'package:flutter/material.dart';

class ToDoColor{

  static const List<Color> predefinedColors = [
    Colors.red,
    Colors.blueGrey,
    Colors.yellow,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.teal,
    Colors.orange
  ];

  final int colorIndex;

  ToDoColor({required this.colorIndex});



  Color get color => predefinedColors[colorIndex];
}


