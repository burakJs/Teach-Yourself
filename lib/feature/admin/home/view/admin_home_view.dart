import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:teach_yourself/product/constant/color_constants.dart';
import 'package:teach_yourself/product/constant/string_constant.dart';
import 'package:teach_yourself/product/listtile/question_listtile.dart';
import 'package:teach_yourself/product/model/question.dart';

class AdminHomeView extends StatelessWidget {
  const AdminHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorConstants _colors = ColorConstants.instance;
    const double _iconSize = 28;

    return Scaffold(
      appBar: AppBar(
        title: _appBarTitleText(context),
        centerTitle: false,
        actions: [
          _appBarLogOutIcon(context, _colors, _iconSize),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            _listviewTitlePadding(context),
            Expanded(
              child: _questionPoolListView(_colors, context, _iconSize),
            ),
          ],
        ),
      ),
    );
  }

  Text _appBarTitleText(BuildContext context) {
    return Text(
      'Hello, Burak',
      style: context.textTheme.headline5,
    );
  }

  Padding _appBarLogOutIcon(BuildContext context, ColorConstants _colors, double _iconSize) {
    return Padding(
      padding: context.horizontalPaddingNormal,
      child: Icon(
        Icons.logout,
        color: _colors.blackColor,
        size: _iconSize,
      ),
    );
  }

  Padding _listviewTitlePadding(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Text(
        StringConstant.questionPool,
        style: context.textTheme.headline5,
      ),
    );
  }

  Column _questionPoolListView(ColorConstants _colors, BuildContext context, double _iconSize) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: questionList.length,
            itemBuilder: (context, index) => QuestionListTile(
              question: questionList[index],
            ),
          ),
        ),
        _unconfirmedQuestionButton(_colors, context, _iconSize)
      ],
    );
  }

  ElevatedButton _unconfirmedQuestionButton(ColorConstants _colors, BuildContext context, double _iconSize) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: _colors.blackColor,
      ),
      child: _unconfirmedQuestionButtonChild(context, _colors, _iconSize),
    );
  }

  Padding _unconfirmedQuestionButtonChild(BuildContext context, ColorConstants _colors, double _iconSize) {
    return Padding(
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
          Icon(Icons.arrow_right, size: _iconSize),
        ],
      ),
    );
  }
}
