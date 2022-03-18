import 'package:flutter/material.dart';

class ConnectionNotifier extends ChangeNotifier{
  bool _isConnectionAvaible = true;

  void setAvailability({isAvaible = false}) {
    _isConnectionAvaible = isAvaible;

    notifyListeners();
  }

  bool getAvailability() {
    return _isConnectionAvaible;
  }
}