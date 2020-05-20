import 'questions.dart';
import 'package:rich_alert/rich_alert.dart';

class Quizbrain {

  int _qno = 0;
  int _flag = 1;

  List<Questions> _qna = [
    Questions(q:'In Python, you can define a variable without specifying its data type?',a: true ),
    Questions(q:'The print function is used to receive data from keyboard in a  program.',a: false ),
    Questions(q:'The input function can be used to read a value from keyword. However, by using this statement you need to supply the value in single quotes.',a: true ),
    Questions(q:'In Python, a string can be formatted using %s?',a: true ),
    Questions(q:'A list can have different types of values.',a: true ),
    Questions(q:'In Python, to access an element of the list, you need to specify its index number. The first element has 1 index number.',a: false ),
    Questions(q:'To access the elements of the list in forward direction, you can specify either positive or negative index numbers',a: false ),
    Questions(q:'In Python, a tuple is a sequence of values that can\'t be changed after it is defined.',a: true ),
    Questions(q:'Python treats a string as special kind of tuple.',a: true ),
    Questions(q:'The continue command is used to exit a loop.',a: false ),
  ];

  void nextQues(){
    if (_qno<_qna.length-1){
      _qno++;
    }
    if(_qno==_qna.length-1){
      _flag=0;
    }
  }

  void reset(){
    _flag=1;
    _qno=0;
  }

  int getFlag(){
    return _flag;
  }
  String getQues(){
    return _qna[_qno].question;
  }
  bool getans(){
    return _qna[_qno].ans;
  }
}