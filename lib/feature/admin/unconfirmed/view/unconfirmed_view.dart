import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../../../product/button/app_bar_icon_button.dart';
import '../../../../product/constant/string_constant.dart';
import '../../../../product/listtile/question_listtile.dart';
import '../../../../product/model/question.dart';

import '../../../../../product/constant/color_constants.dart';

class AdminUnconfirmedView extends StatelessWidget {
  const AdminUnconfirmedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorConstants _colors = ColorConstants.instance;
    const double _iconSize = 28;

    return Scaffold(
      appBar: _adminAppBar(context, _colors, _iconSize),
      body: Column(
        children: [
          Padding(
            padding: context.paddingNormal,
            child: Text(
              StringConstant.unconfirmedQuestionPool,
              style: context.textTheme.headline5?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: questionList.length,
              itemBuilder: (BuildContext context, int index) {
                return QuestionListTile(
                  question: questionList[index],
                  onPressed: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  AppBar _adminAppBar(BuildContext context, ColorConstants _colors, double _iconSize) {
    return AppBar(
      title: _appBarTitleText(context),
      iconTheme: IconTheme.of(context).copyWith(
        color: _colors.blackColor,
      ),
      actions: [
        _appBarLogOutIcon(context, _colors),
      ],
    );
  }

  Text _appBarTitleText(BuildContext context) {
    return Text(
      'Hello, Burak',
      style: context.textTheme.headline5,
    );
  }

  Padding _appBarLogOutIcon(BuildContext context, ColorConstants _colors) {
    return Padding(
      padding: context.horizontalPaddingNormal,
      child: AppBarIconButton(
        icon: Icons.logout,
        onPressed: () {},
      ),
    );
  }
}
