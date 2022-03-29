import 'package:flutter/material.dart';
import 'package:teach_yourself/core/init/navigation_manager.dart';
import 'package:teach_yourself/core/init/navigation_route.dart';
import 'package:teach_yourself/feature/register/view/register_view.dart';

void main() => runApp(const MyApp());

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
      home: const RegisterView(),
    );
  }
}
