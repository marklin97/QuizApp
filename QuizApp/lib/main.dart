import 'package:QuizApp/services/auth.dart';
import 'package:flutter/material.dart';
import './screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:QuizApp/models/user.dart';
import 'package:QuizApp/screens/theme/theme.dart';

ThemeData setTheme(String theme) {
  if (theme == 'blue') {
    return light;
  }
  if (theme == 'purple') {
    return dark;
  }
  if (theme == 'red') {
    return red;
  }
  if (theme == 'green') {
    return green;
  }
  return light;
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: ChangeNotifierProvider(
        create: (_) => ThemeNotifier(),
        child: Consumer<ThemeNotifier>(
          builder: (context, ThemeNotifier notifier, child) {
            return MaterialApp(
              title: 'Flutter Theme Provider',
              debugShowCheckedModeBanner: false,
              theme: setTheme(notifier.colorTheme),
              home: Wrapper(),
            );
          },
        ),
      ),
    );
  }
}
