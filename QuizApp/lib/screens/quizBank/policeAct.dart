import 'package:QuizApp/screens/home/summary.dart';
import 'package:flutter/material.dart';

class PoliceAct extends StatefulWidget {
  @override
  _PoliceActState createState() => _PoliceActState();
}

var finalScore = 0;
var questionNumber = 0;
var temp = 0;
var quiz = new AnimalQuiz();

int _optionSelected = 0;

class OptionValue {
  final int _key;
  final String _value;
  OptionValue(this._value, this._key);
}

final _buttonOptions = [
  OptionValue("This is a sample question 1", 1),
  OptionValue("This is a sample question 2", 2),
  OptionValue("This is a sample question 3", 3),
  OptionValue("This is a sample question 4", 4),
];

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
    Color color;
    return new Scaffold(
      backgroundColor: Colors.green[50],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => resetQuiz(),
          ),
          centerTitle: true,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
      body: SingleChildScrollView(
        child: new Container(
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          height: height / 1.2,
          margin: const EdgeInsets.all(15.0),
          alignment: Alignment.topCenter,
          child: new Column(
            children: <Widget>[
              new Container(
                alignment: Alignment.centerRight,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[],
                ),
              ),
              // image (optional)
              Padding(padding: EdgeInsets.all(10)),

              new Text(
                quiz.questions[questionNumber],
                style: new TextStyle(fontSize: 20),
              ),
              Padding(padding: EdgeInsets.all(20)),
              ClipRRect(
                // borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  "assets/quiz_image_${questionNumber + 1}.jpg",
                  fit: BoxFit.fill,
                  height: height / 4,
                  width: width,
                ),
              ),

              // break line
              Row(children: <Widget>[
                Expanded(
                    child: Divider(
                  color: Colors.green[400],
                  thickness: 2,
                )),
              ]),
              new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _buttonOptions
                    .map(
                      (timeValue) => Column(children: <Widget>[
                        Container(
                          color: color,
                          child: RadioListTile(
                            dense: true,
                            activeColor: Colors.blue,
                            title: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                timeValue._value,
                                style: new TextStyle(fontSize: 20),
                              ),
                            ),
                            value: timeValue._key,
                            groupValue: _optionSelected,
                            controlAffinity: ListTileControlAffinity.trailing,
                            onChanged: (val) {
                              setState(() {
                                debugPrint('VAL = $val');
                                color = Colors.lightGreen;
                                _optionSelected = val;
                              });
                            },
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.blueGrey,
                          thickness: 1,
                        )
                      ]),
                    )
                    .toList(),
              ),

              // submit button
              Padding(padding: EdgeInsets.all(20)),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new MaterialButton(
                      minWidth: 100.0,
                      height: 40.0,
                      color: Colors.red,
                      onPressed: resetQuiz,
                      child: new Text(
                        "Quit",
                        style:
                            new TextStyle(fontSize: 18.0, color: Colors.white),
                      )),
                  MaterialButton(
                    minWidth: 100.0,
                    height: 40.0,
                    color: Colors.blue,
                    onPressed: () {
                      if (quiz.choices[questionNumber][0] ==
                          quiz.correctAnswers[questionNumber]) {
                        debugPrint("Correct");
                        finalScore++;
                      } else {
                        debugPrint("Wrong");
                      }
                      updateQuestion();
                    },
                    child: new Text(
                      'Next',
                      style: new TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void resetQuiz() {
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
    });
  }

  void updateQuestion() {
    setState(() {
      temp = finalScore;
      if (questionNumber == quiz.questions.length - 1) {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new Summary(
                      score: temp,
                      questionNumber: questionNumber,
                    )));
        questionNumber = 0;
        finalScore = 0;
      } else {
        questionNumber++;
        _optionSelected = 0;
      }
    });
  }
}
