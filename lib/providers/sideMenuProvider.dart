import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

class SideMenuProvider with ChangeNotifier {
  int _selectedIndex = 0;
  bool _showAllSideMenuInfo = true;
  bool get showAllSideMenuInfo => _showAllSideMenuInfo;
  int get selectedIndex => _selectedIndex;

  void changeSelectedIndex(int index){
    if(_selectedIndex >= 0 && _selectedIndex < nbSideMenuItems){
      _selectedIndex = index;
      notifyListeners();
    }
  }

  void changeShowAllSideMenuInfo(){
    _showAllSideMenuInfo = !_showAllSideMenuInfo;
    notifyListeners();
  }
}