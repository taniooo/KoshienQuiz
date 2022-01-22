import 'dart:async';

import 'package:flutter/material.dart';

import 'choose_level.dart';
import 'common.dart';
import 'quiz_data.dart';

class Result extends StatefulWidget {
  Result({
    Key? key,
    required this.curScore,
    required this.level,
  }) : super(key: key) {
    strLevel = LvConv(level);

    if (curScore == 0) {
      message = 'うんこ';
    } else if (curScore < (Setting.maxScore / 3)) {
      message = '甲子園のひよっこ';
    } else if (curScore < (Setting.maxScore * (2 / 3))) {
      message = '普通に甲子園が好き';
    } else if (curScore < Setting.maxScore) {
      message = '立派な甲子園マニア';
    } else if (curScore == Setting.maxScore) {
      message = '甲子園クイズ免許皆伝';
    }
  }

  int curScore = 0;
  int level = 0;
  String strLevel = '';
  Color color = Colors.black;
  String message = '';

  @override
  _Result createState() => _Result();
}

class _Result extends State<Result> {
  //listの要素数を変更した場合、initState中のTimer関数も修正する
  List<bool> isVisibleList = List.generate(7, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('結果発表'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromRGBO(255, 250, 205, 1),
        padding: const EdgeInsets.fromLTRB(15, 50, 15, 15),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      '最終結果',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'レベル: ',
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: widget.strLevel,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 20,
                            ),
                          ),
                          const TextSpan(text: ' において、')
                        ],
                      ),
                    ),
                    const Text('あなたは下記の通りの成績を修められました。'),
                    const Text('${Setting.maxScore}点満点中・・・'),
                    const SizedBox(height: 30),
                    Visibility(
                      visible: isVisibleList.elementAt(0),
                      child: Text(
                        '${widget.curScore}点！',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isVisibleList.elementAt(1),
                      child: Column(
                        children: const [
                          SizedBox(height: 30),
                          Text('あなたは'),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: isVisibleList.elementAt(2),
                      child: const Text('・'),
                    ),
                    Visibility(
                      visible: isVisibleList.elementAt(3),
                      child: const Text('・'),
                    ),
                    Visibility(
                      visible: isVisibleList.elementAt(4),
                      child: const Text('・'),
                    ),
                    Visibility(
                      visible: isVisibleList.elementAt(5),
                      child: Column(
                        children: [
                          Text(
                            widget.message,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrangeAccent,
                              fontSize: 30,
                            ),
                          ),
                          const Text('です！！！'),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: isVisibleList.elementAt(6),
                      child: Column(
                        children: [
                          const SizedBox(height: 45),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return ChooseLevel();
                                  },
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    const double begin = 0.0;
                                    const double end = 1.0;
                                    final Animatable<double> tween =
                                        Tween(begin: begin, end: end).chain(
                                            CurveTween(
                                                curve: Curves.easeInOut));
                                    final Animation<double> doubleAnimation =
                                        animation.drive(tween);
                                    return FadeTransition(
                                      opacity: doubleAnimation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                            child: const Text(
                              'レベル選択画面に戻る',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(child: AdButton(message: 'とりあえず\n広告を見る')),
                Expanded(child: AdButton(message: '何も考えず\n広告を見る')),
                Expanded(child: AdButton(message: '広告を見て\nおちつく')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      setState(() {
        isVisibleList[0] = true;
      });
    });
    Timer(const Duration(seconds: 6), () {
      setState(() {
        isVisibleList[1] = true;
      });
    });
    Timer(const Duration(seconds: 7), () {
      setState(() {
        isVisibleList[2] = true;
      });
    });
    Timer(const Duration(seconds: 8), () {
      setState(() {
        isVisibleList[3] = true;
      });
    });
    Timer(const Duration(seconds: 9), () {
      setState(() {
        isVisibleList[4] = true;
      });
    });
    Timer(const Duration(seconds: 12), () {
      setState(() {
        isVisibleList[5] = true;
      });
    });
    Timer(const Duration(seconds: 14), () {
      setState(() {
        isVisibleList[6] = true;
      });
    });
  }
}
