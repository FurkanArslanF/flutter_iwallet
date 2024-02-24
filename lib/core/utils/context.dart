import 'package:flutter/material.dart';

extension ResponsiveContext on BuildContext {
  double get _screenWidth => MediaQuery.of(this).size.width;
  double get _screenHeight => MediaQuery.of(this).size.height;

  double responsiveWidth(double percentage) {
    return _screenWidth * percentage / 100.0;
  }

  double responsiveHeight(double percentage) {
    return _screenHeight * percentage / 100.0;
  }

  double responsiveText(double percentage) {
    return (_screenWidth / 3) * percentage / 100.0;
  }
}
