//import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:QuizApp/screens/theme/theme.dart';

//import 'package:QuizApp/screens/widgets/theme.dart';

enum SettingAction { CANCEL, ACCEPT }

class Setting extends StatefulWidget {
  final int fontSize;
  final Color colorTheme;

  Setting({this.fontSize, this.colorTheme});
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String dropdownValue = '16';
  String letterSpacing = '0.5';

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Application Settings',
        ),
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: height / 12,
              width: width,
              color: Colors.grey[200],
              child: Align(
                alignment: Alignment
                    .center, // Align however you like (i.e .centerRight, centerLeft)
                child: Text(
                  "General Settings",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "\n    Color Theme    \n",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Consumer<ThemeNotifier>(
              builder: (context, notifier, child) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new RawMaterialButton(
                    onPressed: () {
                      notifier.saveColor('theme', 'blue');
                    },
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.blue,
                    padding: const EdgeInsets.all(15.0),
                  ),
                  new RawMaterialButton(
                    onPressed: () {
                      notifier.saveColor('theme', 'purple');
                    },
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.deepPurple,
                    padding: const EdgeInsets.all(15.0),
                  ),
                  new RawMaterialButton(
                    onPressed: () {
                      notifier.saveColor('theme', 'red');
                    },
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.red,
                    padding: const EdgeInsets.all(15.0),
                  ),
                  new RawMaterialButton(
                    onPressed: () {
                      notifier.saveColor('theme', 'green');
                    },
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.green,
                    padding: const EdgeInsets.all(15.0),
                  ),
                ],
              ),
            ),
            new Divider(
              height: 40,
              color: Colors.grey,
              thickness: 0.5,
            ),
            Consumer<ThemeNotifier>(
              builder: (context, notifier, child) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "\n    Font Size    \n",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      new DropdownButton<String>(
                        value: dropdownValue,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                            notifier.saveFontSize('font', '$dropdownValue');
                          });
                        },
                        items: <String>['16', '18', '20', '22']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 16),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            new Divider(
              height: 20,
              color: Colors.white,
              thickness: 0.5,
            ),

            /*
            Container(
              height: height / 12,
              width: width,
              color: Colors.grey[200],
              child: Align(
                alignment: Alignment
                    .center, // Align however you like (i.e .centerRight, centerLeft)
                child: Text(
                  "Account Settings",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            */
          ],
        ),
      ),
    );
  }
}
