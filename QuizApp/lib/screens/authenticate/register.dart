import 'package:QuizApp/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:QuizApp/services/auth.dart';
import '../../shared/constant.dart';

class Register extends StatefulWidget {
  // Constructor
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

// constructor

final AuthService _auth = AuthService();
final _formKey = GlobalKey<FormState>();

String error = '';
bool loading = false;
// text field state
String email = '';
String password = '';

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        elevation: 0.0,
        title: Text('Sign up to Quiz App'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.account_circle),
            label: Text('Sign in'),
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
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 50),
              
                SizedBox(height: 20),
                TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    validator: validateEmail,
                    onChanged: (val) {
                      setState(() => email = val);
                    }),
                SizedBox(height: 20),
                TextFormField(
                  decoration:
                      textInputDecoration.copyWith(hintText: 'Password'),
                  obscureText: true,
                  validator: (val) => val.length < 6
                      ? 'Enter a password with minimum length of 6'
                      : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: height / 50),
                RaisedButton(
                  color: Colors.pink[600],
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() => loading = true);
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, password);

                      if (result == null) {
                        setState(() {
                          error = 'User aldready exist';
                          loading = false;
                        });
                      }
                    }
                  },
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 18),
                )
              ],
            )),
      ),
    );
  }
}

String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}
