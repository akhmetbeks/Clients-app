import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VisibleText with ChangeNotifier {
  var isVisible = true;

  bool isVisibleText(VisibilityInfo info) {
    var visiblePercentage = info.visibleFraction * 100;

    if (visiblePercentage < 1) {
      isVisible = false;
      notifyListeners();
      return false;
    } else {
      isVisible = true;
      notifyListeners();
      return true;
    }
  }
}
