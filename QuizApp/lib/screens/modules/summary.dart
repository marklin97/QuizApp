import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  var score;
  var questionNumber;

  Summary({Key key, @required this.score, this.questionNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int count = 0;
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Quiz App'),
        elevation: 0.0,
      ),
      body: new Container(
        margin: const EdgeInsets.all(15.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Center(
              child: Text(
                "Final Score: $score",
                style: new TextStyle(fontSize: 35.0, color: Colors.green),
              ),
            ),
            new Padding(padding: EdgeInsets.all(30.0)),
            new MaterialButton(
              color: Colors.green,
              onPressed: () {
                questionNumber = 0;
                score = 0;
                Navigator.popUntil(context, (route) {
                  return count++ == 1;
                });
              },
              child: new Text(
                "Reset Quiz",
                style: new TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
