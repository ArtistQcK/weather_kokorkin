import 'dart:math';

import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  final Random _random = Random();
  bool isSwitched = false;
  Color _color = Colors.blueAccent;
  Color get colorValue => _color;

  void changeSwitch(bool value) {
    isSwitched = value;
    _color = Color(_random.nextInt(0xFFFFFFFF));
    notifyListeners();
  }

  // void changeColor() {
  //   _color = Color(_random.nextInt(0xFFFFFFFF));
  //   notifyListeners();
  // }
}


// class CountProvider extends ChangeNotifier {
//   int _count = 0;
//   int get counterValue => _count;

//   void _incrementCount() {
//     _count++;
//     notifyListeners();
//   }

//   void _decrementCount() {
//     _count--;
//     notifyListeners();
//   }
// }