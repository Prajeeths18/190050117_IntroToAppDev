import 'package:flutter/material.dart';

class startQuiz extends StatelessWidget {
  const startQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.grey[600],
          title: Text("Quiz App - True or False"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: TextButton(
            style: TextButton.styleFrom(
              minimumSize: Size(double.infinity, double.infinity),
            ),
            child: Text(
              "Tap anywhere to start...",
              style: TextStyle(fontSize: 25.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ));
  }
}
