import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:teach_yourself/product/constant/string_constant.dart';
import 'package:teach_yourself/product/enums/person_type_enum.dart';
import 'package:teach_yourself/product/extensions/string_extension.dart';
import 'package:teach_yourself/product/textfield/auth_textfield.dart';

import '../../../core/init/navigation/navigation_manager.dart';
import '../../../product/button/auth_button.dart';
import '../../../product/constant/navigation_constants.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.paddingMedium,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthTextField(controller: _nameController, title: StringConstant.name),
              AuthTextField(controller: _surnameController, title: StringConstant.surname),
              AuthTextField(controller: _usernameController, title: StringConstant.username),
              AuthTextField(controller: _emailController, title: StringConstant.email),
              AuthTextField(controller: _passwordController, title: StringConstant.password),
              DropdownButton<int>(
                value: PersonType.admin.index,
                alignment: Alignment.center,
                items: PersonType.values
                    .map(
                      (e) => DropdownMenuItem<int>(
                        value: e.index,
                        child: _dropdownItemText(context, e.name.upperFirstLetter),
                      ),
                    )
                    .toList(),
                onChanged: (val) {},
              ),
              AuthButton(
                text: StringConstant.register,
                callBack: () async {
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
