import 'dart:async';

import 'package:bloc/bloc.dart';

class StudentExamTimerCubit extends Cubit<String> {
  StudentExamTimerCubit() : super('10:00');

  int minute = 9;
  int seconds = 60;
  bool isFinished = false;
  void timer() {
    isFinished = false;
    seconds = 60;
    minute = 9;
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer t) => {emit(getTimeStr()), if (isFinished) t.cancel()},
    );
  }

  String getTimeStr() {
    if (minute < 0) {
      isFinished = true;
      return '00:00';
    }
    seconds--;
    if (seconds <= 0) {
      minute--;
      seconds = 60;
    }

    return '$minute:$seconds';
  }
}
