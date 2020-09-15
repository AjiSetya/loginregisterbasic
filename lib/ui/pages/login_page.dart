part of 'pages.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _securePassword = true;

  String email;
  String password;

  passwordToggle() {
    setState(() {
      _securePassword = !_securePassword;
    });
  }

  loginUser() async {
    if (emailController.text != 'aji@gmail.com' ||
        passwordController.text != '123456') {
      final snackBar = SnackBar(content: Text('Email atau password salah'));
      _scaffoldKey.currentState.showSnackBar(snackBar);
    } else {
      saveUserPref(emailController.text, emailController.text);
      print(emailController.text);
      loginStatus = LoginStatus.signIn;
    }
  }

  saveUserPref(String email, String name) async {
    SharedPreferences _pref = await sharedPreferences;

    setState(() {
      _pref.setString(kEmailUser, email);
      _pref.setString(kNameUser, name);
      _pref.setInt(kPrefLogin, 1);
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
      case LoginStatus.notSignIn:
        return Scaffold(
          key: _scaffoldKey,
          body: Container(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 70, bottom: 40),
                      child: Text(
                        "Selamat datang,\nSilakan masuk untuk memulai !",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    TextFormField(
                      controller: emailController,
                      onChanged: (newValue) {
                        email = newValue;
                      },
                      validator: Validation.validateEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Email Address',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0))),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: passwordController,
                      onChanged: (newValue) {
                        password = newValue;
                      },
                      validator: Validation.validatePassword,
                      obscureText: _securePassword,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: passwordToggle,
                            icon: Icon(_securePassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0))),
                    ),
                    SizedBox(height: 8),
                    RaisedButton(
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            loginUser();
                          }
                        })
                  ],
                ),
              ),
            ),
          ),
        );
      case LoginStatus.signIn:
        return MainPage();
        break;
    }
  }
}
