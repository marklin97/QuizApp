import 'package:QuizApp/screens/home/summary.dart';
import 'package:flutter/material.dart';

class PoliceAct extends StatefulWidget {
  final int selectedNumber;

  @override
  _PoliceActState createState() => _PoliceActState();

  PoliceAct({this.selectedNumber});
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

var questions = [
  [
    question(
        'You are a male police officer and detain a woman you suspect is attempting to smuggle illicit substances into Download Music Festival in Parramatta Park. You have told her you will conduct a strip search on her. Is this allowed?',
        'true false',
        null)
  ],
  [
    question(
        'You are a male police officer who has detained a male suspect at Download Music Festival in Parramatta Park. The male suspect tells you he is uncomfortable with stripping in front of your police body-cam, and asks you to switch it off. What is the proper way of responding to this problem?',
        'multiple choice',
        null)
  ],
  [
    question(
        'Police are required to make contemporaneous records of all person searches. What should be included in this record?  \n\na.	The type of search carried out \nb.	The reason for the search \nc.	The officer/s who carried out the search \nd.	Whether force was used',
        'multiple choice',
        null)
  ],
  [
    question(
        'You find a brand new jacket in a person’s backpack with a tag still attached. They are not carrying a bag or any sort of packaging from the store they had gotten it from, nor can they provide a receipt. They claim to have paid for it using cash if questioned about transaction history.',
        'multiple choice',
        null)
  ],
];

var tempArray = questions;
final _buttonOptions = [
  [
    OptionValue("1. True", true, ''),
    OptionValue("2. False", false,
        'Consider what the Person Search manual says about searching the opposite sex'),
  ],
  [
    OptionValue(
        "1. Invite another police officer in to make it less awkward",
        false,
        'this may lead to escalation. Would be hard to diffuse the situation if you undertook this option'),
    OptionValue(
        "2. Tell the suspect you are legally obligated to film all strip searches as it is a form of evidence to prove guilt or innocence",
        false,
        'The NSW Court of Criminal Appeal '),
    OptionValue("3. Release him since he’s being troublesome", false,
        'Defensiveness is suspicious. How do we know he didn’t have drugs?'),
    OptionValue("4. Grab him and tear off his clothes", false,
        'this could lead to your suspension and possible imprisonment for brutality'),
  ],
  [
    OptionValue("1. A and B", true, ''),
    OptionValue("2. A and C", false, ''),
    OptionValue("3. B, C and D", false, ''),
    OptionValue("4. A,B,C and D", false, ''),
  ],
  [
    OptionValue(
        "1. You find a brand new jacket in a person’s backpack with a tag still attached. They are not carrying a bag or any sort of packaging from the store they had gotten it from, nor can they provide a receipt. They claim to have paid for it using cash if questioned about transaction history.",
        true,
        ' '),
    OptionValue(
        "2. You approach a person at a music festival. They don’t seem entirely lucid. You ask them a series of questions.\n Q: How did you get here? \n Q: Are you under the influence of anything? Alcohol or otherwise? \n Q: Can you show me any sort of identification?",
        false,
        ''),
    OptionValue(
        "3. You spot someone wandering about in the middle of the might holding a heavy flashlight and large bag. They say they are just heading home when asked.",
        false,
        ''),
  ],
];

/*
final questions = [
  [question('This is a sample question 1', 'multiple choice', '1')],
  [question('This is a sample question 2', 'multiple choice', null)],
  [question('This is a sample question 3', 'true false', '3')],
  [question('This is a sample question 4', 'multiple answer', null)],
];
*/
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
    tempArray = questions.take(widget.selectedNumber).toList();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var imageID = tempArray[questionNumber].elementAt(0).imageId;
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
                      String key = _buttonOptions[questionNumber]
                          .elementAt(index)
                          ._value;

                      var validate =
                          _buttonOptions[questionNumber].elementAt(index)._key;
                      String hint =
                          _buttonOptions[questionNumber].elementAt(index)._hint;

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
