import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  iconTheme: new IconThemeData(color: Colors.red, opacity: 1.0),
  scaffoldBackgroundColor: Colors.white,
  buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
  textTheme: TextTheme(
    title: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
    body2: TextStyle(color: Colors.blue),
  ),
);

ThemeData dark = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.deepPurple,
  iconTheme: new IconThemeData(color: Colors.pink, opacity: 1.0),
  buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
  textTheme: TextTheme(
    title: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
    body2: TextStyle(color: Colors.black),
  ),
);

ThemeData red = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.red,
  iconTheme: new IconThemeData(color: Colors.red, opacity: 1.0),
  scaffoldBackgroundColor: Colors.white,
  buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
  textTheme: TextTheme(
    title: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
    body2: TextStyle(color: Colors.red),
  ),
);

ThemeData green = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.green,
  iconTheme: new IconThemeData(color: Colors.green, opacity: 1.0),
  scaffoldBackgroundColor: Colors.white,
  buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
  textTheme: TextTheme(
    title: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
    body2: TextStyle(color: Colors.green),
  ),
);

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  final String temp = 'color';
  SharedPreferences _prefs;
  String _colorTheme;

  String get colorTheme => _colorTheme;

  ThemeNotifier() {
    _colorTheme = 'red';
    _loadFromPrefs();
  }

  toggleTheme() {
    _saveToPrefs();
    notifyListeners();
  }

  saveColor(key, colorTheme) async {
    await _initPrefs();
    _prefs.setString(temp, colorTheme);
    _colorTheme = _prefs.getString(temp);
    notifyListeners();
  }

  _initPrefs() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();

    _colorTheme = _prefs.getString(temp);
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
  }
}
