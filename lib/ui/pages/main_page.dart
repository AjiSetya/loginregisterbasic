part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String _username;

  signOut() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setBool(kPrefLogin, false);
    Navigator.of(context).pushNamedAndRemoveUntil(kLoginPage, (route) => false);
  }

  @override
  Future<void> initState() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _username = _pref.getString(kNameUser);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          child: Text("Welcome $_username"),
        ));
  }
}
