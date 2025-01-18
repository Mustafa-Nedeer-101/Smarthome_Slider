import 'package:flutter/widgets.dart';
import 'package:smarthome_slider/core/enums/enum.dart';
import 'package:smarthome_slider/ui/shared/globals.dart';

class HomeModel extends ChangeNotifier {
  final List<double> _sliderValues = [1.0, 1.0, 1.0];
  List get sliderValues => _sliderValues;
  void setSliderValue(index, value) {
    setState(ViewState.busy);
    _sliderValues[index] = value;
    notifyListeners();
  }

  double getFormula(index, width) =>
      Global.boxWidth +
      sliderValues[index] *
          (width - Global.boxWidth * 2 - Global.sidePadding * 4);

  double getStartWidth(width) =>
      width - Global.sidePadding * 4 - Global.boxWidth;

  final List<double> _widthValues = [-1, -1, -1];
  get widthValues => _widthValues;
  void setWidth(index, width) {
    if (switchValues[index]) {
      _widthValues[index] = getFormula(index, width);
    } else {
      _widthValues[index] = width - Global.sidePadding * 4;
    }
    notifyListeners();
  }

  ViewState _state = ViewState.idle;
  get state => _state;
  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  final List<bool> _switchValues = [true, true, true];
  List get switchValues => _switchValues;
  void setSwitchValues(index, value) {
    setState(ViewState.idle);
    _switchValues[index] = value;
    notifyListeners();
  }
}
