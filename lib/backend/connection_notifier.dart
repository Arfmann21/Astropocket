import 'package:flutter/material.dart';

class ConnectionNotifier extends ChangeNotifier{
  bool _isConnectionAvaible = true;

  void setAvailability() {
    _isConnectionAvaible = !_isConnectionAvaible;

    notifyListeners();
  }

  bool getAvailability() {
    return _isConnectionAvaible;
  }
}