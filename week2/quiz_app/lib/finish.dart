import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FinishedQuiz extends StatefulWidget {
  const FinishedQuiz({Key? key}) : super(key: key);

  @override
  _FinishedQuizState createState() => _FinishedQuizState();
}

class _FinishedQuizState extends State<FinishedQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.grey[600],
          title: Text("Quiz App - True or False"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Do you want to play again?",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 30)),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey[400],
                  ),
                  child: Text("Start over"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey[400],
                  ),
                  child: Text("Exit Game"),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              )
            ],
          ),
        ));
  }
}
