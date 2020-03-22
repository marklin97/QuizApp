import 'package:QuizApp/screens/home/home.dart';
import 'package:flutter/material.dart';
import '../../services/auth.dart';
import '../../shared/constant.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  // text field state
  String error = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        title: Text('Sign in to Quiz APP'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.account_circle),
            label: Text(
              'Register',
              style: TextStyle(fontSize: 17.0),
            ),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.19),
            image: DecorationImage(
                image: AssetImage('assets/login_page.jpg'), fit: BoxFit.cover),
          ),
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 80),
              Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                          decoration:
                              textInputDecoration.copyWith(hintText: 'Email'),
                          validator: validateEmail,
                          onChanged: (val) {
                            setState(() => email = val);
                          }),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'password'),
                        obscureText: true,
                        validator: (val) => val.length < 6
                            ? 'Enter a password with minimum length of 6'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height: height / 50),
                      Row(children: <Widget>[
                        SizedBox(width: 30),
                        RaisedButton(
                          color: Colors.blue[600],
                          child: Text(
                            'Sign in as guest',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            /*
                        dynamic result = _auth.signInAnon();
                        if (result == null) {
                          print('error in sign in');
                        } else {
                          print('signed in');
                        }
                        */
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                          },
                        ),
                        SizedBox(width: width / 15),
                        RaisedButton(
                          color: Colors.pink[600],
                          child: Text(
                            'Sign in',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() => error =
                                    'Could not sign in with those credentials');
                              }
                            }
                          },
                        ),
                      ]),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.red[400],
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  )),
            ],
          )),
    );
  }
}

String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter a valid username';
  else
    return null;
}
