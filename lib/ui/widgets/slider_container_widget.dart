import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarthome_slider/core/enums/enum.dart';
import 'package:smarthome_slider/core/viewmodels/home_model.dart';
import 'package:smarthome_slider/ui/shared/globals.dart';
import 'package:smarthome_slider/ui/widgets/content_widget.dart';

class RectangleClipper extends CustomClipper<Rect> {
  final double offset;
  RectangleClipper({required this.offset});

  @override
  Rect getClip(Size size) {
    Rect rect = Rect.fromLTRB(offset, 0.0, size.width, size.height);
    return rect;
  }

  @override
  bool shouldReclip(RectangleClipper oldClipper) => true;
}

class SliderContainerWidget extends StatelessWidget {
  final Color color;
  final int index;

  const SliderContainerWidget(
      {super.key, required this.color, required this.index});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    final width = MediaQuery.of(context).size.width;

    Widget sliderAnimation() {
      return IgnorePointer(
        ignoring: true,
        child: Align(
          alignment: Alignment.centerLeft,
          child: AnimatedContainer(
            curve: Curves.easeInOutQuart,
            duration: Duration(
              milliseconds: model.state == ViewState.busy ? 0 : 500,
            ),
            width: model.widthValues[index] == -1
                ? model.getStartWidth(width)
                : model.widthValues[index],
            height: Global.boxHeight,
            decoration: BoxDecoration(
              color: model.switchValues[index]
                  ? Global.mediumBlue
                  : Global.darkGrey,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
            ),
          ),
        ),
      );
    }

    Widget sliderValues() {
      return IgnorePointer(
        ignoring: model.switchValues[index] ? false : true,
        child: SliderTheme(
          data: const SliderThemeData(
            trackHeight: Global.trackHeight,
            overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 100.0, right: 80.0),
            child: Slider(
              activeColor: Colors.transparent,
              inactiveColor: Colors.transparent,
              value: model.sliderValues[index],
              onChanged: (value) {
                model.setSliderValue(index, value);
                model.setWidth(index, width);
              },
            ),
          ),
        ),
      );
    }

    Widget cupertinoSwitch() {
      return Container(
        width: Global.boxWidth,
        height: Global.boxHeight,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: CupertinoSwitch(
          activeTrackColor: Colors.pinkAccent,
          value: model.switchValues[index],
          onChanged: (value) {
            model.setSwitchValues(index, value);
            model.setWidth(index, width); // Just like the startWidth
          },
        ),
      );
    }

    Widget content() {
      return IgnorePointer(
        ignoring: true,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SizedBox(
              height: 100,
              child: ContentWidget(
                color: Global.darkBlue,
                index: index,
              ),
            ),
            ClipRect(
              clipper: RectangleClipper(
                offset: model.getFormula(index, width),
              ),
              child: SizedBox(
                height: 100,
                child: AnimatedOpacity(
                  curve: Curves.easeInOutQuart,
                  opacity: model.switchValues[index] ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: ContentWidget(
                    color: Global.mediumBlue,
                    index: index,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        sliderAnimation(),
        sliderValues(),
        content(),
        cupertinoSwitch(),
      ],
    );
  }
}
