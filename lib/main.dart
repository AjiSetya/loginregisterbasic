import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:logkerja/providers/providers.dart';
import 'package:logkerja/shared/shared.dart';
import 'package:provider/provider.dart';

import 'ui/pages/pages.dart';

void main() {
  Stetho.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: kSplash,
        routes: {
          kSplash: (context) => FlashPage(),
          kLoginPage: (context) => LoginPage(),
          kMainPage: (context) => MainPage(),
          kRegisterPage: (context) => MainPage(),
        },
      ),
    );
  }
}
