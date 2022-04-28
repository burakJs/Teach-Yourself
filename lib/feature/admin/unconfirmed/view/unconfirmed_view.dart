import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:teach_yourself/feature/admin/unconfirmed/viewmodel/admin_unconfirmed_state.dart';
import 'package:teach_yourself/product/alert/error_alert.dart';
import 'package:teach_yourself/product/indicator/loading_indicator.dart';
import 'package:teach_yourself/product/model/person.dart';
import '../../../../product/constant/string_constant.dart';
import '../../../../product/listtile/question_listtile.dart';

import '../../../../../product/constant/color_constants.dart';
import '../viewmodel/admin_unconfirmed_cubit.dart';

class AdminUnconfirmedView extends StatelessWidget {
  const AdminUnconfirmedView({Key? key, required this.person}) : super(key: key);
  final Person person;
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
          BlocConsumer<AdminUnconfirmedCubit, AdminUnconfirmedState>(
            listener: (context, state) {
              if (state is AdminUnconfirmedError) {
                ErrorAlert(content: state.error);
              }
            },
            builder: (context, state) {
              if (state is AdminUnconfirmedSuccess) {
                if (state.unconfirmedList.isNotNullOrEmpty) {
                  return _unconfirmedList(context, state);
                } else {
                  return const Center(child: Text('There are no unconfirmed questions'));
                }
              } else {
                return const LoadingIndicator();
              }
            },
          ),
        ],
      ),
    );
  }

  Expanded _unconfirmedList(BuildContext context, AdminUnconfirmedSuccess state) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () => context.read<AdminUnconfirmedCubit>().getUnconfirmedList(),
        child: ListView.builder(
          itemCount: state.unconfirmedList!.length,
          itemBuilder: (BuildContext context, int index) {
            return QuestionListTile(
              question: state.unconfirmedList![index],
              onPressed: () {},
            );
          },
        ),
      ),
    );
  }

  AppBar _adminAppBar(BuildContext context, ColorConstants _colors, double _iconSize) {
    return AppBar(
      title: _appBarTitleText(context),
      iconTheme: IconTheme.of(context).copyWith(
        color: _colors.blackColor,
      ),
    );
  }

  Text _appBarTitleText(BuildContext context) {
    return Text(
      'Hello, ${person.name}',
      style: context.textTheme.headline5,
    );
  }
}
