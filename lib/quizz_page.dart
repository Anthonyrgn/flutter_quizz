import 'package:flutter/material.dart';
import 'package:flutterquizz/datas.dart';
import 'package:flutterquizz/question.dart';
import 'package:flutterquizz/text_with_style.dart';


class QuizzPage extends StatefulWidget {
  @override
  State<QuizzPage> createState() => QuizzPageState();

}

class QuizzPageState extends State<QuizzPage> {

  List<Question> questions = Datas().listeQuestions;
  int index = 3;
  int score = 0;

  @override
  Widget build(BuildContext context) {

    final Question question = questions[index];
    return Scaffold(
        appBar: AppBar(
          title: Text("Score: $score"),
        ),
        body: Center(
          child: Card(
            margin: EdgeInsets.all(8),
            child: Padding(
              padding: EdgeInsets.all(8),
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidthStyle(data: "Question numéro ${index + 1} / ${questions.length}", color: Colors.deepOrange, style: FontStyle.italic,),
                  TextWidthStyle(data: question.question, size: 21, weight: FontWeight.bold,),
                  Image.asset(question.getImage()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      answerBtn(false),
                      answerBtn(true),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }

  ElevatedButton answerBtn(bool b){
    // params boolean
    return ElevatedButton(
        onPressed: () {

        },
        child: Text((b) ? "VRAI" : "FAUX"), // Bouton vrai / faux
      style: ElevatedButton.styleFrom(primary: (b) ? Colors.greenAccent : Colors.redAccent), // Si vrai bouton rouge, sinon bouton faux
    );
  }
}