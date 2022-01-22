import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_format/choose_level.dart';

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

class AdButton extends StatelessWidget {
  AdButton({Key? key, required this.message}) : super(key: key);

  String message = '';

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: () async {
        // await Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => GO TO AD(),
        //   ),
        // );
        null;
      },
      child: Text(
        message,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.white,
        ),
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
            content: const Text('レベル選択画面に戻りますか？'),
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
                isDestructiveAction: true,
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
