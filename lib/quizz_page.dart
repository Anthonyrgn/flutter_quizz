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
  int index = 0;
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
          checkAnswer(b);
        },
        child: Text((b) ? "VRAI" : "FAUX"), // Bouton vrai / faux
      style: ElevatedButton.styleFrom(primary: (b) ? Colors.greenAccent : Colors.redAccent), // Si vrai bouton rouge, sinon bouton faux
    );
  }

  checkAnswer(bool answer){

    final question = questions[index];
    bool bonneReponse = (question.response == answer);

    if (bonneReponse){
      setState(() {
        score++;
      });
    }
    showAnswer(bonneReponse);
  }

  Future<void> showAnswer(bool bonneReponse) async {

    Question question = questions[index];
    String title = (bonneReponse) ? "C'est gagné" : "C'est perdu";
    String imageToShow = (bonneReponse) ? "vrai.jpg" : "cover.jpg";
    String path = "images/$imageToShow";
    return showDialog(
      barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: TextWidthStyle(
              data: title,
            ),
            children: [
              Image.asset(path),
              TextWidthStyle(data: question.explication),
              TextButton(onPressed: (){
                Navigator.of(context).pop();
                toNextQuestion();
              }, child: TextWidthStyle(data: "Passer à la question suivante",))
            ],
          );
        });
  }

  void toNextQuestion(){
    index++;
    setState(() {

    });
  }

}