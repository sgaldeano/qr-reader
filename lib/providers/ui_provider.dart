import 'package:flutter/material.dart';

class UIProvider extends ChangeNotifier {

  int _selectedMenuOption = 0;

  int get selectedMenuOption => _selectedMenuOption;

  set selectedMenuOption(int option) {
    _selectedMenuOption = option;
    notifyListeners();
  }

}