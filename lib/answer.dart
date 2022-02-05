import 'package:flutter/material.dart';
import 'package:quiz_format/question.dart';
import 'package:quiz_format/result.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common.dart';
import 'quiz_data.dart';

class Answer extends StatelessWidget {
  Answer({
    Key? key,
    required this.curNum,
    required this.curScore,
    required this.choice,
    required this.answer,
    required this.answerText,
    required this.level,
  }) : super(key: key) {
    switch (answer) {
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

    if (choice == answer) {
      message = '正解！！！';
      curScore++;
    } else {
      message = '不正解・・・';
    }
  }

  int curNum = 0;
  int curScore = 0;
  String choice = '';
  String answer = '';
  String answerText = '';
  int level = 0;
  Color color = Colors.black;
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('答えあわせ'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color.fromRGBO(255, 250, 205, 1),
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        message,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                          fontSize: 40,
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text('正解は・・・'),
                      Container(
                        height: 260,
                        width: double.infinity,
                        color: Colors.white,
                        margin: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Column(
                          children: [
                            Text(
                              answer,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 150,
                                color: color,
                                backgroundColor: Colors.white,
                              ),
                            ),
                            Text(
                              answerText,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                                color: color,
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '現在の得点： $curScore / ${Setting.maxScore}',
                        style: const TextStyle(
                          //fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent,
                          fontSize: 25,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 45),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 3.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: (curNum != Setting.maxScore)
                            ? const Text(
                                '画面をTAPして次へ　▶︎▶▶',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : const Text(
                                '画面をTAPして結果発表へ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  const Expanded(child: GiveUpButton()),
                  Expanded(child: NeverGiveUpButton()),
                ],
              ),
            ],
          ),
        ),
        onTap: () async {
          if (curNum != Setting.maxScore) {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Question(
                  curNum: curNum,
                  curScore: curScore,
                  level: level,
                ),
              ),
            );
          } else {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            switch (level) {
              case 1:
                if (curScore >= (prefs.getInt('score1') ?? 0)) {
                  await prefs.setInt('score1', curScore);
                }
                break;
              case 2:
                if (curScore >= (prefs.getInt('score2') ?? 0)) {
                  await prefs.setInt('score2', curScore);
                }
                break;
              case 3:
                if (curScore >= (prefs.getInt('score3') ?? 0)) {
                  await prefs.setInt('score3', curScore);
                }
                break;
              case 4:
                if (curScore >= (prefs.getInt('score4') ?? 0)) {
                  await prefs.setInt('score4', curScore);
                }
                break;
              case 5:
                if (curScore >= (prefs.getInt('score5') ?? 0)) {
                  await prefs.setInt('score5', curScore);
                }
                break;
            }
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Result(
                  curScore: curScore,
                  level: level,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
