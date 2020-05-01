import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  List<String> Questions = [
    'Color of Deepanshu\'s phone is black?',
    'Color of Deepanshu\'s laptop is black?',
    'Color of Deepanshu\'s specks is blue?',
  ];
  List<bool> answers=[
    true,
    false,
    true,
  ];
  int questionnumber = 0;
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
              Questions[questionnumber],
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
                bool correctanswer= answers[questionnumber];
                if(correctanswer==true)
                {
                    scoreKeeper.add(
                     Icon(Icons.check,
                     color: Colors.green,), 
                    );
                }else{
                  scoreKeeper.add(
                     Icon(Icons.close,
                     color: Colors.red,), 
                    );
                }
                setState(() {
                  questionnumber++;
                });
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
                 bool correctanswer= answers[questionnumber];
                if(correctanswer==false)
                {
                    scoreKeeper.add(
                     Icon(Icons.check,
                     color: Colors.green,), 
                    );
                }else{
                  scoreKeeper.add(
                     Icon(Icons.close,
                     color: Colors.red,), 
                    );
                }
                setState(() {
                  questionnumber++;
                });
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
