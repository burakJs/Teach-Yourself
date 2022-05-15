import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teach_yourself/core/init/navigation/navigation_manager.dart';
import 'package:teach_yourself/feature/student/exam/viewmodel/student_exam_pageview_cubit.dart';
import 'package:teach_yourself/feature/student/exam/viewmodel/student_exam_timer_cubit.dart';
import 'package:teach_yourself/product/appbar/base_appbar.dart';
import 'package:teach_yourself/product/button/app_button.dart';
import 'package:teach_yourself/product/constant/navigation_constants.dart';

import '../../../../product/model/person.dart';

class StudentHomeView extends StatelessWidget {
  const StudentHomeView({Key? key, required this.person}) : super(key: key);
  final Person person;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        name: person.name,
      ),
      body: Center(
        child: AppButton(
          text: 'Start Exam',
          callBack: () {
            context.read<StudentExamPageViewCubit>().clearList();
            context.read<StudentExamTimerCubit>().timer();
            NavigationManager.instance.navigateToPageClear(NavigationConstants.STUDENT_EXAM);
          },
        ),
      ),
    );
  }
}
