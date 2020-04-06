import 'package:QuizApp/screens/home/summary.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class PoliceAct extends StatefulWidget {
  @override
  _PoliceActState createState() => _PoliceActState();
}

double finalScore = 0;
var questionNumber = 0;
double temp = 0;
bool selected = false;

class OptionValue {
  final bool _key;
  final String _value;
  final String _hint;
  OptionValue(this._value, this._key, this._hint);
}

class question {
  final String text;
  final String type;
  final String imageId;
  question(this.text, this.type, this.imageId);
}

final _buttonOptions = [
  [
    OptionValue("This is a sample Answer 1", true, 'This is sample hint 1,'),
    OptionValue("This is a sample Answer 2", false, 'This is sample hint 2'),
    OptionValue("This is a sample Answer 3", false, 'This is sample hint 3'),
    OptionValue("This is a sample Answer 4", false, 'This is sample hint 4'),
  ],
  [
    OptionValue("This is a sample Answer 1", true, 'This is sample hint 1'),
    OptionValue("This is a sample Answer 2", false, 'This is sample hint 2'),
    OptionValue("This is a sample Answer 3", false, 'This is sample hint 3'),
    OptionValue("This is a sample Answer 4", false, 'This is sample hint 4'),
  ],
  [
    OptionValue("True", true, 'This is sample hint 1'),
    OptionValue("False", false, 'This is sample hint 2'),
  ],
  [
    OptionValue("This is a sample Answer 1", true, 'This is sample hint 1'),
    OptionValue("This is a sample Answer 2", false, 'This is sample hint 2'),
    OptionValue("This is a sample Answer 3", false, 'This is sample hint 3'),
    OptionValue("This is a sample Answer 4", false, 'This is sample hint 4'),
  ],
];

final questions = [
  [question('This is a sample question 1', 'multiple choice', '1')],
  [question('This is a sample question 2', 'multiple choice', null)],
  [question('This is a sample question 3', 'true false', '3')],
  [question('This is a sample question 4', 'multiple answer', null)],
];

List<Color> _color = [
  Colors.black,
  Colors.black,
  Colors.black,
  Colors.black,
].toList();

List<Icon> _icon = [
  Icon(null),
  Icon(null),
  Icon(null),
  Icon(null),
].toList();

List<Icon> _checkBox = [
  Icon(Icons.check_box_outline_blank),
  Icon(Icons.check_box_outline_blank),
  Icon(Icons.check_box_outline_blank),
  Icon(Icons.check_box_outline_blank),
].toList();

List<Text> _hint = [
  Text(''),
  Text(''),
  Text(''),
  Text(''),
].toList();

class _PoliceActState extends State<PoliceAct> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var imageID = questions[questionNumber].elementAt(0).imageId;
    return new Scaffold(
      backgroundColor: Colors.blue[50],
      floatingActionButton: Container(
        height: 50.0,
        width: 100.0,
        child: FloatingActionButton(
          onPressed: () {
            selected = false;
            updateQuestion();
          },
          child: Icon(Icons.arrow_forward_ios),
          backgroundColor: Colors.green,
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
              "Question ${questionNumber + 1} of ${questions.length}",
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
          height: height / 1.3,
          margin: const EdgeInsets.all(15.0),
          alignment: Alignment.topCenter,
          child: new Column(
            children: <Widget>[
              // image (optional)
              ClipRRect(
                  // borderRadius: BorderRadius.circular(8.0),
                  child: imageID != null
                      ? Image.asset(
                          "assets/quiz_image_${questionNumber + 1}.jpg",
                          fit: BoxFit.fill,
                          height: height / 3.5,
                          width: width,
                        )
                      : null),

              Padding(padding: EdgeInsets.all(10)),
              // question
              new Text(
                questions[questionNumber].elementAt(0).text,
                style: new TextStyle(fontSize: 20),
              ),
              Padding(padding: EdgeInsets.all(10)),
              // break line
              Row(children: <Widget>[
                Expanded(
                    child: Divider(
                  color: Colors.blue[400],
                  thickness: 2,
                )),
              ]),
              Expanded(
                child: new ListView.builder(
                  itemCount: _buttonOptions[questionNumber].length,
                  itemBuilder: (BuildContext context, int index) {
                    String key =
                        _buttonOptions[questionNumber].elementAt(index)._value;

                    var validate =
                        _buttonOptions[questionNumber].elementAt(index)._key;
                    String hint =
                        _buttonOptions[questionNumber].elementAt(index)._hint;

                    String type = questions[questionNumber].elementAt(0).type;

                    return new Column(
                      children: <Widget>[
                        new ListTile(
                            title: new Text(
                              "$key",
                              style: TextStyle(
                                  color: _color[index],
                                  fontWeight: FontWeight.bold),
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
                      ],
                    );
                  },
                ),
              ),
              // submit button
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
      selected = !selected;
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
      _hint = [
        Text(''),
        Text(''),
        Text(''),
        Text(''),
      ];
    });
  }

  void updateQuestion() {
    setState(() {
      temp = finalScore;

      if (questionNumber == questions.length - 1) {
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
      } else {
        questionNumber++;
        selected = false;
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
        _hint = [
          Text(''),
          Text(''),
          Text(''),
          Text(''),
        ];
      }
    });
  }
}
