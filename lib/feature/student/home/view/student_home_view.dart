import 'package:flutter/material.dart';
import 'package:teach_yourself/core/init/navigation/navigation_manager.dart';
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
            NavigationManager.instance.navigateToPageClear(NavigationConstants.STUDENT_EXAM);
          },
        ),
      ),
    );
  }
}
