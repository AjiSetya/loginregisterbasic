import 'package:flutter/material.dart';
import 'package:logkerja/shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ui/pages/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: kLoginPage,
      routes: {
        kLoginPage: (context)=> LoginPage(),
        kMainPage: (context)=> MainPage(),
        kRegisterPage: (context)=> MainPage(),
      },
    );
  }
}
