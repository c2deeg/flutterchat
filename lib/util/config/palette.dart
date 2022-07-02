import 'package:flutter/cupertino.dart';

class Palette {
  Palette._();

  //red
  static const red = Color(0xFFec1c24);
  static const redlight = Color(0xFFf64342);
  static const reddark = Color(0xFFc00004);
  static final redWithOpacityHigh = const Color(0xFFec1c24).withOpacity(.8);
  static final redWithOpacityMed = const Color(0xFFec1c24).withOpacity(.5);
  static final redWithOpacityLow = const Color(0xFFec1c24).withOpacity(.2);

  //neutral
  static const grey = Color(0xFFe7e8e8);
  static const black = Color.fromARGB(255, 0, 0, 0);
  static const white = Color.fromARGB(255, 255, 255, 255);

  //alt colors
  static const teal = Color(0xFF1cece5);
  static const purp = Color(0xFFec1c8b);
  static const orange = Color(0xFFec7d1c);
  static const yellow = Color(0xFFece51c);
  static const green = Color(0xFF23ec1c);

  //dark
  static const darkGrey = Color(0xFF121212);
  static const darkRed = Color(0xFF241314);
}
