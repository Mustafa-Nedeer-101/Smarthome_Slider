import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarthome_slider/core/models/models.dart';
import 'package:smarthome_slider/core/viewmodels/home_model.dart';
import 'package:smarthome_slider/ui/shared/globals.dart';

class ContentWidget extends StatelessWidget {
  final int index;
  final Color color;
  const ContentWidget({super.key, required this.index, required this.color});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    final homeData = HomeData.fromMap(Global.homeItems[index]);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          height: 100,
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(homeData.icon, color: Global.darkBlue),
              Text(
                model.switchValues[index]
                    ? '${(model.sliderValues[index] * 100).round()}%'
                    : 'Off',
                style: const TextStyle(
                  color: Global.darkBlue,
                  fontSize: 14.0,
                  fontFamily: 'Sf',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              homeData.location,
              style: TextStyle(
                color: color,
                fontSize: 16.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              homeData.power,
              style: TextStyle(color: color),
            ),
          ],
        ),
      ],
    );
  }
}
