import 'package:QuizApp/screens/leaderBoard/user_list.dart';
import 'package:flutter/material.dart';
import 'package:QuizApp/services/database.dart';
import 'package:provider/provider.dart';
import 'package:QuizApp/models/score.dart';
import 'package:QuizApp/services/auth.dart';

class LeaderBoard extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Score>>.value(
      value: DatabaseService().userScore,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Leaderboard'),
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
                var user = await _auth.currentUser();
                if (user != null) {
                  await _auth.signOut();
                } else {
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
        body: UserList(),
      ),
    );
  }
}
