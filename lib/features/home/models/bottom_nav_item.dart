import 'package:flutter/material.dart';

class BottomNavItem {
  final IconData iconUnselected;
  final String route;
  final bool isSelected;
  final String label;
  BottomNavItem(
      {required this.iconUnselected,
      required this.route,
      required this.isSelected,
      required this.label});

  BottomNavItem copyWith({
    IconData? iconUnselected,
    IconData? iconSelected,
    String? route,
    bool? isSelected,
    String? label,
  }) {
    return BottomNavItem(
        iconUnselected: iconUnselected ?? this.iconUnselected,
        route: route ?? this.route,
        isSelected: isSelected ?? this.isSelected,
        label: label ?? this.label);
  }
}
