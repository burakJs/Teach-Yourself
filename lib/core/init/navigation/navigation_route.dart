import 'package:flutter/material.dart';
import 'package:teach_yourself/feature/admin/home/unconfirmed/unconfirmed_view.dart';
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
        return normalNavigate(RegisterView());
      case NavigationConstants.LOGIN:
        return normalNavigate(LoginView());
      case NavigationConstants.ADMIN_HOME:
        return normalNavigate(const AdminHomeView());
      case NavigationConstants.ADMIN_UNCONFIRMED:
        return normalNavigate(const AdminUnconfirmedView());
      default:
        return normalNavigate(const Text('ERROR'));
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
