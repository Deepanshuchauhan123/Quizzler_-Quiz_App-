import 'package:flutter/material.dart';
import 'Questionbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Questionbrain questionbrain = Questionbrain();
void main() => runApp(Quizzler());
int marks = 0, total = 0;

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Quizzler App"),
        ),
        backgroundColor: Colors.blue[50],
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
        marks++;
        total++;
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        total++;
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
        scoreKeeper = [];
        total = 0;
        marks = 0;
      }
    });
  }

  void checkdialog() {
    Alert(
      context: context,
      title: "Your Marks = $marks/$total",
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white,
              child: Center(
                child: Text(
                  questionbrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
                side: BorderSide(color: Colors.black),
              ),
              color: Colors.lightBlue,
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                  side: BorderSide(color: Colors.black)),
              color: Colors.orange,
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
