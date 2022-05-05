import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../core/init/data/concrete/firebase_manager.dart';
import '../constant/color_constants.dart';
import '../data/auth/abstract/auth_service.dart';
import '../data/auth/concrete/auth_manager.dart';

import '../../core/init/navigation/navigation_manager.dart';
import '../button/app_bar_icon_button.dart';
import '../constant/navigation_constants.dart';

class BaseAppBar extends StatelessWidget with PreferredSizeWidget {
  BaseAppBar({Key? key, required this.name}) : super(key: key);
  final String name;
  final ColorConstants _colors = ColorConstants.instance;
  final AuthService _authService = AuthManager(service: FirebaseManager());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _appBarTitleText(context),
      centerTitle: false,
      actions: [
        _appBarLogOutIcon(context, _colors),
      ],
    );
  }

  Text _appBarTitleText(BuildContext context) {
    return Text(
      'Hello, $name',
      style: context.textTheme.headline5,
    );
  }

  Padding _appBarLogOutIcon(BuildContext context, ColorConstants _colors) {
    return Padding(
      padding: context.horizontalPaddingNormal,
      child: AppBarIconButton(
        icon: Icons.logout,
        onPressed: () async {
          await _authService.service.auth.signOut();
          NavigationManager.instance.navigateToPageClear(NavigationConstants.LOGIN);
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
