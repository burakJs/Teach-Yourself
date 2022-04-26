import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:teach_yourself/feature/register/viewmodel/register_cubit.dart';
import '../../../product/constant/string_constant.dart';
import '../../../product/enums/person_type_enum.dart';
import '../../../product/extensions/string_extension.dart';
import '../../../product/textfield/auth_textfield.dart';

import '../../../product/button/auth_button.dart';
import '../viewmodel/register_state.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.paddingMedium,
          child: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterError) {
                _errorDialog(context, state);
              }
            },
            builder: (context, state) {
              if (state is RegisterInitial) {
                return _registerPage(context, state);
              } else if (state is RegisterSuccess) {
                return Center(child: Text(state.person.name));
              } else if (state is RegisterLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return _registerPage(context, state);
              }
            },
          ),
        ),
      ),
    );
  }

  Future<dynamic> _errorDialog(BuildContext context, RegisterError state) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(state.error),
          );
        });
  }

  Column _registerPage(BuildContext context, RegisterState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AuthTextField(controller: context.read<RegisterCubit>().nameController, title: StringConstant.name),
        AuthTextField(controller: context.read<RegisterCubit>().surnameController, title: StringConstant.surname),
        AuthTextField(controller: context.read<RegisterCubit>().usernameController, title: StringConstant.username),
        AuthTextField(controller: context.read<RegisterCubit>().emailController, title: StringConstant.email),
        AuthTextField(controller: context.read<RegisterCubit>().passwordController, title: StringConstant.password),
        _dropdownRole(state, context),
        AuthButton(
          text: StringConstant.register,
          callBack: () async {
            // NavigationManager.instance.navigateToPage(NavigationConstants.LOGIN);
            context.read<RegisterCubit>().register();
          },
        )
      ],
    );
  }

  DropdownButton<int> _dropdownRole(RegisterState state, BuildContext context) {
    return DropdownButton<int>(
      value: (state is RegisterDropdownChanged) ? state.index : 0,
      alignment: Alignment.center,
      items: PersonType.values
          .map(
            (e) => DropdownMenuItem<int>(
              value: e.index,
              child: _dropdownItemText(context, e.name.upperFirstLetter),
            ),
          )
          .toList(),
      onChanged: context.read<RegisterCubit>().setDropDownValue,
    );
  }

  Text _dropdownItemText(BuildContext context, String text) {
    return Text(
      text,
      style: context.textTheme.headline6,
    );
  }
}
