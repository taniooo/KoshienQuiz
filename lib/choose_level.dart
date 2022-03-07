import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
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
  RewardedAd? _rewardedAd;
  int point = 0;

  void getLocalData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      score1 = prefs.getInt('score1');
      score2 = prefs.getInt('score2');
      score3 = prefs.getInt('score3');
      score4 = prefs.getInt('score4');
      score5 = prefs.getInt('score5');
    });
    //Lv4のロック解除条件:Lv1〜3の最高得点が基準点を超える
    if (prefs.getBool('lv4UnlockFlg') != true) {
      if (score1 != null && score2 != null && score3 != null) {
        if (score1! + score2! + score3! >= Setting.lv4UnlockScore) {
          messageTitle += 'パワフルが解放されました！';
          messageContent += 'チャレンジする価値は\n・・・ある！！';
          await prefs.setBool('lv4UnlockFlg', true);
        }
      }
    }
    //Lv5のロック解除条件:Lv4の最高得点が基準点を超える
    if (prefs.getBool('lv5UnlockFlg') != true) {
      if (score4 != null) {
        if (score4! >= Setting.lv5UnlockScore) {
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

    // ポイント取得、初期値
    if (prefs.getInt('point') == null) {
      await prefs.setInt('point', Setting.initPoint);
    }
    setState(() {
      point = prefs.getInt('point')!;
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

  String getTestAdBannerUnitId() {
    String testBannerUnitId = "";
    if (Platform.isAndroid) {
      // Android のとき
      testBannerUnitId =
          // "ca-app-pub-3940256099942544/5224354917"; // Androidのデモ用バナー広告ID
          "ca-app-pub-3696030711426340/6066683507"; //リリース用 デバッグ時は必ずコメントアウトする。
    } else if (Platform.isIOS) {
      // iOSのとき
      testBannerUnitId =
          // "ca-app-pub-3940256099942544/1712485313"; // iOSのデモ用バナー広告ID
          "ca-app-pub-3696030711426340/4341704144"; //リリース用 デバッグ時は必ずコメントアウトする。
    }
    return testBannerUnitId;
  }

  void _createRewardedAd() {
    RewardedAd.load(
      adUnitId: getTestAdBannerUnitId(),
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          print('$ad loaded');
          _rewardedAd = ad;
          _rewardedAd!.setImmersiveMode(true);
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error.');
        },
      ),
    );
  }

  void _showRewardedAd() {
    if (_rewardedAd == null) {
      showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          content: const Text('広告をロード中です。数秒待ってから再度ボタンを押してください。'),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              isDefaultAction: true,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createRewardedAd();
      },
    );
    _rewardedAd!.show(
        onUserEarnedReward: (RewardedAd ad, RewardItem reward) async {
      print('point earn start point:$point');
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      point = prefs.getInt('point')!;
      setState(() {
        prefs.setInt('point', ++point);
      });
      print('point earn end point:$point');
      _rewardedAd = null;
      showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          content: const Text('ポイントゲット!'),
          actions: [
            CupertinoDialogAction(
              child: const Text('Close'),
              isDefaultAction: true,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    });
  }

  @override
  void initState() {
    getLocalData();
    _createRewardedAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('レベル選択'),
      ),
      drawer: Menu(),
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
                    const Text('挑戦するレベルを選択してください。\n1ポイントで挑戦できます。'),
                    Stack(
                      children: [
                        LevelButton(level: 1, point: point),
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
                        LevelButton(level: 2, point: point),
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
                        LevelButton(level: 3, point: point),
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
                        LevelButton(
                            level: 4, point: point, lv4UnlockFlg: lv4UnlockFlg),
                        Positioned(
                          child: Stamp(
                              score: score4,
                              level: 4,
                              lv4UnlockFlg: lv4UnlockFlg),
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
                        LevelButton(
                            level: 5, point: point, lv5UnlockFlg: lv5UnlockFlg),
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
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () async {
                      _showRewardedAd();
                    },
                    child: const Text(
                      '広告をみて\nポイントをふやす',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        '$point ポイント',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
      color = Colors.white;
    }
    if (score != null) {
      strScore = '$score点';
    } else {
      strScore = '-';
    }
  }

  int level = 0;
  int? score;
  int questionNum = 0;
  String strScore = '';
  Color color = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Text(
      '全${QuizData.quizList.elementAt(level - 1).length}問\n'
      '出題${Setting.maxScore}問\n'
      '最高得点\n'
      '$strScore',
      textAlign: TextAlign.right,
      style: TextStyle(color: color, fontSize: 13),
    );
  }
}

class LevelButton extends StatelessWidget {
  LevelButton(
      {Key? key,
      required this.level,
      required this.point,
      this.lv4UnlockFlg = false,
      this.lv5UnlockFlg = false})
      : super(key: key) {
    strLevel = LvConv(level);
  }

  int level = 0; //1,2,3
  int point = 0;
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
              : () {
                  if (point < 1) {
                    showDialog(
                      context: context,
                      builder: (_) => CupertinoAlertDialog(
                        content: const Text('ポイントがありません・・・'),
                        actions: [
                          CupertinoDialogAction(
                            child: const Text('Close'),
                            isDefaultAction: true,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (_) => CupertinoAlertDialog(
                        content: Text('1ポイント消費して、レベル：$strLevelに挑戦します。'),
                        actions: [
                          CupertinoDialogAction(
                            child: const Text('Cancel'),
                            isDestructiveAction: true,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          CupertinoDialogAction(
                            child: const Text('OK'),
                            isDefaultAction: true,
                            onPressed: () async {
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setInt('point', --point);
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
                          ),
                        ],
                      ),
                    );
                  }
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
