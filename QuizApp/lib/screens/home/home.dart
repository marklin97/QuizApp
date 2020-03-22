import 'package:QuizApp/screens/widgets/module.dart';
import 'package:QuizApp/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              //
              await _auth.signOut();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: new Container(
        margin: new EdgeInsets.all(10.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20),
            new Module(
              module_name: 'Police Act 1990',
              total_quiz: 30,
              level: 'Level : Junior',
              icon: Icons.assessment,
            ),
            SizedBox(height: 20),
            new Module(
              module_name: 'Drug Misuse Act 1985',
              total_quiz: 50,
              level: 'Level : Middle',
              icon: Icons.book,
            ),
            SizedBox(height: 20),
            new Module(
              module_name: 'Criminal Code Act 1995',
              total_quiz: 50,
              level: 'Level : Senior',
              icon: Icons.assignment,
            ),
          ],
        ),
      )),
    ));
  }
}
