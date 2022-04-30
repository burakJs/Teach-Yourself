import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:teach_yourself/feature/questioner/viewmodel/questioner_home_cubit.dart';
import 'package:teach_yourself/product/alert/error_alert.dart';
import 'package:teach_yourself/product/button/app_button.dart';
import 'package:teach_yourself/product/indicator/loading_indicator.dart';

import '../../../../product/button/app_bar_icon_button.dart';
import '../../../../product/constant/color_constants.dart';
import '../../../../product/model/person.dart';
import '../../viewmodel/questioner_home_state.dart';

class QuestionerHomeView extends StatelessWidget {
  QuestionerHomeView({Key? key, required this.person}) : super(key: key);
  final Person person;

  final ColorConstants _colors = ColorConstants.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _appBarTitleText(context),
        centerTitle: false,
        actions: [
          _appBarLogOutIcon(context, _colors),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: context.paddingLow,
          child: BlocBuilder<QuestionerHomeCubit, QuestionerHomeState>(
            builder: (context, state) {
              if (state is QuestionerHomeInitial) {
                return _questionerHomeBuild(context, false, null);
              } else if (state is QuestionerHomeError) {
                return ErrorAlert(content: state.error);
              } else if (state is QuestionerHomeSuccess) {
                return Center(child: Text(state.question!.questionText));
              } else if (state is QuestionerHomeImageLoading) {
                return _questionerHomeBuild(context, true, null);
              } else if (state is QuestionerHomeImageSuccess) {
                return _questionerHomeBuild(context, false, state.imageUrl);
              } else {
                return const LoadingIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  Column _questionerHomeBuild(BuildContext context, bool isLoading, String? url) {
    print('URL $url');
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _questionOption(context, 6, 'Enter your question text here', context.read<QuestionerHomeCubit>().questionText),
        _questionOption(context, 2, 'Option A', context.read<QuestionerHomeCubit>().optionA),
        _questionOption(context, 2, 'Option B', context.read<QuestionerHomeCubit>().optionB),
        _questionOption(context, 2, 'Option C', context.read<QuestionerHomeCubit>().optionC),
        _questionOption(context, 2, 'Option D', context.read<QuestionerHomeCubit>().optionD),
        Expanded(
          child: isLoading
              ? const LoadingIndicator()
              : url != null
                  ? Image.network(url)
                  : GestureDetector(
                      onTap: () async {
                        context.read<QuestionerHomeCubit>().uploadImage();
                      },
                      child: const SizedBox(
                        width: double.infinity,
                        child: Card(
                          child: Icon(Icons.camera_alt, size: 32),
                        ),
                      ),
                    ),
        ),
        AppButton(
          text: 'Save Question',
          callBack: () {
            context.read<QuestionerHomeCubit>().uploadQuestion(url);
          },
        )
      ],
    );
  }

  Card _questionOption(BuildContext context, int line, String hint, TextEditingController controller) {
    return Card(
      color: _colors.blackColor.withOpacity(0.1),
      child: Padding(
        padding: context.paddingLow,
        child: TextField(
          controller: controller,
          maxLines: line,
          decoration: InputDecoration.collapsed(hintText: hint),
          style: context.textTheme.headlineSmall?.copyWith(
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Text _appBarTitleText(BuildContext context) {
    return Text(
      'Hello, ${person.username}',
      style: context.textTheme.headline5,
    );
  }

  Padding _appBarLogOutIcon(BuildContext context, ColorConstants _colors) {
    return Padding(
      padding: context.horizontalPaddingNormal,
      child: AppBarIconButton(
        icon: Icons.logout,
        onPressed: () async {
          await context.read<QuestionerHomeCubit>().logOut();
        },
      ),
    );
  }
}
