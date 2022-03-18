import 'package:flutter/cupertino.dart';

class DrawerState extends ChangeNotifier{
  bool _isOpen = false;
  bool _isAlreadyPressed = false;

  void setState() {
    _isOpen = !_isOpen;
    _isAlreadyPressed = true;
    
    notifyListeners();
  }

  bool loadState() {
    return _isOpen;
  }

  bool loadPressed() {
    return _isAlreadyPressed;
  }
}