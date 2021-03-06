import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:teach_yourself/feature/student/exam/view/student_exam_view.dart';
import 'package:teach_yourself/feature/student/exam_result/view/exam_result_view.dart';
import 'package:teach_yourself/feature/student/home/view/student_home_view.dart';
import 'package:teach_yourself/product/model/question.dart';

import '../../../feature/admin/home/view/admin_home_view.dart';
import '../../../feature/admin/unconfirmed/view/unconfirmed_view.dart';
import '../../../feature/login/view/login_view.dart';
import '../../../feature/questioner/home/view/questioner_home_view.dart';
import '../../../feature/register/view/register_view.dart';
import '../../../product/constant/navigation_constants.dart';
import '../../../product/model/person.dart';

class NavigationRoute {
  static NavigationRoute? _instance;
  static NavigationRoute get instance => _instance ??= NavigationRoute._init();
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.REGISTER:
        return normalNavigate(const RegisterView());
      case NavigationConstants.LOGIN:
        return normalNavigate(const LoginView());
      case NavigationConstants.ADMIN_HOME:
        final Person _person = args.arguments as Person;
        return normalNavigate(AdminHomeView(person: _person));
      case NavigationConstants.ADMIN_UNCONFIRMED:
        final Person _person = args.arguments as Person;
        return normalNavigate(AdminUnconfirmedView(person: _person));
      case NavigationConstants.QUESTIONER_HOME:
        final Person _person = args.arguments as Person;
        return normalNavigate(QuestionerHomeView(person: _person));
      case NavigationConstants.STUDENT_HOME:
        final Person _person = args.arguments as Person;
        return normalNavigate(StudentHomeView(person: _person));
      case NavigationConstants.STUDENT_EXAM:
        return normalNavigate(StudentExamView());
      case NavigationConstants.STUDENT_EXAM_RESULT:
        final data = args.arguments as LinkedHashMap<String, List<Question>>;
        List<Question> rightQuestions = data['right'] as List<Question>;
        List<Question> wrongQuestions = data['wrong'] as List<Question>;
        List<Question> allQuestions = data['all'] as List<Question>;
        return normalNavigate(StudentExamResultView(
          rightQuestions: rightQuestions,
          wrongQuestions: wrongQuestions,
          allQuestions: allQuestions,
        ));
      default:
        return normalNavigate(const Text('ERROR'));
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
