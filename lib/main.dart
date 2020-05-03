import 'package:flutter/material.dart';
import 'Questionbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Questionbrain questionbrain = Questionbrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Quizpage(),
          ),
        ),
      ),
    );
  }
}

class Quizpage extends StatefulWidget {
  @override
  _QuizpageState createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  List<Icon> scoreKeeper = [];

  void checkanswer(bool userpickedanswer) {
    bool correctanswer = questionbrain.getQuestionAnswer();
    setState(() {
      if (correctanswer == userpickedanswer) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }

      bool value = questionbrain.nextquestion();
      if (value == true) {
        checkdialog();
        questionbrain.reset();
      scoreKeeper=[];
      }
      
    });
  }

  void checkdialog() {
    Alert(
        context: context,
        title: "Quiz Completed Sucessfully",
        desc: "You have reached at end of the quiz",
        ).show();

        questionbrain.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Center(
            child: Text(
              questionbrain.getQuestionText(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: FlatButton(
              color: Colors.green,
              onPressed: () {
                checkanswer(true);
              },
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: FlatButton(
              color: Colors.red,
              onPressed: () {
                checkanswer(false);
              },
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
