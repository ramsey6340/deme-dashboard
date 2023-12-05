import 'package:flutter/material.dart';

class StatisticalInfoProvider with ChangeNotifier {
  bool _showSideInfo = true;

  bool get showSideInfo => _showSideInfo;

  void changeShowSideInfo(){
    _showSideInfo = !_showSideInfo;
    notifyListeners();
  }
}