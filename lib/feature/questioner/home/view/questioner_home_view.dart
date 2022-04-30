import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:teach_yourself/feature/questioner/viewmodel/questioner_home_cubit.dart';
import 'package:teach_yourself/product/alert/error_alert.dart';
import 'package:teach_yourself/product/button/app_button.dart';
import 'package:teach_yourself/product/indicator/loading_indicator.dart';
import 'package:teach_yourself/product/textfield/question_textfield.dart';

import '../../../../product/button/app_bar_icon_button.dart';
import '../../../../product/constant/color_constants.dart';
import '../../../../product/model/person.dart';
import '../../viewmodel/questioner_home_state.dart';
import '../../viewmodel/radio_cubit.dart';

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

  Widget _questionerHomeBuild(BuildContext context, bool isLoading, String? url) {
    return BlocProvider(
      create: (context) => RadioCubit(),
      child: BlocBuilder<RadioCubit, int>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              QuestionTextField(
                controller: context.read<QuestionerHomeCubit>().questionText,
                line: 6,
                hint: 'Enter your question text here',
                val: -1,
                groupValue: state,
                changeCallback: (int? changedVal) {},
              ),
              QuestionTextField(
                controller: context.read<QuestionerHomeCubit>().optionA,
                line: 2,
                hint: 'Option A',
                val: 0,
                groupValue: state,
                changeCallback: (int? changedVal) {
                  context.read<RadioCubit>().changeRadio(changedVal ?? 0);
                  context.read<QuestionerHomeCubit>().setCorrect(changedVal ?? 0);
                },
              ),
              QuestionTextField(
                controller: context.read<QuestionerHomeCubit>().optionB,
                line: 2,
                hint: 'Option B',
                val: 1,
                groupValue: state,
                changeCallback: (int? changedVal) {
                  context.read<RadioCubit>().changeRadio(changedVal ?? 0);
                  context.read<QuestionerHomeCubit>().setCorrect(changedVal ?? 0);
                },
              ),
              QuestionTextField(
                controller: context.read<QuestionerHomeCubit>().optionC,
                line: 2,
                hint: 'Option C',
                val: 2,
                groupValue: state,
                changeCallback: (int? changedVal) {
                  context.read<RadioCubit>().changeRadio(changedVal ?? 0);
                  context.read<QuestionerHomeCubit>().setCorrect(changedVal ?? 0);
                },
              ),
              QuestionTextField(
                controller: context.read<QuestionerHomeCubit>().optionD,
                line: 2,
                hint: 'Option D',
                val: 3,
                groupValue: state,
                changeCallback: (int? changedVal) {
                  context.read<RadioCubit>().changeRadio(changedVal ?? 0);
                  context.read<QuestionerHomeCubit>().setCorrect(changedVal ?? 0);
                },
              ),
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
        },
      ),
    );
  }

  Card _questionOption(BuildContext context, int line, String hint, TextEditingController controller) {
    return Card(
      color: _colors.blackColor.withOpacity(0.1),
      child: Padding(
        padding: context.paddingLow,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                maxLines: line,
                decoration: InputDecoration.collapsed(hintText: hint),
                style: context.textTheme.headlineSmall?.copyWith(
                  fontSize: 20,
                ),
              ),
            ),
            line > 2
                ? const SizedBox()
                : Radio(
                    value: 1,
                    groupValue: -1,
                    onChanged: (val) {},
                  )
          ],
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
