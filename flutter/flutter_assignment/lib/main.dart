// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text
import 'package:flutter/material.dart';

import './myInfo.dart';
import './textControl.dart';

void main() {
  runApp(MyTextApp());
}

class MyTextApp extends StatefulWidget {
  const MyTextApp({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyTextAppState();
  }
}

class MyTextAppState extends State<MyTextApp> {
  var myDescription = [
    'Hello I am Yuvraj Singh',
    'I\'m currently pursuing Btech from IIITDM Kancheepuram',
    'Age = 20'
  ];
  var counter = 0;

  void myDescriptionCounter() {
    setState(() {
      counter++;
      counter %= 3;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 154, 80, 51),
        title: Text('About Me',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 4, 2, 57))),
      ),
      body: Column(
        children: [
          MyInfo(myDescription[counter]),
          TextControl(myDescriptionCounter)],
      ),
    ));
  }
}
