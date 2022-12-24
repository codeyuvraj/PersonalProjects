import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionNumber;
  final Function function;
  Quiz({
    required this.questions,
    required this.questionNumber,
    required this.function
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Question(questions[questionNumber]['question'] as String),
      ...(questions[questionNumber]['answer'] as List<Map<String, Object>>).map((answer) {
              return Answer(() => function(answer['score']), answer['text'] as String,);
            }).toList()
      ],
      
    );
  }
}
