import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final VoidCallback function;
  TextControl(this.function);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text(
          'Next',
          style: TextStyle(fontSize: 50),
        ),
        onPressed: function,
      ),
    );
  }
}
