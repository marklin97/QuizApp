import 'package:QuizApp/screens/home/summary.dart';
import 'package:flutter/material.dart';
import 'package:QuizApp/screens/quizBank/questions.dart';
import 'dart:async';

class PoliceAct extends StatefulWidget {
  final int selectedNumber;
  @override
  _PoliceActState createState() => _PoliceActState();

  PoliceAct({this.selectedNumber});
}

// temporary vairable for storing user
double finalScore = 0;
double temp = 0;
bool selected = false;
Timer _timer;
var questionNumber = 0;
var _color = color;
var _icon = icon;
var _checkBox = checkBox;
var _hint = hint;

// temp variable use to store the questions
var tempArray = questions;
var _buttonOptions = options;

// temp varaibles use to store timer state
int _start = 30;
Color timerColor = Colors.green;
dynamic timerIcon = Text("$_start");
//Icon(Icons.arrow_forward_ios);

class _PoliceActState extends State<PoliceAct> {
  @override
  Widget build(BuildContext context) {
    tempArray = questions.take(widget.selectedNumber).toList();
    double height = MediaQuery.of(context).size.height;

    return new Scaffold(
      backgroundColor: Colors.blue[50],
      floatingActionButton: Container(
        height: 50.0,
        width: 100.0,
        child: FloatingActionButton(
          onPressed: () {
            if (selected == true) {
              selected = false;
              updateQuestion();
            }
          },
          child: timerIcon,
          backgroundColor: timerColor,
        ),
      ),
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
              "Question ${questionNumber + 1} of ${tempArray.length}",
            ),
            Text(
              "Score: $finalScore",
            ),
          ]),
          elevation: 0.0,
        ),
      ),
      body: new Container(
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: const EdgeInsets.all(20.0),
        alignment: Alignment.topCenter,
        child: new Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: new Container(
                  margin: const EdgeInsets.all(20.0),
                  constraints: BoxConstraints(minHeight: height / 3.5),
                  child: Center(
                    child: Text(
                      '       ' + tempArray[questionNumber].elementAt(0).text,
                      style: new TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                          letterSpacing: 1.0),
                    ),
                  ),
                ),
              ),
            ),

            Padding(padding: EdgeInsets.all(5)),

            // break line
            Row(children: <Widget>[
              Expanded(
                  child: Divider(
                color: Colors.blue[400],
                thickness: 2,
              )),
            ]),

            SingleChildScrollView(
              child: new Container(
                constraints: BoxConstraints(maxHeight: height / 2.2),
                child: new ListView.builder(
                    itemCount: _buttonOptions[questionNumber].length,
                    itemBuilder: (BuildContext context, int index) {
                      // retrive option details
                      String key =
                          _buttonOptions[questionNumber].elementAt(index).value;

                      bool validate =
                          _buttonOptions[questionNumber].elementAt(index).key;
                      String hint =
                          _buttonOptions[questionNumber].elementAt(index).hint;

                      String type = tempArray[questionNumber].elementAt(0).type;

                      return new Column(children: <Widget>[
                        Padding(padding: EdgeInsets.all(2)),
                        new ListTile(
                            title: new Text(
                              "$key",
                              style: TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 0.5,
                                  color: _color[index],
                                  fontWeight: FontWeight.w800),
                            ),
                            subtitle: _hint[index],
                            trailing: type == 'multiple answer'
                                ? _checkBox[index]
                                : _icon[index],
                            onTap: () {
                              if (selected == false &&
                                  type != 'multiple answer') {
                                if (validate == true) {
                                  setState(() {
                                    finalScore++;
                                    _color[index] = Colors.green[400];

                                    _icon[index] = Icon(
                                      Icons.done,
                                      color: Colors.green,
                                    );

                                    _hint[index] = Text(
                                      hint,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.green[400]),
                                    );
                                    selected = true;
                                  });
                                } else {
                                  setState(() {
                                    _color[index] = Colors.red[400];
                                    _icon[index] = Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    );
                                    _hint[index] = Text(
                                      hint,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red[400]),
                                    );
                                    selected = true;
                                  });
                                }
                              }
                              if (type == 'multiple answer') {
                                setState(() {
                                  if (validate == true) {
                                    _checkBox[index] = Icon(
                                      Icons.done,
                                      color: Colors.green,
                                    );
                                    _color[index] = Colors.green[400];
                                    finalScore += 0.5;
                                  } else {
                                    _checkBox[index] = Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    );
                                    _color[index] = Colors.red[400];
                                    finalScore -= 0.5;
                                  }
                                });
                              }
                            }),
                        new Divider(
                          height: 0.5,
                          color: Colors.grey,
                        ),
                      ]);
                    }),
              ),
            ),

            // submit button
          ],
        ),
      ),
    );
  }

  void startTimer() async {
    const oneSec = Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        if (_start < 20) {
          timerColor = Colors.red;
        }
        if (_start < 1) {
          timer.cancel();
          updateQuestion();
        } else if (selected == true) {
          timer.cancel();
          timerIcon = Icon(Icons.arrow_forward_ios);
        } else {
          _start = _start - 1;
          timerIcon = Text("$_start");
        }
      });
    });
  }

  void clearState() {
    _color = [
      Colors.black,
      Colors.black,
      Colors.black,
      Colors.black,
    ];
    _icon = [
      Icon(null),
      Icon(null),
      Icon(null),
      Icon(null),
    ];
    _checkBox = [
      Icon(Icons.check_box_outline_blank),
      Icon(Icons.check_box_outline_blank),
      Icon(Icons.check_box_outline_blank),
      Icon(Icons.check_box_outline_blank),
    ];

    _hint = [
      Text(''),
      Text(''),
      Text(''),
      Text(''),
    ];
  }

  void resetQuiz() {
    setState(() {
      Navigator.pop(context);
      _start = 30;
      finalScore = 0;
      questionNumber = 0;
      selected = !selected;
      clearState();
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void updateQuestion() {
    _start = 30;

    setState(() {
      temp = finalScore;
      timerColor = Colors.green;
      if (questionNumber == tempArray.length - 1) {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new Summary(
                      score: temp,
                      questionNumber: questionNumber,
                    )));
        questionNumber = 0;
        finalScore = 0;

        selected = false;
        clearState();
      } else {
        questionNumber++;
        selected = false;
        clearState();
      }
    });
    startTimer();
  }
}
