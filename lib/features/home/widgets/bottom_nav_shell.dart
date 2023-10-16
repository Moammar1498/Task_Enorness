import 'package:flutter/material.dart';
import 'package:task_enorness/features/home/widgets/bottom_nav.dart';
import 'package:task_enorness/utils/routes.dart';
import 'package:task_enorness/utils/utlils.dart';

class BottomNavShell extends StatelessWidget {
  const BottomNavShell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: Navigator(
                key: Utils.mainListNav,
                initialRoute: '/home',
                onGenerateRoute: (settings) => Routes.generateRoute(settings),
              ),
            ),
            const Align(alignment: Alignment.bottomCenter, child: BottomNav()),
          ],
        ),
      ),
    );
  }
}
