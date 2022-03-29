import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import 'package:teach_yourself/product/constant/color_constants.dart';
import 'package:teach_yourself/product/constant/string_constant.dart';
import 'package:teach_yourself/product/model/question.dart';

class AdminHomeView extends StatelessWidget {
  const AdminHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorConstants _colors = ColorConstants.instance;
    const double _iconSize = 28;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello, Burak',
          style: context.textTheme.headline5,
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: context.horizontalPaddingNormal,
            child: Icon(
              Icons.logout,
              color: _colors.blackColor,
              size: _iconSize,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: context.paddingNormal,
              child: Text(
                StringConstant.questionPool,
                style: context.textTheme.headline5,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: questionList.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(
                          questionList[index].questionText,
                          style: context.textTheme.headline6,
                        ),
                        subtitle: Text(
                          questionList[index].answers.join(' - '),
                          style: context.textTheme.bodyLarge,
                        ),
                        trailing: Text(
                          DateFormat('dd-MM-yyyy - kk:mm').format(questionList[index].time.toDate()),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: _colors.blackColor,
                    ),
                    child: Padding(
                      padding: context.paddingNormal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            StringConstant.unconfirmedQuestions,
                            style: context.textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: _colors.whiteColor,
                            ),
                          ),
                          const Icon(Icons.arrow_right, size: _iconSize),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
