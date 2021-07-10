import 'package:flutter/material.dart';
import 'finish.dart';
import "start_quiz.dart";
import "question.dart";
import "quiz.dart";
import "evaluate_quiz.dart";
// import 'package:http/http.dart' as http;
// import 'package:opentdb_client/opentdb_client.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/start",
    routes: {
      "/": (context) => QuizApp(),
      "/start": (context) => startQuiz(),
      "/finish": (context) => FinishedQuiz()
    },
  ));
}

int min(int a, int b) {
  return (a <= b ? a : b);
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Question> questions = [
    Question(
        question: "Hot and cold water sound the same when you pour them.",
        answer: false),
    Question(
        question: "More people are killed each year by cows than by sharks.",
        answer: true),
    Question(
        question: "An endangered species is at risk of extinction.",
        answer: true),
    Question(question: "Crude oil is a fossil fuel.", answer: true),
    Question(question: "The ocean sometimes stands still.", answer: false),
    Question(question: "All matter has mass and density.", answer: true),
    Question(question: "Skin serves no real purpose.", answer: false),
    Question(
        question: "All chemical reactions can be reversed.", answer: false),
    Question(
        question: "When horses run, all four feet leave the ground.",
        answer: true),
    Question(
        question: "Most human babies are born exactly on their due dates.",
        answer: false)
  ];
  late Quiz quiz;
  int totalQuestions = 0;
  late List<int> isCorrect;
  late Widget quizEvalutation;
  void initState() {
    print("initState");
    totalQuestions = questions.length;
    isCorrect = List.filled(totalQuestions, -1);
    quizEvalutation = EvaluateQuiz(isCorrect: isCorrect);
    quiz = Quiz(questions: questions);
    super.initState();
  }

  int questionNo = 0;

  void evaluateQuestion(bool value) {
    print("Clicked $value...");
    setState(() {
      print("inside setstate");
      if (questionNo < totalQuestions) {
        print(questionNo);
        isCorrect[questionNo] =
            quiz.questions[questionNo].evaluate(value) ? 1 : 0;
      }
      questionNo++;
    });
    if (questionNo == totalQuestions) {
      print("comes here");
      Navigator.pushNamed(context, "/finish").then((_) {
        setState(() {
          print("called here");
          questionNo = 0;
          isCorrect.fillRange(0, totalQuestions, -1);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Main page buiding again");
    print(isCorrect);
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
                      child: Text(
                          "${questionNo + 1}\n\n${quiz.questions[min(questionNo, totalQuestions - 1)].question}",
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
                  onPressed: () => evaluateQuestion(true),
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
                  onPressed: () => evaluateQuestion(false),
                ),
              ),
              Expanded(flex: 1, child: EvaluateQuiz(isCorrect: isCorrect))
            ],
          ),
        ));
  }
}
