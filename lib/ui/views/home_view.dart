import 'package:flutter/material.dart';
import 'package:smarthome_slider/ui/shared/globals.dart';
import 'package:smarthome_slider/ui/widgets/home_list_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Global.darkBlue,
      body: Padding(
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
        ),
        child: Center(
          child: HomeListWidget(),
        ),
      ),
    );
  }
}
