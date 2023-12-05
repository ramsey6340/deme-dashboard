import 'package:flutter/material.dart';

import '../constants.dart';

class GlobalValueProvider with ChangeNotifier {
  String _dashboardTypeUser = DashboardTypeUser.user;

  String get dashboardTypeUser => _dashboardTypeUser;

  void changeDashboardTypeUser(String typeUser) {
    _dashboardTypeUser = typeUser;
    notifyListeners();
  }
}