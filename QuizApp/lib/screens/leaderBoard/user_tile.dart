import 'package:flutter/material.dart';
import 'package:QuizApp/models/score.dart';

class UserTile extends StatelessWidget {
  final Score user;
  final int rank;
  UserTile({this.user, this.rank});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  radius: 25.0,
                  backgroundImage: AssetImage('assets/police_icon2.png'),
                ),
                trailing: Text('Rank : ' + rank.toString()),
                title: Text(user.userName),
                subtitle: Text(
                  user.score.toString() + '  points',
                ),
              ),
            ],
          )),
    );
  }
}
