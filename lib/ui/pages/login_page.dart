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
    setState(() => _securePassword = !_securePassword);
  }

  @override
  Widget build(BuildContext context) {
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
                  validator: Validation.validateName,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: 'Username',
                      hintText: 'Username',
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
                        onPressed: (){
                          passwordToggle();
                        },
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
                      context
                          .read<LoginProvider>()
                          .login(emailController.text, passwordController.text)
                          .then((value) {
                        if (value) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              kMainPage, (route) => false);
                        } else {
                          var snackbar = SnackBar(
                            content: Text('User tidak ditemukan'),
                          );
                          _scaffoldKey.currentState.showSnackBar(snackbar);
                        }
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
