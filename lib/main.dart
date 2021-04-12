import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

//why?
QuizBrain quizBrain = QuizBrain();
void main() => runApp(Quizzler());

// 1 STATELESS PART
class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
backgroundColor: Colors.grey[300],
        appBar: AppBar(
        title: Text("True 🎯 False"),
        centerTitle: true,
        backgroundColor: Colors.black54,),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

// 2 STATEFUL PART
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}


class _QuizPageState extends State<QuizPage> {

  List<Icon> score = [];

  void checking(bool choosen) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {
      if (quizBrain.isDone() == true) {
        Alert(
          context: context,
          title: 'Done!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        quizBrain.reset();
        score = [];

      } else {
        if (choosen == correctAnswer) {
          score.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          score.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
        Expanded(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: FlatButton(
            textColor: Colors.white,
            color: Colors.green,
            child: Text(
              'True',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            onPressed: () {
              checking(true);
            },
          ),
        ),
        ),
        Expanded(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: FlatButton(
            color: Colors.red,
            child: Text(
              'False',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              checking(false);
            },
          ),
        ),
        ),
        
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(children: score),
        ),
      ],
    );
  }
}
