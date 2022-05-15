import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:teach_yourself/feature/student/exam/product/student_exam_design.dart';
import 'package:teach_yourself/feature/student/exam/viewmodel/student_exam_cubit.dart';
import 'package:teach_yourself/feature/student/exam/viewmodel/student_exam_pageview_cubit.dart';
import 'package:teach_yourself/product/button/app_button.dart';
import 'package:teach_yourself/product/indicator/loading_indicator.dart';

import '../viewmodel/student_exam_state.dart';
import '../viewmodel/student_exam_timer_cubit.dart';

class StudentExamView extends StatelessWidget {
  StudentExamView({Key? key}) : super(key: key);
  bool isFinished = false;
  final String finishedTime = '00:00';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocConsumer<StudentExamTimerCubit, String>(
          listener: (context, state) {
            isFinished = state == finishedTime;

            isFinished ? context.read<StudentExamPageViewCubit>().nextPage(isFinished) : null;
          },
          builder: (context, state) {
            return Text(
              state,
              style: context.textTheme.headline4,
            );
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<StudentExamPageViewCubit, int>(
              builder: (context, pageViewState) {
                return PageView.builder(
                  controller: context.read<StudentExamPageViewCubit>().controller,
                  itemCount: 10,
                  onPageChanged: (int index) {
                    context.read<StudentExamPageViewCubit>().setPage(index);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return BlocBuilder<StudentExamCubit, StudentExamState>(
                      builder: (context, state) {
                        if (state is StudentExamInitial || state is StudentExamLoading) {
                          return const LoadingIndicator();
                        } else if (state is StudentExamSuccess) {
                          return StudentExamDesign(
                            question: (state.questionList ?? [])[pageViewState],
                            optionSelected: (int option) {
                              context.read<StudentExamPageViewCubit>().setSelectedOption(
                                  option, (state.questionList ?? [])[pageViewState], (state.questionList ?? []));
                            },
                          );
                        } else {
                          return Center(child: Text((state as StudentExamError).error));
                        }
                      },
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: context.verticalPaddingLow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BlocBuilder<StudentExamPageViewCubit, int>(
                  builder: (context, state) {
                    return AppButton(
                        text: state == 10 ? 'END EXAM' : 'AFTER QUESTION',
                        callBack: () => context.read<StudentExamPageViewCubit>().nextPage(isFinished));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
