import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/init/navigation/navigation_manager.dart';
import '../../../product/button/auth_button.dart';
import '../../../product/circleavatar/logo.dart';
import '../../../product/constant/navigation_constants.dart';
import '../../../product/constant/string_constant.dart';
import '../../../product/textfield/auth_textfield.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.paddingNormal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Logo(radius: 70),
              context.emptySizedHeightBoxNormal,
              context.emptySizedHeightBoxNormal,
              AuthTextField(
                controller: _emailController,
                title: StringConstant.email,
              ),
              AuthTextField(
                controller: _passwordController,
                title: StringConstant.password,
              ),
              context.emptySizedHeightBoxNormal,
              Align(
                alignment: Alignment.centerRight,
                child: AuthButton(
                    text: StringConstant.login,
                    callBack: () async {
                      NavigationManager.instance.navigateToPageClear(NavigationConstants.ADMIN_HOME);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
