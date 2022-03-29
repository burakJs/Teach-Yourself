import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:teach_yourself/core/init/navigation_manager.dart';
import 'package:teach_yourself/product/button/auth_button.dart';
import 'package:teach_yourself/product/circleavatar/logo.dart';
import 'package:teach_yourself/product/constant/string_constant.dart';
import 'package:teach_yourself/product/constant/navigation_constants.dart';
import 'package:teach_yourself/product/textfield/auth_textfield.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

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
              const AuthTextField(
                title: StringConstant.username,
              ),
              const AuthTextField(
                title: StringConstant.password,
              ),
              context.emptySizedHeightBoxNormal,
              Align(
                alignment: Alignment.centerRight,
                child: AuthButton(
                    text: StringConstant.login,
                    callBack: () {
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
