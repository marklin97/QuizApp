import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:QuizApp/models/score.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference userScores =
      Firestore.instance.collection('userScore');

  Future updateUserData(String userName, int score, DateTime time) async {
    return await userScores.document(uid).setData({
      'userName': userName,
      'score': score,
      'timeAchieved': time,
    });
  }

  Future getUserScore() async {
    var score;
    await userScores.document(uid).get().then((value) {
      score = (value.data["score"]);
    });
    return score;
  }

  Future getUserName() async {
    var userName;
    await userScores.document(uid).get().then((value) {
      userName = (value.data["userName"]);
    });
    return userName;
  }

  Future updateUserScore(int score, DateTime time) async {
    return await userScores.document(uid).updateData({
      'score': score,
      'timeAchieved': time,
    });
  }

  // user list from snapshot
  List<Score> _userListFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Score(
        userName: doc.data['userName'] ?? '',
        score: doc.data['score'] ?? 0,
      );
    }).toList();
  }

  // get orderd user score stream
  Stream<List<Score>> get userScore {
    return userScores
        .orderBy('score', descending: true)
        .orderBy('timeAchieved', descending: false)
        .snapshots()
        .map(_userListFromSnapShot);
  }

  // get user doc stream

}
