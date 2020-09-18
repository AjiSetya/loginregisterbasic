part of 'pages.dart';

class FlashPage extends StatefulWidget {
  @override
  _FlashPageState createState() => _FlashPageState();
}

class _FlashPageState extends State<FlashPage> {
  bool _isLogin;

  cekLoginStatus() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _isLogin = _pref.getBool(kPrefLogin) ?? false;
    Timer(Duration(seconds: 3), () {
      if (_isLogin) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(kMainPage, (route) => false);
      } else {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(kLoginPage, (route) => false);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    cekLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
