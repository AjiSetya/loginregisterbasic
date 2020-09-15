import 'package:shared_preferences/shared_preferences.dart';

part 'constans.dart';

enum LoginStatus { notSignIn, signIn }
LoginStatus loginStatus = LoginStatus.notSignIn;
Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();