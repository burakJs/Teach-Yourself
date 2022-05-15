import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:teach_yourself/core/init/data/concrete/firebase_manager.dart';
import 'package:teach_yourself/core/init/navigation/navigation_manager.dart';
import 'package:teach_yourself/product/button/app_button.dart';
import 'package:teach_yourself/product/constant/navigation_constants.dart';
import 'package:teach_yourself/product/data/auth/abstract/auth_service.dart';
import 'package:teach_yourself/product/data/auth/concrete/auth_manager.dart';
import 'package:teach_yourself/product/model/person.dart';
import 'package:teach_yourself/product/model/question.dart';

class StudentExamResultView extends StatelessWidget {
  StudentExamResultView({Key? key, required this.rightQuestions, required this.wrongQuestions, required this.allQuestions})
      : super(key: key);

  final List<Question> rightQuestions;
  final List<Question> wrongQuestions;
  final List<Question> allQuestions;
  final AuthService manager = AuthManager(service: FirebaseManager());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              _questionPercentage(context, 'Doğru sayısı: ${rightQuestions.length} / 10'),
              _questionPercentage(context, 'Yanlış Sayısı: ${wrongQuestions.length} / 10'),
              const Spacer(),
              Text('Sorular', style: context.textTheme.headline3),
              Expanded(
                flex: 10,
                child: _questionView(),
              ),
              AppButton(
                text: 'Back to Menu',
                callBack: () async {
                  Person? person = await manager.getPerson();
                  NavigationManager.instance.navigateToPageClear(NavigationConstants.STUDENT_HOME, data: person);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Text _questionPercentage(BuildContext context, String text) {
    return Text(
      text,
      style: context.textTheme.headline6,
    );
  }

  ListView _questionView() {
    return ListView.builder(
      itemCount: allQuestions.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
              title: Column(
                children: [
                  allQuestions[index].image == null ? const SizedBox() : Image.network(allQuestions[index].image!),
                  Text(allQuestions[index].questionText),
                ],
              ),
              subtitle: Center(
                child: Padding(
                  padding: context.paddingLow,
                  child: Text(
                    'True Answer: ' + allQuestions[index].answers[allQuestions[index].correctAnswer],
                    style: context.textTheme.headline6?.copyWith(
                      color: rightQuestions.contains(allQuestions[index]) ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
