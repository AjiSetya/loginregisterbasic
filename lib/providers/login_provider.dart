part of 'providers.dart';

class LoginProvider extends ChangeNotifier {
  Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();

  Future<bool> login(String username, String password) async {
    if (username != 'gilang' || password != '123456'){
      // login gagal
      return false;
    }else{
      // login berhasil
      saveUserPref(username);
      return true;
    }
  }
  
  saveUserPref(String username) async {
    SharedPreferences _pref = await sharedPreferences;
    _pref.setString(kNameUser, username);
    _pref.setBool(kPrefLogin, true);
  }

  Future<bool> isLogin() async {
    SharedPreferences _pref = await sharedPreferences;
    return Future.value(_pref.getBool(kPrefLogin));
  }
}
