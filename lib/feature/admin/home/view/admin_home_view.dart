import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:teach_yourself/feature/admin/home/viewmodel/admin_home_cubit.dart';
import 'package:teach_yourself/feature/admin/home/viewmodel/admin_home_state.dart';
import 'package:teach_yourself/product/indicator/loading_indicator.dart';
import 'package:teach_yourself/product/model/person.dart';
import '../../../../core/init/navigation/navigation_manager.dart';
import '../../../../product/button/app_bar_icon_button.dart';
import '../../../../product/constant/color_constants.dart';
import '../../../../product/constant/navigation_constants.dart';
import '../../../../product/constant/string_constant.dart';
import '../../../../product/listtile/question_listtile.dart';

class AdminHomeView extends StatelessWidget {
  AdminHomeView({Key? key, required this.person}) : super(key: key);
  final Person person;
  final ColorConstants _colors = ColorConstants.instance;
  final double _iconSize = 28;

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
      'Hello, ${person.name}',
      style: context.textTheme.headline5,
    );
  }

  Padding _appBarLogOutIcon(BuildContext context, ColorConstants _colors) {
    return Padding(
      padding: context.horizontalPaddingNormal,
      child: AppBarIconButton(
        icon: Icons.logout,
        onPressed: () {
          NavigationManager.instance.navigateToPageClear(NavigationConstants.LOGIN);
        },
      ),
    );
  }

  Padding _listviewTitlePadding(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Text(
        StringConstant.questionPool,
        style: context.textTheme.headline5?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _questionPoolListView(ColorConstants _colors, BuildContext context, double _iconSize) {
    return BlocBuilder<AdminHomeCubit, AdminHomeState>(
      builder: (context, state) {
        if (state is AdminHomeLoading || state is AdminHomeInitial) {
          return Column(
            children: [
              const Expanded(child: LoadingIndicator()),
              _unconfirmedQuestionButton(_colors, context, _iconSize),
            ],
          );
        } else if (state is AdminHomeSuccess) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: (state.questionList ?? []).length,
                  itemBuilder: (context, index) => QuestionListTile(
                    question: (state.questionList ?? [])[index],
                    onPressed: () {},
                  ),
                ),
              ),
              _unconfirmedQuestionButton(_colors, context, _iconSize)
            ],
          );
        } else {
          return ErrorWidget('SA');
        }
      },
    );
  }

  ElevatedButton _unconfirmedQuestionButton(ColorConstants _colors, BuildContext context, double _iconSize) {
    return ElevatedButton(
      onPressed: () {
        NavigationManager.instance.navigateToPage(NavigationConstants.ADMIN_UNCONFIRMED);
      },
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
