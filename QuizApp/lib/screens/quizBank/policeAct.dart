import 'package:QuizApp/screens/home/summary.dart';
import 'package:flutter/material.dart';

class PoliceAct extends StatefulWidget {
  @override
  _PoliceActState createState() => _PoliceActState();
}

var finalScore = 0;
var questionNumber = 0;
var quiz = new AnimalQuiz();

var unSelectedColor = null;
var selectedColor = Colors.blue;

class AnimalQuiz {
  var questions = [
    "This is a sample question 1 ",
    "This is a sample question 2 ",
    "This is a sample question 3 ",
    "This is a sample question 4 ",
  ];

  var choices = [
    ["1", "2", "3", "4"],
    ["1", "2", "3", "4"],
    ["1", "2", "3", "4"],
    ["1", "2", "3", "4"],
  ];

  var correctAnswers = ["1", "2", "3", "4"];
}

class _PoliceActState extends State<PoliceAct> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool selected = false;
    void selectAnswer() {
      if (selected == false) {
        setState(() {
          unSelectedColor = selectedColor;
          selected = true;
        });
      } else {}
    }

    return new Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => resetQuiz(),
            ),
            centerTitle: true,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Question ${questionNumber + 1} of ${quiz.questions.length}",
                  ),
                  Text(
                    "Score: $finalScore",
                  ),
                ]),
            backgroundColor: Colors.blue[400],
            elevation: 0.0,
          ),
        ),
        body: new Container(
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.all(10.0)),
                new Container(
                  alignment: Alignment.centerRight,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[],
                  ),
                ),
                // image

                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                        "assets/quiz_image_${questionNumber + 1}.jpg",
                        fit: BoxFit.fill,
                        height: height / 3.5)),

                Padding(padding: EdgeInsets.all(20)),
                new Text(
                  quiz.questions[questionNumber],
                  style: new TextStyle(fontSize: 20),
                ),
                Padding(padding: EdgeInsets.all(10)),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // button 1
                    new Container(
                        width: width / 1.2,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1.0, color: Colors.black),
                          ),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Text(
                              'sample choice 1',
                              style: new TextStyle(
                                fontSize: 22,
                                color: Colors.blueAccent[400],
                              ),
                            ),
                            MaterialButton(
                                height: 20,
                                minWidth: 10,
                                color: unSelectedColor,
                                shape: new CircleBorder(
                                  side: BorderSide(
                                      color: Colors.blue,
                                      width: 1,
                                      style: BorderStyle.solid),
                                ),
                                onPressed: () {
                                  if (quiz.choices[questionNumber][0] ==
                                      quiz.correctAnswers[questionNumber]) {
                                    debugPrint("Correct");
                                    finalScore++;
                                  } else {
                                    debugPrint("Wrong");
                                  }
                                  updateQuestion();
                                }),
                          ],
                        )),
                    // button 2
                    new Container(
                      width: width / 1.2,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text(
                            'sample choice 2',
                            style: new TextStyle(
                              fontSize: 22,
                              color: Colors.blueAccent[400],
                            ),
                          ),
                          MaterialButton(
                              height: 20,
                              minWidth: 10,
                              color: unSelectedColor,
                              shape: new CircleBorder(
                                side: BorderSide(
                                    color: Colors.blue,
                                    width: 1,
                                    style: BorderStyle.solid),
                              ),
                              onPressed: () {
                                if (quiz.choices[questionNumber][1] ==
                                    quiz.correctAnswers[questionNumber]) {
                                  debugPrint("Correct");
                                  finalScore++;
                                } else {
                                  debugPrint("Wrong");
                                }
                                updateQuestion();
                              }),
                        ],
                      ),
                    ),
                    new Container(
                      width: width / 1.2,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text(
                            'sample choice 3',
                            style: new TextStyle(
                              fontSize: 22,
                              color: Colors.blueAccent[400],
                            ),
                          ),
                          MaterialButton(
                              height: 20,
                              minWidth: 10,
                              color: unSelectedColor,
                              shape: new CircleBorder(
                                side: BorderSide(
                                    color: Colors.blue,
                                    width: 1,
                                    style: BorderStyle.solid),
                              ),
                              onPressed: () {
                                if (quiz.choices[questionNumber][2] ==
                                    quiz.correctAnswers[questionNumber]) {
                                  debugPrint("Correct");
                                  finalScore++;
                                } else {
                                  debugPrint("Wrong");
                                }
                                updateQuestion();
                              }),
                        ],
                      ),
                    ),
                    new Container(
                      width: width / 1.2,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text(
                            'sample choice 4',
                            style: new TextStyle(
                              fontSize: 22,
                              color: Colors.blueAccent[400],
                            ),
                          ),
                          MaterialButton(
                              height: 20,
                              minWidth: 10,
                              color: unSelectedColor,
                              shape: new CircleBorder(
                                side: BorderSide(
                                    color: Colors.blue,
                                    width: 1,
                                    style: BorderStyle.solid),
                              ),
                              onPressed: () {
                                if (quiz.choices[questionNumber][3] ==
                                    quiz.correctAnswers[questionNumber]) {
                                  debugPrint("Correct");
                                  finalScore++;
                                } else {
                                  debugPrint("Wrong");
                                }
                                updateQuestion();
                              }),
                        ],
                      ),
                    ),
                    new Padding(padding: EdgeInsets.all(15.0)),
                  ],
                )
              ],
            )));
  }

  void resetQuiz() {
    setState(() {
      finalScore = 0;
      questionNumber = 0;
      Navigator.pop(context);
    });
  }

  void updateQuestion() {
    setState(() {
      if (questionNumber == quiz.questions.length - 1) {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new Summary(
                      score: finalScore,
                    )));
      } else {
        questionNumber++;
      }
    });
  }
}

class Summary extends StatelessWidget {
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int count = 0;
    return new Scaffold(
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Final Score: $score",
              style: new TextStyle(fontSize: 35.0),
            ),
            new Padding(padding: EdgeInsets.all(30.0)),
            new MaterialButton(
              color: Colors.red,
              onPressed: () {
                questionNumber = 0;
                finalScore = 0;
                Navigator.popUntil(context, (route) {
                  return count++ == 2;
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
