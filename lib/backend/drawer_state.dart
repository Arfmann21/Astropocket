import 'package:flutter/cupertino.dart';

class DrawerState extends ChangeNotifier{
  bool _isOpen = false;

  void setState(bool value) {
    _isOpen = value;    
    notifyListeners();
  }

  bool loadState() {
    return _isOpen;
  }
}