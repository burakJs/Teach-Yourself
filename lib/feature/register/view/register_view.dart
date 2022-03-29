import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:teach_yourself/core/init/navigation/navigation_manager.dart';
import 'package:teach_yourself/product/constant/string_constant.dart';
import 'package:teach_yourself/product/constant/navigation_constants.dart';
import 'package:teach_yourself/product/textfield/auth_textfield.dart';

import '../../../product/button/auth_button.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.paddingMedium,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AuthTextField(title: StringConstant.name),
              const AuthTextField(title: StringConstant.surname),
              const AuthTextField(title: StringConstant.username),
              const AuthTextField(title: StringConstant.email),
              const AuthTextField(title: StringConstant.password),
              DropdownButton<int>(
                  value: 0,
                  alignment: Alignment.center,
                  items: [
                    DropdownMenuItem(
                      value: 0,
                      child: _dropdownItemText(context, StringConstant.student),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: _dropdownItemText(context, StringConstant.questioner),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: _dropdownItemText(context, StringConstant.admin),
                    ),
                  ],
                  onChanged: (val) {}),
              AuthButton(
                text: StringConstant.register,
                callBack: () {
                  NavigationManager.instance.navigateToPage(NavigationConstants.LOGIN);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Text _dropdownItemText(BuildContext context, String text) {
    return Text(
      text,
      style: context.textTheme.headline6,
    );
  }
}
