import 'package:flutter/cupertino.dart';

class HomeData {
  String location;
  String power;
  IconData icon;
  HomeData.fromMap(data)
      : location = data['location'],
        power = data['power'],
        icon = data['icon'];
}
