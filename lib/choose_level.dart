import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_format/question.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common.dart';
import 'quiz_data.dart';

class ChooseLevel extends StatefulWidget {
  ChooseLevel({Key? key}) : super(key: key) {
    // クイズ配列をシャッフルしてランダム出題
    QuizData.quizList.elementAt(0).shuffle();
    QuizData.quizList.elementAt(1).shuffle();
    QuizData.quizList.elementAt(2).shuffle();
    QuizData.quizList.elementAt(3).shuffle();
    QuizData.quizList.elementAt(4).shuffle();
  }

  @override
  _ChooseLevel createState() => _ChooseLevel();
}

class _ChooseLevel extends State<ChooseLevel> {
  int? score1, score2, score3, score4, score5;
  late SharedPreferences prefs;
  bool lv4UnlockFlg = false;
  bool lv5UnlockFlg = false;
  String messageTitle = '';
  String messageContent = '';

  void getHighScore() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      score1 = prefs.getInt('score1');
      score2 = prefs.getInt('score2');
      score3 = prefs.getInt('score3');
      score4 = prefs.getInt('score4');
      score5 = prefs.getInt('score5');
    });
    //Lv4のロック解除条件:Lv1〜3をそれぞれプレイする
    if (prefs.getBool('lv4UnlockFlg') != true) {
      if (score1 != null && score2 != null && score3 != null) {
        messageTitle += 'パワフルが解放されました！';
        messageContent += 'チャレンジする価値は\n・・・ある！！';
        await prefs.setBool('lv4UnlockFlg', true);
      }
    }
    //Lv5のロック解除条件:Lv4までプレイ済み、かつLv1〜4の最高得点が基準点を超える
    if (prefs.getBool('lv5UnlockFlg') != true) {
      if (score1 != null &&
          score2 != null &&
          score3 != null &&
          score4 != null) {
        if (score1! + score2! + score3! + score4! >= Setting.lv5UnlockScore) {
          messageTitle += 'ヘルが解放されました！';
          messageContent += '理不尽な戦いが今、\n始まる・・・！！！';
          await prefs.setBool('lv5UnlockFlg', true);
        }
      }
    }
    //全レベル満点になった場合に、メッセージを表示する
    if (prefs.getBool('AllClearFlg') != true) {
      if (score1 != null &&
          score2 != null &&
          score3 != null &&
          score4 != null &&
          score5 != null) {
        if (score1! + score2! + score3! + score4! + score5! >=
            Setting.maxAllScore) {
          messageTitle += '全レベルをクリアしました！';
          messageContent += '完全クリアまでプレイしていただき、ありがとうございました！\n'
              'ご指摘、ご要望等ございましたら、レビューに記載いただければ幸いです。\n'
              '\n'
              '高校野球よ、永遠たれ・・・！';
          await prefs.setBool('AllClearFlg', true);
        }
      }
    }
    setState(() {
      if (prefs.getBool('lv4UnlockFlg') != null) {
        lv4UnlockFlg = prefs.getBool('lv4UnlockFlg')!;
      }
      if (prefs.getBool('lv5UnlockFlg') != null) {
        lv5UnlockFlg = prefs.getBool('lv5UnlockFlg')!;
      }
    });

    if ((messageTitle + messageContent) != '') {
      showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          title: Text(messageTitle),
          content: Text(messageContent),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              isDestructiveAction: true,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    getHighScore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('レベル選択'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromRGBO(255, 250, 205, 1),
        padding: const EdgeInsets.all(15),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('挑戦するレベルを選択してください。'),
            Stack(
              children: [
                LevelButton(level: 1),
                Positioned(
                  child: Stamp(score: score1, level: 1),
                  left: 0,
                  bottom: 0,
                ),
                Positioned(
                  child: HighScore(score: score1, level: 1),
                  right: 0,
                  bottom: 0,
                ),
              ],
            ),
            Stack(
              children: [
                LevelButton(level: 2),
                Positioned(
                  child: Stamp(score: score2, level: 2),
                  left: 0,
                  bottom: 0,
                ),
                Positioned(
                  child: HighScore(score: score2, level: 2),
                  right: 0,
                  bottom: 0,
                ),
              ],
            ),
            Stack(
              children: [
                LevelButton(level: 3),
                Positioned(
                  child: Stamp(score: score3, level: 3),
                  left: 0,
                  bottom: 0,
                ),
                Positioned(
                  child: HighScore(score: score3, level: 3),
                  right: 0,
                  bottom: 0,
                ),
              ],
            ),
            Stack(
              children: [
                LevelButton(level: 4, lv4UnlockFlg: lv4UnlockFlg),
                Positioned(
                  child: Stamp(
                      score: score4, level: 4, lv4UnlockFlg: lv4UnlockFlg),
                  left: 0,
                  bottom: 0,
                ),
                Positioned(
                  child: HighScore(score: score4, level: 4),
                  right: 0,
                  bottom: 0,
                ),
              ],
            ),
            Stack(
              children: [
                LevelButton(level: 5, lv5UnlockFlg: lv5UnlockFlg),
                Positioned(
                  child: Stamp(score: score5, level: 5),
                  left: 0,
                  bottom: 0,
                ),
                Positioned(
                  child: HighScore(score: score5, level: 5),
                  right: 0,
                  bottom: 0,
                ),
              ],
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(child: AdButton(message: 'とりあえず\n広告を見る')),
                    Expanded(child: AdButton(message: '何も考えず\n広告を見る')),
                    Expanded(child: AdButton(message: '広告を見て\nおちつく')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Stamp extends StatelessWidget {
  Stamp(
      {Key? key,
      required this.score,
      required this.level,
      this.lv4UnlockFlg = false})
      : super(key: key) {
    if (score == null) {
      letter = '';
    } else if (score! == 0) {
      letter = 'う';
    } else if (score! < (Setting.maxScore / 3)) {
      letter = 'ひ';
    } else if (score! < (Setting.maxScore * (2 / 3))) {
      letter = '普';
    } else if (score! < Setting.maxScore) {
      letter = 'マ';
    } else if (score! == Setting.maxScore) {
      letter = '免';
    }
  }

  int level = 0; //1,2,3
  String letter = '';
  int? score;
  bool lv4UnlockFlg = false;

  @override
  Widget build(BuildContext context) {
    // scoreがnull以外の場合は、最高得点に応じたスタンプを返す
    // level4かつlv4UnlockFlgがfalseの場合、lockアイコンを返す
    // scoreがnullの場合は、空のContainerを返す
    if (score != null) {
      return Container(
        height: 50,
        width: 50,
        margin: const EdgeInsets.only(bottom: 15, left: 15),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.red, width: 3.0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          letter,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 30,
          ),
        ),
      );
    } else if (level == 4 && lv4UnlockFlg == false) {
      return Container(
        height: 50,
        width: 50,
        margin: const EdgeInsets.only(bottom: 15, left: 15),
        alignment: Alignment.topCenter,
        child: const Icon(Icons.lock, color: Colors.grey, size: 50),
      );
    } else {
      return Container();
    }
  }
}

class HighScore extends StatelessWidget {
  HighScore({Key? key, required this.score, required this.level})
      : super(key: key) {
    if (level == 5) {
      questionNum = Setting.lv5QuestionNum;
      message1 = '(各2点)';
      color = Colors.white;
    } else {
      questionNum = Setting.baseQuestionNum;
    }
    if (score != null) {
      message2 = '$score点';
    } else {
      message2 = '-';
    }
  }

  int level = 0;
  int? score;
  int questionNum = 0;
  String message1 = '';
  String message2 = '';
  Color color = Colors.grey;

  @override
  Widget build(BuildContext context) {
    // scoreがnullの場合は、空のContainerを返す
    return Text(
      '全${QuizData.quizList.elementAt(level - 1).length}問\n'
      '出題$questionNum問$message1\n'
      '最高得点\n'
      '$message2',
      textAlign: TextAlign.right,
      style: TextStyle(color: color, fontSize: 13),
    );
  }
}

class LevelButton extends StatelessWidget {
  LevelButton(
      {Key? key,
      required this.level,
      this.lv4UnlockFlg = false,
      this.lv5UnlockFlg = false})
      : super(key: key) {
    switch (level) {
      case 1:
        strLevel = 'よわい';
        break;
      case 2:
        strLevel = 'ふつう';
        break;
      case 3:
        strLevel = 'つよい';
        break;
      case 4:
        strLevel = 'パワフル';
        break;
      case 5:
        strLevel = 'ヘル';
        break;
    }
  }

  int level = 0; //1,2,3
  String strLevel = '';
  bool lv4UnlockFlg = false;
  bool lv5UnlockFlg = false;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      // Lv5Unlockフラグがfalseの時、レベル5を非表示
      visible: (level == 5 && lv5UnlockFlg == false) ? false : true,
      child: Container(
        height: 80,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 15),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: (level == 5) ? Colors.red : Colors.white,
            onPrimary: (level == 5) ? Colors.white : Colors.black,
          ),
          // Lv4Unlockフラグがfalseの時、ボタンを非活性化
          onPressed: (level == 4 && lv4UnlockFlg == false)
              ? null
              : () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Question(
                        curNum: 0,
                        curScore: 0,
                        level: level,
                      ),
                    ),
                  );
                },
          child: Text(
            strLevel,
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
