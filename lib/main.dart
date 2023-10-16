import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_enorness/features/graph/providers/sales.provider.dart';
import 'package:task_enorness/features/home/providers/bottom_navigation.viewmodel.dart';
import 'package:task_enorness/features/home/providers/home_provider.dart';
import 'package:task_enorness/features/home/widgets/bottom_nav_shell.dart';
import 'package:task_enorness/utils/utlils.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MultiProvider(providers: [
            ChangeNotifierProvider(create: (_) => NavItemProvider()),
            ChangeNotifierProvider(create: (_) => DashboardProvider()),
            ChangeNotifierProvider(create: (_) => SalesProvider()),
          ], child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      navigatorKey: Utils.mainAppNav,
      routes: {
        '/home': (context) => const BottomNavShell(),
      },
    );
  }
}
