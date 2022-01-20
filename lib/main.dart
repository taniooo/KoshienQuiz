import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          // child: Column(children: [
          //   Expanded(
          //     child: Container(
          //       color: Colors.lightBlue[300],
          //     ),
          //   ),
          child: Center(
            child: Expanded(
              // FittedBox(
              // fit: BoxFit.fitWidth,
              child: Image.asset('images/koshien.png'),
              // child: Image.asset('images/PNG_transparency_demonstration_1.png'),
            ),
          ),
          //   Expanded(
          //     child: Container(
          //       color: Colors.lightGreen[400],
          //     ),
          //   ),
          // ],
          // ),
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
