import 'package:flutter/material.dart';
import 'package:quiz_format/answer.dart';
import 'package:quiz_format/common.dart';

import 'quiz_data.dart';

class Question extends StatelessWidget {
  Question({
    Key? key,
    required this.level,
    required this.curNum,
    required this.curScore,
  }) : super(key: key);

  final int level;
  int curNum = 0;
  int curScore = 0;
  late List quizList;
  String quizText = '';
  String choiceTextA = '';
  String choiceTextB = '';
  String choiceTextC = '';
  String choiceTextD = '';
  String answer = '';
  String answerText = '';

  @override
  Widget build(BuildContext context) {
    quizText =
        QuizData.quizList.elementAt(level - 1).elementAt(curNum).elementAt(0);
    choiceTextA =
        QuizData.quizList.elementAt(level - 1).elementAt(curNum).elementAt(1);
    choiceTextB =
        QuizData.quizList.elementAt(level - 1).elementAt(curNum).elementAt(2);
    choiceTextC =
        QuizData.quizList.elementAt(level - 1).elementAt(curNum).elementAt(3);
    choiceTextD =
        QuizData.quizList.elementAt(level - 1).elementAt(curNum).elementAt(4);
    answer =
        QuizData.quizList.elementAt(level - 1).elementAt(curNum).elementAt(5);
    switch (answer) {
      case 'A':
        answerText = choiceTextA;
        break;
      case 'B':
        answerText = choiceTextB;
        break;
      case 'C':
        answerText = choiceTextC;
        break;
      case 'D':
        answerText = choiceTextD;
        break;
    }
    curNum++;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('第 $curNum 問'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromRGBO(255, 250, 205, 1),
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CurScore(curScore: curScore),
                    QuestionBox(quizText: quizText),
                    ChoiceButton(
                      curNum: curNum,
                      curScore: curScore,
                      choice: 'A',
                      choiceText: choiceTextA,
                      answer: answer,
                      answerText: answerText,
                      level: level,
                    ),
                    ChoiceButton(
                      curNum: curNum,
                      curScore: curScore,
                      choice: 'B',
                      choiceText: choiceTextB,
                      answer: answer,
                      answerText: answerText,
                      level: level,
                    ),
                    ChoiceButton(
                      curNum: curNum,
                      curScore: curScore,
                      choice: 'C',
                      choiceText: choiceTextC,
                      answer: answer,
                      answerText: answerText,
                      level: level,
                    ),
                    ChoiceButton(
                      curNum: curNum,
                      curScore: curScore,
                      choice: 'D',
                      choiceText: choiceTextD,
                      answer: answer,
                      answerText: answerText,
                      level: level,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(child: AdButton(message: 'とりあえず\n広告を見る')),
                const Expanded(child: GiveUpButton()),
                Expanded(child: AdButton(message: '広告を見て\nおちつく')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CurScore extends StatelessWidget {
  CurScore({
    Key? key,
    required this.curScore,
  }) : super(key: key);

  int curScore = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      child: Text(
        '現在の得点： $curScore / ${Setting.maxScore}',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.deepOrangeAccent,
          fontSize: 16,
        ),
      ),
    );
  }
}

class QuestionBox extends StatelessWidget {
  QuestionBox({
    Key? key,
    required this.quizText,
  }) : super(key: key);

  String quizText = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 5.0,
        ),
      ),
      child: Text(
        quizText,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ChoiceButton extends StatelessWidget {
  ChoiceButton({
    Key? key,
    required this.curNum,
    required this.curScore,
    required this.choice,
    required this.choiceText,
    required this.answer,
    required this.answerText,
    required this.level,
  }) : super(key: key) {
    switch (choice) {
      case 'A':
        color = Colors.red;
        break;
      case 'B':
        color = Colors.blue;
        break;
      case 'C':
        color = Colors.orange;
        break;
      case 'D':
        color = Colors.green;
        break;
    }
  }

  int curNum = 0;
  int curScore = 0;
  String choice = '';
  String choiceText = '';
  String answer = '';
  String answerText = '';
  int level = 0;
  late Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(top: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 5.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.white),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Answer(
                curNum: curNum,
                curScore: curScore,
                choice: choice,
                answer: answer,
                answerText: answerText,
                level: level,
              ),
            ),
          );
        },
        child: Row(
          children: [
            Text(
              choice,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: color,
              ),
            ),
            const SizedBox(width: 10.0),
            Flexible(
              child: Text(
                choiceText,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
