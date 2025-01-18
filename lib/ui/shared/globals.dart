import 'package:flutter/material.dart';

class Global {
  static const Color lightBlue = Color(0xffdee6f3);
  static const Color white = Color(0xff4A64FE);
  static const Color babyBlue = Color(0xff00deff);
  static const Color darkBlue = Color(0xff1c2a7f);
  static const Color lightBlack = Color(0xff201F22);
  static const Color mediumBlue = Color(0xffffffff);
  static const Color lightGrey = Color(0xfff1f3f6);
  static const Color darkGrey = Color(0xffa3a6a9);

  static const double sidePadding = 20.0;
  static const double boxWidth = 100.0;
  static const double boxHeight = 100.0;
  static const double trackHeight = 100.0;

  static final List<Map> homeItems = [
    {
      'location': 'Living Room',
      'power': '8.5 Kwh',
      'icon': Icons.lightbulb_outline
    },
    {
      'location': 'Kitchen',
      'power': '4.6 Kwh',
      'icon': Icons.lightbulb_outline
    },
    {
      'location': 'Bedroom',
      'power': '7.2 Kwh',
      'icon': Icons.lightbulb_outline
    },
  ];
}
