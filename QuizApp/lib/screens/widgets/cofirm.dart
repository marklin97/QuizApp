import 'package:QuizApp/screens/modules/sample/sampleQuestions.dart';
import 'package:flutter/material.dart';

enum ConfirmAction { CANCEL, ACCEPT }

class Confirm extends StatefulWidget {
  final String moduleName;
  final int totalQuiz;
  final String level;
  Confirm({this.moduleName, this.totalQuiz, this.level});
  @override
  _ConfirmState createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  // initial slider bar value
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double min = 1.0;
    double max = widget.totalQuiz.toDouble();
    int divisions = (max - min).toInt();

    if (widget.moduleName == 'Sample Questions') {
      return AlertDialog(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.white12)),
        title: Text(widget.moduleName),
        content: Text(
          'Total question : ${widget.totalQuiz.toString()}\n\n Slide to select number of questions',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        actions: <Widget>[
          Slider(
              value: _value.toDouble(),
              min: min,
              max: max,
              divisions: divisions,
              activeColor: Colors.green,
              inactiveColor: Colors.blue,
              label: _value.toString(),
              onChanged: (double newValue) {
                setState(() {
                  _value = newValue.round();
                });
              },
              semanticFormatterCallback: (double newValue) {
                return '${newValue.round()} dollars';
              }),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              SizedBox(width: width / 5),
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop(ConfirmAction.CANCEL);
                },
              ),
              SizedBox(width: 20),
              FlatButton(
                child: const Text('START'),
                onPressed: () {
                  Navigator.of(context).pop(ConfirmAction.ACCEPT);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SampleQuestions(selectedNumber: _value)),
                  );
                },
              ),
            ],
          ),
        ],
      );
    } else {
      return AlertDialog(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.white12)),
        content: Text('Not Available\n\n\n'),
        actions: <Widget>[
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          SizedBox(width: width / 5),
          FlatButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.CANCEL);
            },
          ),
          SizedBox(width: 20),
        ],
      );
    }
  }
}
