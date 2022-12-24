// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String text;
  Question(this.text);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(margin: EdgeInsets.symmetric(vertical: 8.0), width: double.infinity, color: Color(0xFFFF9000) ,
    child:Text('$text',style: TextStyle(fontSize: 50,),textAlign: TextAlign.center,));
  }
}
