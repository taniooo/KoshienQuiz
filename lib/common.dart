import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_format/choose_level.dart';
import 'package:url_launcher/url_launcher.dart';

String LvConv(int level) {
  String strLevel = '';

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

  return strLevel;
}

class Menu extends Drawer {
  Menu({Key? key}) : super(key: key);

  Future _launchURL() async {
    const url = "https://taniooopage.web.app/policy1.html";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not Launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: const Text(
              'MENU',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            title: const Text('プライバシーポリシー・利用規約'),
            tileColor: const Color.fromRGBO(255, 250, 205, 1),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => CupertinoAlertDialog(
                  content: const Text('Webページに移動します。'),
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
                      onPressed: () {
                        Navigator.of(context).pop();
                        _launchURL();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text('スペシャルサンクス'),
            tileColor: const Color.fromRGBO(255, 250, 205, 1),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => CupertinoAlertDialog(
                  content: const Text(
                    '製作協力\n'
                    '\n'
                    '友人 H (高校野球検定中級漢)\n'
                    '友人 K (智弁和歌山大好き漢)\n'
                    '\n'
                    '\n'
                    'アプリをダウンロードしてくれた皆様\n'
                    '\n'
                    'このアプリを手にとっていただいき、ありがとうございます。'
                    '「甲子園クイズ」は私の初製作のアプリになります。'
                    '至らない点もあろうかと存じますが、どうかご容赦いただき、'
                    '是非とも最後までプレイしてみてください。',
                  ),
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
            },
          ),
        ],
      ),
    );
  }
}

class GiveUpButton extends StatelessWidget {
  const GiveUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.amber,
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => CupertinoAlertDialog(
            content: const Text('レベル選択画面に戻りますか？(ポイントは戻りません)'),
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
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChooseLevel(),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
      child: const Text(
        'あきらめる',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.brown,
        ),
      ),
    );
  }
}

class NeverGiveUpButton extends StatelessWidget {
  NeverGiveUpButton({Key? key}) : super(key: key);

  List<String> message = [
    'がんばって！',
    'あきらめないで！',
    'やればできる！',
    '負けないで！',
    'ググったらいける',
    '君の力はそんなものじゃないはずだ！',
    '君はまだ飛べる！',
    '何度負けても、諦めない限り終わりじゃない。何度勝っても、一度諦めたら終わりだって、コブクロが言ってた。',
    'ネバーギブアップ！',
    '気持ちで負けたら終わりだ！',
  ];

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: () {
        message.shuffle();
        showDialog(
          context: context,
          builder: (_) => CupertinoAlertDialog(
            content: Text(message[0]),
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
      },
      child: const Text(
        'はげまされる',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}
