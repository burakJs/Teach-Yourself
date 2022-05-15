import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teach_yourself/feature/login/view/login_view.dart';
import 'package:teach_yourself/feature/student/exam/viewmodel/student_exam_cubit.dart';
import 'package:teach_yourself/feature/student/exam/viewmodel/student_exam_pageview_cubit.dart';
import 'package:teach_yourself/feature/student/exam/viewmodel/student_exam_timer_cubit.dart';
import 'feature/admin/home/viewmodel/admin_home_cubit.dart';
import 'feature/admin/unconfirmed/viewmodel/admin_unconfirmed_cubit.dart';
import 'feature/questioner/viewmodel/questioner_home_cubit.dart';
import 'feature/register/viewmodel/register_cubit.dart';
import 'core/init/navigation/navigation_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'feature/login/viewmodel/login_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<RegisterCubit>(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit()..checkUserLogined(),
        ),
        BlocProvider<AdminHomeCubit>(
          create: (context) => AdminHomeCubit()..loadConfirmedQuestion(),
        ),
        BlocProvider<AdminUnconfirmedCubit>(
          create: (context) => AdminUnconfirmedCubit()..getUnconfirmedList(),
        ),
        BlocProvider<QuestionerHomeCubit>(
          create: (context) => QuestionerHomeCubit(),
        ),
        BlocProvider<StudentExamCubit>(
          create: (context) => StudentExamCubit()..loadQuestion(),
        ),
        BlocProvider<StudentExamPageViewCubit>(
          create: (context) => StudentExamPageViewCubit(),
        ),
        BlocProvider<StudentExamTimerCubit>(
          create: (context) => StudentExamTimerCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationManager.instance.navigatorKey,
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: const LoginView(),
    );
  }
}
