import 'package:flutter/material.dart';

class CheckLoading with ChangeNotifier {
  bool _isLoaded = false;

  void setLoaded() {
    _isLoaded = true;

    notifyListeners();
  }

   getLoaded()  {
    return _isLoaded;
  }
}