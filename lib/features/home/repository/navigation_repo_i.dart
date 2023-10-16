import 'package:flutter/material.dart';
import 'package:task_enorness/features/home/models/bottom_nav_item.dart';

abstract class INavigationRepository {
  List<BottomNavItem> getDefaultNavItems();
}

class NavigationRepository extends INavigationRepository {
  @override
  List<BottomNavItem> getDefaultNavItems() {
    return [
      BottomNavItem(
          iconUnselected: Icons.home,
          route: 'home',
          isSelected: true,
          label: 'Home'),
      BottomNavItem(
          iconUnselected: Icons.chat,
          route: 'chat',
          isSelected: false,
          label: 'Chat'),
      BottomNavItem(
          iconUnselected: Icons.list,
          route: 'orders',
          isSelected: false,
          label: 'My Orders'),
      BottomNavItem(
          iconUnselected: Icons.person,
          route: 'profile',
          isSelected: false,
          label: 'Profile'),
      BottomNavItem(
          iconUnselected: Icons.settings,
          route: 'settings',
          isSelected: false,
          label: 'Settings'),
    ];
  }
}
