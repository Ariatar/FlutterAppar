import 'package:fitnessapp/services/auth.dart';
import 'package:fitnessapp/styleguide/colors.dart';
import 'package:fitnessapp/styleguide/text_style.dart';
import 'package:fitnessapp/user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Authorizationpage extends StatefulWidget {
  @override
  _AuthorizationpageState createState() => _AuthorizationpageState();
}

class _AuthorizationpageState extends State<Authorizationpage> {
  // переменные
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _email;
  String _password;
  bool showLogin = true;

  AuthServices _authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Padding(
        padding: EdgeInsets.only(top: 100),
        child: Container(
          child: Align(
            child: Text(
              'MAX FIT',
              style: TextStyle(
                  fontSize: 45,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    }

    Widget _input(
        Icon icon, String, TextEditingController controller, bool obsecure) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText:
              obsecure, // параметр конролирует звездочки во время ввода пароля ******
          style:
              whiteSubHeadingTextStyle, // переменная которая хранит все параметры ее...
          decoration: InputDecoration(
            hintStyle: whiteSubHeadingTextStyle,
            hintText: String,
            focusedBorder: OutlineInputBorder(
              // когда мы наводим фокус на бордер писать етот параметр
              borderSide: BorderSide(color: Colors.white, width: 3),
            ),
            enabledBorder: OutlineInputBorder(
              // убираем фокус с бордера
              borderSide: BorderSide(color: Colors.white54, width: 1),
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: IconTheme(
                data: IconThemeData(color: Colors.white),
                child: icon,
              ),
            ),
            // переменная которая хранит все параметры ее... styleguide papka
          ),
        ),
      );
    }

    Widget _button(String text, func()) {
      return RaisedButton(
        onPressed: () {
          func();
        },
        splashColor: Colors.red, // эффект при нажатии на баттон
        highlightColor: Theme.of(context).primaryColor,
        color: buttonColor,
        child: Text(
          text,
          style: buttonNameStyle,
        ),
      );
    }

    Widget _form(String label, void func()) {
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              child:
                  _input(Icon(Icons.email), 'EMAIL', _emailController, false),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              child: _input(
                  Icon(Icons.lock), 'PASSWORD', _passwordController, true),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button(label, func),
              ),
            ),
          ],
        ),
      );
    }

    void _loginButtonActions() async {
      // функция которая запоминает текст из инпутов потом очищает их
      _email = _emailController.text;
      _password = _passwordController.text;

      if (_email.isEmpty || _password.isEmpty) return;

      User user = await _authServices.signInWithEmailAndPassword(
          _email.trim(), _password.trim());
      if (user == null) {
        Fluttertoast.showToast(
            msg: "This is Center Short Toast",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        _emailController.clear();
        _passwordController.clear();
      }
    }

    void _registerButtonActions() async {
      // функция которая запоминает текст из инпутов потом очищает их
      _email = _emailController.text;
      _password = _passwordController.text;

      if (_email.isEmpty || _password.isEmpty) return;

      User user = await _authServices.registerWithEmailAndPassword(
          _email.trim(), _password.trim());
      if (user == null) {
        Fluttertoast.showToast(
            msg: "This is Center Short Toast",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        _emailController.clear();
        _passwordController.clear();
      }
    }

    Widget _buttonWave() {
      // прикольная анимашка внизу позначил что от не *****************
      return Expanded(
        child: Align(
          child: ClipPath(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  colors: [
                    const Color(0xFFFFFFEE),
                    const Color(0xFFFF7F50)
                  ], // whitish to gray
                ),
              ),
              height: 500,
            ),
            clipper: BottomWaveClipper(),
          ),
          alignment: Alignment.bottomCenter,
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          _logo(),
          SizedBox(
            height: 150,
          ),
          (showLogin
              ? Column(
                  children: <Widget>[
                    _form('LOGIN', _loginButtonActions),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: GestureDetector(
                        child: Text('Not registered yet? Register!',
                            style: headingTextStyle),
                        onTap: () {
                          setState(() {
                            showLogin = false;
                          });
                        },
                      ),
                    ),
                  ],
                )
              : Column(
                  children: <Widget>[
                    _form('REGISTER', _registerButtonActions),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: GestureDetector(
                        child: Text('already registered? Login!',
                            style: headingTextStyle),
                        onTap: () {
                          setState(() {
                            showLogin = true;
                          });
                        },
                      ),
                    ),
                  ],
                )),
          _buttonWave() // *****************
        ],
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  // *****************
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height + 5);
    var secondControlPoint = Offset(size.width - (size.width / 6), size.height);
    var secondEndpoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndpoint.dx, secondEndpoint.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
