import 'package:QuizApp/screens/widgets/module.dart';
import 'package:QuizApp/services/auth.dart';
import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';

// Retrive the user customised setting

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text(
              'LOGOUT',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      drawer: DrawerBar(),
      body: SingleChildScrollView(
          child: new Container(
        margin: new EdgeInsets.all(10.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20),
            new Module(
              moduleName: 'Sample Questions',
              totalQuiz: 4,
              level: 'Level : Junior',
              icon: Icons.assessment,
            ),
            SizedBox(height: 20),
            new Module(
              moduleName: 'Drug Misuse Act 1985',
              totalQuiz: 50,
              level: 'Level : Middle',
              icon: Icons.book,
            ),
            SizedBox(height: 20),
            new Module(
              moduleName: 'Criminal Code Act 1995',
              totalQuiz: 50,
              level: 'Level : Senior',
              icon: Icons.assignment,
            ),
            SizedBox(height: 20),
            new Module(
              moduleName: 'Criminal Code Act 1995',
              totalQuiz: 50,
              level: 'Level : Senior',
              icon: Icons.assignment,
            ),
          ],
        ),
      )),
    ));
  }
}
