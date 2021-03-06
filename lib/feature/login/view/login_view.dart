import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import '../../../product/alert/error_alert.dart';

import '../../../product/button/app_button.dart';
import '../../../product/circleavatar/logo.dart';
import '../../../product/constant/string_constant.dart';
import '../../../product/textfield/auth_textfield.dart';
import '../viewmodel/login_cubit.dart';
import '../viewmodel/login_state.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.paddingNormal,
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginError) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ErrorAlert(content: state.error);
                  },
                );
              }
            },
            builder: (context, state) {
              if (state is LoginLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is LoginSuccess) {
                return const Center(child: Text('SA'));
              } else {
                return _loginPage(context);
              }
            },
          ),
        ),
      ),
    );
  }

  Column _loginPage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Logo(radius: 70),
        context.emptySizedHeightBoxNormal,
        context.emptySizedHeightBoxNormal,
        AuthTextField(
          controller: context.read<LoginCubit>().emailController,
          title: StringConstant.email,
        ),
        AuthTextField(
          controller: context.read<LoginCubit>().passwordController,
          title: StringConstant.password,
        ),
        context.emptySizedHeightBoxNormal,
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  text: 'Register',
                  callBack: () {
                    context.read<LoginCubit>().goToRegister();
                  },
                ),
                AppButton(
                  text: StringConstant.login,
                  callBack: () async {
                    context.read<LoginCubit>().login();
                  },
                ),
              ],
            ),
            AppButton(
              text: 'Forgot Password',
              callBack: () async {
                final String? result = await context.read<LoginCubit>().resetPass();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result ?? 'Reset password email sent')));
              },
            ),
          ],
        )
      ],
    );
  }
}
