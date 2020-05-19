import 'package:flutter/material.dart';
import 'package:grindgrain/screens/home_screen.dart';

// import 'package:grindgrain/screens/home_screen.dart';
class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}