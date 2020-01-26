import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {

  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  const LabelWidget({Key key, this.text = 'Descrição', this.fontSize = 24, this.fontWeight = FontWeight.bold}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
