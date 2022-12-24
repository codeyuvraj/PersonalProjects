import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  
  // void Function()? function;
  final VoidCallback function;
  String? answer;
  Answer(this.function, this.answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text('$answer'),
        onPressed: function,
      ),
    );
  }
}
