import 'package:flutter/material.dart';
import 'package:teach_yourself/feature/admin/home/view/admin_home_view.dart';
import 'package:teach_yourself/feature/login/view/login_view.dart';
import 'package:teach_yourself/feature/register/view/register_view.dart';
import 'package:teach_yourself/product/constant/navigation_constants.dart';

class NavigationRoute {
  static NavigationRoute? _instance;
  static NavigationRoute get instance => _instance ??= NavigationRoute._init();
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.REGISTER:
        return normalNavigate(const RegisterView());
      case NavigationConstants.LOGIN:
        return normalNavigate(const LoginView());
      case NavigationConstants.ADMIN_HOME:
        return normalNavigate(const AdminHomeView());
      default:
        return normalNavigate(const Text('ERROR'));
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
