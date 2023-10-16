import 'package:flutter/material.dart';
import 'package:task_enorness/features/home/views/home.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      case '/home':
        page = const Home();
        break;
      case '/chat':
        page = const Text('chat');
        break;
      case '/orders':
        page = const Text('My orders');
        break;
      case '/profile':
        page = const Text('My orders');
        break;
      case '/settings':
        page = const Text('My orders');
        break;
      default:
        page = const Center(
          child: Text('No Specified Route'),
        );
    }
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionDuration: const Duration(seconds: 0),
    );
  }
}
