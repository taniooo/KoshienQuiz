import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'choose_level.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ], // 漢字を日本語フォントで表示
      supportedLocales: const [
        Locale('ja', 'JP'),
      ], // 漢字を日本語フォントで表示
      home: const MyHomePage(title: '甲子園クイズ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: const Color.fromRGBO(255, 250, 205, 1),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.lightBlue[300],
                ),
              ),
              const Image(image: AssetImage('images/koshien.jpg')),
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.lightGreen[400],
                  alignment: Alignment.topCenter,
                  child: const Text(
                    'TAP SCREEN',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ), // ],
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChooseLevel(),
              ),
            );
          },
        ),
      ),
    );
  }
}
