import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import '../../viewmodel/questioner_home_cubit.dart';
import '../../../../product/alert/error_alert.dart';
import '../../../../product/appbar/base_appbar.dart';
import '../../../../product/button/app_button.dart';
import '../../../../product/indicator/loading_indicator.dart';
import '../../../../product/textfield/question_textfield.dart';

import '../../../../product/model/person.dart';
import '../../viewmodel/questioner_home_state.dart';
import '../../viewmodel/radio_cubit.dart';

class QuestionerHomeView extends StatelessWidget {
  const QuestionerHomeView({Key? key, required this.person}) : super(key: key);
  final Person person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        name: person.name,
      ),
      body: SafeArea(
        child: Padding(
          padding: context.paddingLow,
          child: BlocBuilder<QuestionerHomeCubit, QuestionerHomeState>(
            builder: (context, state) {
              if (state is QuestionerHomeInitial || state is QuestionerHomeSuccess) {
                return _questionerHomeBuild(context, false, null);
              } else if (state is QuestionerHomeError) {
                return ErrorAlert(content: state.error);
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
}
