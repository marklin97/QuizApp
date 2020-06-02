import 'package:QuizApp/screens/leaderBoard/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:QuizApp/models/score.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final scores = Provider.of<List<Score>>(context) ?? [];
    // print(userList.documents);
    return ListView.builder(
      itemCount: scores.length,
      itemBuilder: (context, index) {
        return UserTile(
          user: scores[index],
          rank: index + 1,
        );
      },
    );
  }
}
