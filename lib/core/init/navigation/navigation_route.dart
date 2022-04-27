import 'package:flutter/material.dart';

import '../../../feature/admin/home/view/admin_home_view.dart';
import '../../../feature/admin/unconfirmed/view/unconfirmed_view.dart';
import '../../../feature/login/view/login_view.dart';
import '../../../feature/register/view/register_view.dart';
import '../../../product/constant/navigation_constants.dart';
import '../../../product/model/person.dart';

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
        Person person = args.arguments as Person;
        return normalNavigate(AdminHomeView(person: person));
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
