import 'package:flutter/material.dart';
import 'package:flutterquizz/datas.dart';
import 'package:flutterquizz/question.dart';


class QuizzPage extends StatefulWidget {
  @override
  State<QuizzPage> createState() => QuizzPageState();

}

class QuizzPageState extends State<QuizzPage> {

 List<Question> questions = Datas().listeQuestions;

 @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(),
        body: Center(),
    );
  }
}