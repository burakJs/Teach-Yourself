import 'package:flutter/material.dart';

class NavigationRoute {
  static NavigationRoute? _instance;
  static NavigationRoute get instance => _instance ??= NavigationRoute._init();
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      default:
        return normalNavigate(const Text('ERROR'));
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
