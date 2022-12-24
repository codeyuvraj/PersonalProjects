import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  var totalScore;
  final VoidCallback restartQuiz;
  Result(this.totalScore,this.restartQuiz);

  String get reviewText {
    String text;
    if (totalScore < 10) {
      text = 'Poor';
    } else if (totalScore < 20) {
      text = 'Average';
    } else if (totalScore < 30) {
      text = 'Good';
    } else if (totalScore < 40) {
      text = 'Very Good';
    } else {
      text = 'Excellent';
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Column(

        children: [
          Text(
            'Your Score is $totalScore. $reviewText',
            style: TextStyle(
                backgroundColor: Color.fromARGB(138, 7, 200, 158),
                fontSize: 36,
                fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
          TextButton(onPressed: restartQuiz, child: Text('Restart'))
        ],
      ),
    );
  }
}
