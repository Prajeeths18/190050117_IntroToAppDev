import 'package:flutter/material.dart';

class EvaluateQuiz extends StatefulWidget {
  const EvaluateQuiz({
    Key? key,
    required this.isCorrect,
  }) : super(key: key);

  final List<int> isCorrect;

  @override
  _EvaluateQuizState createState() => _EvaluateQuizState();
}

class _EvaluateQuizState extends State<EvaluateQuiz> {
  @override
  Widget build(BuildContext context) {
    print("I am called...");
    return Row(
      children: widget.isCorrect.map((e) {
        print(e);
        if (e == 1) {
          return Expanded(
              child: Icon(
            Icons.check,
            color: Colors.green,
            size: 35,
          ));
        } else if (e == 0) {
          return Expanded(
            child: Icon(
              Icons.close,
              color: Colors.red,
              size: 35,
            ),
          );
        } else {
          return Expanded(child: Container());
        }
      }).toList(),
    );
  }
}
