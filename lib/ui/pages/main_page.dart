part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  signOut() async {
    SharedPreferences _pref = await sharedPreferences;
    setState(() {
      _pref.setString(kEmailUser, null);
      _pref.setString(kNameUser, null);
      _pref.setInt(kPrefLogin, 0);
      loginStatus = LoginStatus.notSignIn;
    });
  }

  _cekLoginStatus() async {
    SharedPreferences _pref = await sharedPreferences;

    var value;
    setState(() {
      value = _pref.getInt(kPrefLogin);

      loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  @override
  void initState() {
    super.initState();
    _cekLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    switch (loginStatus) {
      case LoginStatus.signIn :
        return Scaffold(
            appBar: AppBar(
              title: Text("Halaman Dashboard"),
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    signOut();
                  },
                  icon: Icon(Icons.lock_open),
                )
              ],
            ),
            body: Center(
              child: Text("Dashboard"),
            ));
        break;
      case LoginStatus.notSignIn:
        return LoginPage();
        break;
    }
  }
}
