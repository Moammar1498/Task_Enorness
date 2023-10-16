import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_enorness/features/home/models/bottom_nav_item.dart';
import 'package:task_enorness/features/home/providers/bottom_navigation.viewmodel.dart';
import 'package:task_enorness/features/home/repository/navigation_repo_i.dart';
import 'package:task_enorness/utils/appcolors.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    INavigationRepository navigationRepository = NavigationRepository();
    final navItems = navigationRepository.getDefaultNavItems();
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(navItems.length, (index) {
          return BottomNavTile(item: navItems[index]);
        }),
      ),
    );
  }
}

class BottomNavTile extends StatelessWidget {
  final BottomNavItem item;
  const BottomNavTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavItemProvider>(builder: (context, navItem, child) {
      return Column(
        children: [
          IconButton(
            onPressed: () {
              navItem.setTabSelection(item);
            },
            icon: Icon(
              item.iconUnselected,
              color: navItem.tabSelection == item.route
                  ? AppColors.primaryColor
                  : Colors.white,
            ),
          ),
          Text(
            item.label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
            ),
          )
        ],
      );
    });
  }
}
