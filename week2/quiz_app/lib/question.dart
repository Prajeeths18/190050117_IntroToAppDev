class Question {
  late String question;
  late bool answer;

  Question({required this.question, required this.answer});

  bool evaluate(bool answer) {
    return this.answer == answer;
  }
}
