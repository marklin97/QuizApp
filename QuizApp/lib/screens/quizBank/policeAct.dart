import 'package:flutter/material.dart';

class PoliceAct extends StatefulWidget {
  @override
  _PoliceActState createState() => _PoliceActState();
}

var finalScore = 0;
var questionNumber = 0;
var quiz = new AnimalQuiz();

class AnimalQuiz {
  var images = ["alligator", "cat", "dog", "owl"];

  var questions = [
    "This animal is a carnivorous reptile.",
    "_________ like to chase mice and birds.",
    "Give a _________ a bone and he will find his way home",
    "A nocturnal animal with some really big eyes",
  ];

  var choices = [
    ["Cat", "Sheep", "Alligator", "Cow"],
    ["Cat", "Snail", "Slug", "Horse"],
    ["Mouse", "Dog", "Elephant", "Donkey"],
    ["Spider", "Snake", "Hawk", "Owl"]
  ];

  var correctAnswers = ["Alligator", "Cat", "Dog", "Owl"];
}

class _PoliceActState extends State<PoliceAct> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return new WillPopScope(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Police Act 1990'),
              backgroundColor: Colors.blue[400],
              elevation: 0.0,
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
                        children: <Widget>[
                          new Text(
                            "Question ${questionNumber + 1} of ${quiz.questions.length}",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                            ),
                          ),
                          new Text(
                            "Score: $finalScore",
                            style: TextStyle(color: Colors.green, fontSize: 22),
                          )
                        ],
                      ),
                    ),
                    // image
                    Padding(padding: EdgeInsets.all(10)),

                    ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset("assets/quiz_image_1.jpg",
                            fit: BoxFit.fill, height: height / 2.5)),

                    Padding(padding: EdgeInsets.all(20)),
                    new Text(
                      quiz.questions[questionNumber],
                      style: new TextStyle(fontSize: 20),
                    )
                  ],
                ))));
  }
}
