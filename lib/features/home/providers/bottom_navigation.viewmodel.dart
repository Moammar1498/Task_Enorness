import 'package:flutter/material.dart';
import 'package:task_enorness/features/home/models/bottom_nav_item.dart';
import 'package:task_enorness/utils/utlils.dart';
// import 'package:free_lunch_app/utils/routing/utlils.dart';

class NavItemProvider with ChangeNotifier {
  String? tabSelection = 'home';

  void setTabSelection(BottomNavItem item) {
    Utils.mainListNav.currentState!.pushReplacementNamed('/${item.route}');
    tabSelection = item.route;
    notifyListeners();
  }
}
