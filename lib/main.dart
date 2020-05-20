import 'package:flutter/material.dart';
import 'quizbrain.dart';
import 'package:rich_alert/rich_alert.dart';

Quizbrain quizbrain = Quizbrain();

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
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizbrain.getQues(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
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
                setState(() {
                  if (quizbrain.getans() == true){
                    scoreKeeper.add(Icon(Icons.check,color: Colors.green,));
                  }
                  else{
                    scoreKeeper.add(Icon(Icons.close,color: Colors.red,));
                  }
                  quizbrain.nextQues();
                  if (quizbrain.getFlag()==0){
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return RichAlertDialog( //uses the custom alert dialog
                            alertTitle: richTitle("Quiz Completed"),
                            alertSubtitle: richSubtitle("Play Again!!!"),
                            alertType: RichAlertType.SUCCESS,
                          );
                        }
                    );
                    scoreKeeper = [];
                    quizbrain.reset();
                  }
                });
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
                setState(() {
                  if (quizbrain.getans() == false){
                    scoreKeeper.add(Icon(Icons.check,color: Colors.green,));
                  }
                  else{
                    scoreKeeper.add(Icon(Icons.close,color: Colors.red,));
                  }
                  quizbrain.nextQues();
                  if (quizbrain.getFlag()==0){
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return RichAlertDialog( //uses the custom alert dialog
                            alertTitle: richTitle("Quiz Completed"),
                            alertSubtitle: richSubtitle("Play Again!!!"),
                            alertType: RichAlertType.SUCCESS,
                          );
                        }
                    );
                    scoreKeeper = [];
                    quizbrain.reset();
                  }
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}