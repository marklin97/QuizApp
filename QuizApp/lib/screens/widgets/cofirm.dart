import 'package:QuizApp/screens/quizBank/policeAct.dart';
import 'package:flutter/material.dart';

enum ConfirmAction { CANCEL, ACCEPT }

class Confirm extends StatefulWidget {
  final String module_name;
  final String total_quiz;
  final String level;
  Confirm({this.module_name, this.total_quiz, this.level});
  @override
  _ConfirmState createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  int _value = 10;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AlertDialog(
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.white12)),
      title: Text(widget.module_name),
      content: Text(
        widget.total_quiz + '\n\nSelect number of question you want',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: <Widget>[
        Slider(
            value: _value.toDouble(),
            min: 10.0,
            max: 50,
            divisions: 10,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PoliceAct()),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
