import 'package:QuizApp/screens/widgets/cofirm.dart';
import 'package:flutter/material.dart';

class Module extends StatefulWidget {
  final IconData icon;
  final String module_name;
  final int total_quiz;
  final String level;
  Module({this.module_name, this.total_quiz, this.level, this.icon});
  @override
  _ModuleState createState() => _ModuleState();
}

class _ModuleState extends State<Module> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: new MaterialButton(
        height: height / 4,
        child: Row(
          children: <Widget>[
            Icon(
              widget.icon,
              color: Colors.blue,
              size: 80.0,
            ),
            SizedBox(
              width: 20,
            ),
            new Column(
              children: <Widget>[
                Text(
                  widget.module_name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                Text(
                  'Total questions : ${widget.total_quiz}',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                Text(
                  widget.level,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            )

            // layout
          ],
        ),
        splashColor: Colors.red[500],
        color: Colors.white,
        onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return Confirm(
                module_name: widget.module_name,
                total_quiz: widget.total_quiz,
              );
            }),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.white12)),
      ),
    );
  }
}
