import 'package:flutter/material.dart';
import 'dart:async';

class CountDown extends StatefulWidget {
  final int timeLimit;
  final void method;

  CountDown({this.timeLimit, this.method});

  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  Timer _timer;
  int _start = 10;

  Widget build(BuildContext context) {
    void startTimer() {
      const oneSec = const Duration(seconds: 1);
      _timer = new Timer.periodic(
        oneSec,
        (Timer timer) => setState(
          () {
            if (_start < 1) {
              timer.cancel();
            } else {
              _start = _start - 1;
            }
          },
        ),
      );
    }

    return Container(
      height: 50.0,
      width: 100.0,
      child: FloatingActionButton(
        onPressed: startTimer,
        child: Text("$_start"),
        backgroundColor: Colors.green,
      ),
    );
  }
}
