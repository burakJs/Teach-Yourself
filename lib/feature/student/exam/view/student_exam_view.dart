import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:teach_yourself/feature/student/exam/product/student_exam_design.dart';
import 'package:teach_yourself/feature/student/exam/viewmodel/student_exam_cubit.dart';
import 'package:teach_yourself/feature/student/exam/viewmodel/student_exam_pageview_cubit.dart';
import 'package:teach_yourself/product/button/app_button.dart';
import 'package:teach_yourself/product/indicator/loading_indicator.dart';

import '../viewmodel/student_exam_state.dart';

class StudentExamView extends StatelessWidget {
  const StudentExamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '10:00',
          style: context.textTheme.headline4,
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
                          return StudentExamDesign(question: (state.questionList ?? [])[pageViewState]);
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
                AppButton(text: 'Before', callBack: () => context.read<StudentExamPageViewCubit>().previousPage()),
                AppButton(text: 'After', callBack: () => context.read<StudentExamPageViewCubit>().nextPage(10)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _questionBody(BuildContext context, StudentExamSuccess state, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${index + 1}- ${(state.questionList ?? [])[index].questionText}',
          style: context.textTheme.headline6,
        ),
      ],
    );
  }
}
