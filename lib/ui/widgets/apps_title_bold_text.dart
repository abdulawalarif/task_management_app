import 'package:flutter/material.dart';

class AppsTitleBoldText extends StatelessWidget {
  final String title;

  const AppsTitleBoldText(
      {super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold),
    );
  }
}
