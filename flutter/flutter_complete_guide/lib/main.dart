// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var _counter = 0;
  var _totalScore = 0;
  var _questions = [
    {
      'question': 'Current Indian Prime Minister',
      'answer': [
        {'text': 'Narendra Modi', 'score': 10},
        {'text': 'R Gandhi', 'score': 0},
        {'text': 'Biden', 'score': 0},
        {'text': 'A Kejriwal', 'score': 0}
      ]
    },
    {
      'question': 'Current UK Prime Minister',
      'answer': [
        {'text': 'Narendra Modi', 'score': 0},
        {'text': 'R Gandhi', 'score': 0},
        {'text': 'Rishi Sunak', 'score': 10},
        {'text': 'A Kejriwal', 'score': 0}
      ]
    },
    {
      'question': 'Current US President',
      'answer': [
        {'text': 'Trump', 'score': 0},
        {'text': 'Kamala Harris', 'score': 0},
        {'text': 'Biden', 'score': 10},
        {'text': 'Puneet Superstar', 'score': 0}
      ]
    },
    {
      'question': 'Ceo of Tesla',
      'answer': [
        {'text': 'Rishi Sunak', 'score': 0},
        {'text': 'Kaun Elon Musk', 'score': 10},
        {'text': 'Sundar Pichai', 'score': 0},
        {'text': 'Mark', 'score': 0}
      ]
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _counter = (_counter + 1) % 8;
    });

    print('Button Clicked');
  }

  void _restartQuiz() {
    setState(() {
      _counter = 0;
      _totalScore = 0;
      
    });
  }

  Widget? _bodyDesign() {
    if (_counter <= 3) {
      return Quiz(
          function: _answerQuestion,
          questionNumber: _counter,
          questions: _questions);
    } else {
      return Result(_totalScore, _restartQuiz);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0x00FF9000),
            title: Text(
              'First App ',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            titleTextStyle: TextStyle(fontStyle: FontStyle.italic),
          ),
          // body: Column(
          //   children: [
          // Question('Question $_counter'),
          // Answer(_answerQuestion, 1),
          // Answer(_answerQuestion, 2),
          // Answer(_answerQuestion, 3),

          //New way of doing the same thing as above
          // Question((_questions[_counter]['question']) as String),

          // ...(_questions[_counter]['answer'] as List<String>).map((answer) {
          //   return Answer(_answerQuestion, answer);
          // }).toList(),
          //   ],
          // ),
          body: _bodyDesign()),
    );
  }
}
