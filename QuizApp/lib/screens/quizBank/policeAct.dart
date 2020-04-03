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
bool selected = false;
int _optionSelected = 0;

class OptionValue {
  final bool _key;
  final String _value;
  OptionValue(this._value, this._key);
}

final _buttonOptions = [
  [
    OptionValue("This is a sample Answer 1", true),
    OptionValue("This is a sample Answer 2", false),
    OptionValue("This is a sample Answer 3", false),
    OptionValue("This is a sample Answer 4", false),
  ],
  [
    OptionValue("This is a sample Answer 1", true),
    OptionValue("This is a sample Answer 2", false),
    OptionValue("This is a sample Answer 3", true),
    OptionValue("This is a sample Answer 4", true),
  ],
];

class AnimalQuiz {
  var questions = [
    "This is a sample question 1 ",
    "This is a sample question 2 ",
    "This is a sample question 3 ",
    "This is a sample question 4 ",
  ];
}

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

class _PoliceActState extends State<PoliceAct> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
          backgroundColor: Colors.green[400],
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

              ClipRRect(
                // borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  "assets/quiz_image_${questionNumber + 1}.jpg",
                  fit: BoxFit.fill,
                  height: height / 3.5,
                  width: width,
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              new Text(
                quiz.questions[questionNumber],
                style: new TextStyle(fontSize: 20),
              ),
              Padding(padding: EdgeInsets.all(10)),
              // break line
              Row(children: <Widget>[
                Expanded(
                    child: Divider(
                  color: Colors.green[400],
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
                    return new Column(
                      children: <Widget>[
                        new ListTile(
                            title: new Text(
                              "$key",
                              style: TextStyle(
                                  color: _color[index],
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: _icon[index],
                            onTap: () {
                              if (selected == false) {
                                if (validate == true) {
                                  setState(() {
                                    _color[index] = Colors.green[400];

                                    _icon[index] = Icon(
                                      Icons.done,
                                      color: Colors.green,
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
                                    selected = true;
                                  });
                                }
                              }
                            }),
                        new Divider(
                          height: 2.0,
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
