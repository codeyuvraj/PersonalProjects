import 'package:flutter/material.dart';

class MyInfo extends StatelessWidget {
  
  String aboutText;
  MyInfo(this.aboutText);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('$aboutText',
    style: TextStyle(
      fontSize: 40,
    ),),);
  }
}
