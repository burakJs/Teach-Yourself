import 'dart:async';

import 'package:bloc/bloc.dart';

class StudentExamTimerCubit extends Cubit<String> {
  StudentExamTimerCubit() : super('10:00');

  final int maxMinute = 9;
  final int maxSeconds = 60;
  int minute = 9;
  int seconds = 60;
  bool isFinished = false;

  void timer() {
    reset();
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer t) => {emit(getTimeStr()), if (isFinished) t.cancel()},
    );
  }

  void reset() {
    isFinished = false;
    seconds = maxSeconds;
    minute = maxMinute;
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
