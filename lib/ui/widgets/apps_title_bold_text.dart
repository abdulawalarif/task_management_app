import 'package:flutter/material.dart';

class AppsTitleBoldText extends StatelessWidget {
  final String title;
  final fontSize;
  const AppsTitleBoldText(
      {super.key, required this.title, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.black, fontSize: fontSize, fontWeight: FontWeight.bold),
    );
  }
}
