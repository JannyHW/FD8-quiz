// need to put it on quiz_brain.dart

class Question {
  // two properties
  String questionText;
  bool questionAnswer;

  //need to create a constructor to give them the values
  // Question(String q, bool a) {
  //   questionText = q;
  //   questionAnswer = a;
  // }
  
  // using synthetic sugar
  Question(this.questionText, this.questionAnswer);
}
