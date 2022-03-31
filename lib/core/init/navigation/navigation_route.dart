import 'package:flutter/material.dart';
import '../../../feature/admin/home/view/admin_home_view.dart';
import '../../../feature/admin/unconfirmed/view/unconfirmed_view.dart';
import '../../../feature/login/view/login_view.dart';
import '../../../feature/register/view/register_view.dart';
import '../../../product/constant/navigation_constants.dart';

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
