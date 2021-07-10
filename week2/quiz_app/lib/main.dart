import 'package:flutter/material.dart';
import "question.dart";
import "quiz.dart";

void main() {
  runApp(MaterialApp(home: QuizApp()));
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  Widget evaluateQuiz(List<int> isCorrect) {
    return Row(
      children: isCorrect.map((e) {
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

  List<Question> questions = [
    Question(
        question: "Blue eyes are newer to the human race than pottery",
        answer: true),
    Question(
        question: "50 Cent and Charlie Chaplin were alive at the same time",
        answer: true),
    Question(question: "Trees existed before sharks", answer: false),
    Question(question: "Michigan is larger than Great Britain", answer: true),
    Question(
        question: "Cumulus clouds weigh anywhere from 15 to 30 pounds",
        answer: false),
    Question(question: "There are 14 bones in a human foot", answer: false),
    Question(question: "Matches were invented before lighters", answer: false),
    Question(
        question:
            "The population of California is larger than the entire population of Canada.",
        answer: true),
    Question(
        question: "The world's population tripled in the last 50 years.",
        answer: false),
    Question(
        question: "Two 12-inch pizzas have more pizza than a 17-inch pizza.",
        answer: false)
  ];
  late Quiz quiz;
  int totalQuestions = 0;
  late List<int> isCorrect;
  late Widget quizEvalutation;
  void initState() {
    totalQuestions = questions.length;
    isCorrect = List.filled(totalQuestions, -1);
    quizEvalutation = evaluateQuiz(isCorrect);
    quiz = Quiz(questions: questions);
    super.initState();
  }

  int questionNo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.grey[600],
          title: Text("Quiz App - True or False"),
        ),
        body: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      child: Text("${quiz.questions[questionNo].question}",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 30.0, color: Colors.white)),
                    ),
                  )),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  child: Text("True"),
                  onPressed: () {
                    setState(() {
                      bool correct = quiz.questions[questionNo].evaluate(true);
                      if (correct) {
                        isCorrect[questionNo] = 1;
                      } else {
                        isCorrect[questionNo] = 0;
                      }
                      if (questionNo == totalQuestions - 1) {
                        isCorrect.fillRange(0, totalQuestions, -1);
                      }
                      quizEvalutation = evaluateQuiz(isCorrect);
                      if (questionNo < totalQuestions - 1) {
                        questionNo++;
                      } else {
                        questionNo = 0;
                      }
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: Text("False"),
                  onPressed: () {
                    setState(() {
                      bool correct = quiz.questions[questionNo].evaluate(false);
                      if (correct) {
                        isCorrect[questionNo] = 1;
                      } else {
                        isCorrect[questionNo] = 0;
                      }
                      if (questionNo == totalQuestions - 1) {
                        isCorrect.fillRange(0, totalQuestions, -1);
                      }
                      quizEvalutation = evaluateQuiz(isCorrect);
                      if (questionNo < totalQuestions - 1) {
                        questionNo++;
                      } else {
                        questionNo = 0;
                        isCorrect.fillRange(0, totalQuestions, -1);
                      }
                    });
                  },
                ),
              ),
              Expanded(flex: 1, child: quizEvalutation)
            ],
          ),
        ));
  }
}
