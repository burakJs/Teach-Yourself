import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:teach_yourself/product/circleavatar/logo.dart';
import 'package:teach_yourself/product/constant/string_constant.dart';
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Logo(radius: 48),
              const AuthTextField(title: StringConstant.name),
              const AuthTextField(title: StringConstant.surname),
              const AuthTextField(title: StringConstant.username),
              const AuthTextField(title: StringConstant.email),
              const AuthTextField(title: StringConstant.password),
              AuthButton(
                text: StringConstant.register,
                callBack: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
