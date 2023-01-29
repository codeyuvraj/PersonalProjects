import 'package:flutter/material.dart';
import './screens_widget/additemsscreen.dart';
import './screens_widget/homescreen.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomeScreen(),
        '/additemscreen': (context) => AddItemScreen(),
      },
    );
  }
}
