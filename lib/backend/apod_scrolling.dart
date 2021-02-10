import 'package:flutter/cupertino.dart';

class ApodScrolling extends ChangeNotifier {
  bool canBeScrolled = true;

  void setScrollTrue() {
    canBeScrolled = true;

    notifyListeners();
  }

  void setScrollFalse() {
    canBeScrolled = false;

    notifyListeners();
  }

  bool getScroll() {
    return canBeScrolled;
  }
}