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
  String error = '';
  bool loading = false;

  // text field state
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
                  child: Column(
                children: <Widget>[
                  TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Email'),
                      onChanged: (val) {
                        setState(() => email = val);
                      }),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration:
                        textInputDecoration.copyWith(hintText: 'password'),
                    obscureText: true,
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
                        dynamic result = _auth.signInAnon();
                        if (result == null) {
                          print('error in sign in');
                        } else {
                          print('signed in');
                        }
                      },
                    ),
                    SizedBox(width: width / 15),
                    RaisedButton(
                      color: Colors.pink[600],
                      child: Text(
                        'Sign in',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => {print(email), print(password)},
                    ),
                  ]),
                ],
              )),
            ],
          )),
    );
  }
}
