import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:teach_yourself/product/button/app_button.dart';

import '../../../../product/button/app_bar_icon_button.dart';
import '../../../../product/constant/color_constants.dart';
import '../../../../product/model/person.dart';

class QuestionerHomeView extends StatelessWidget {
  QuestionerHomeView({Key? key, required this.person}) : super(key: key);
  final Person person;

  final ColorConstants _colors = ColorConstants.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _appBarTitleText(context),
        centerTitle: false,
        actions: [
          _appBarLogOutIcon(context, _colors),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: context.paddingLow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _questionOption(context, 6, 'Enter your question text here'),
              _questionOption(context, 2, 'Option A'),
              _questionOption(context, 2, 'Option B'),
              _questionOption(context, 2, 'Option C'),
              _questionOption(context, 2, 'Option D'),
              const Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    child: Icon(Icons.camera_alt, size: 32),
                  ),
                ),
              ),
              AppButton(text: 'Save Question', callBack: () {})
            ],
          ),
        ),
      ),
    );
  }

  Card _questionOption(BuildContext context, int line, String hint) {
    return Card(
      color: _colors.blackColor.withOpacity(0.1),
      child: Padding(
        padding: context.paddingLow,
        child: TextField(
          maxLines: line,
          decoration: InputDecoration.collapsed(hintText: hint),
          style: context.textTheme.headlineSmall?.copyWith(
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Text _appBarTitleText(BuildContext context) {
    return Text(
      'Hello, ${person.username}',
      style: context.textTheme.headline5,
    );
  }

  Padding _appBarLogOutIcon(BuildContext context, ColorConstants _colors) {
    return Padding(
      padding: context.horizontalPaddingNormal,
      child: AppBarIconButton(
        icon: Icons.logout,
        onPressed: () async {},
      ),
    );
  }
}
