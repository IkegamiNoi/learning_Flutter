import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

/// MyAppStateはアプリの状態変化について記述を行っている。
/// ChangeNotifierによって変更を通知できる。
class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  /// getNextはWordPair.random()して、notifyListeners()
  /// はChangeNotifierのメソッドであり、これによって変更を通知出来る。
  // ↓ Add this.
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;                 // ← Add this.

    return Scaffold(
      body: Column(
        children: [
          Text('A random AWESOME idea:'),
          BigCard(pair: pair),                // ← Change to this.
          
          // ↓ Add this.
          ElevatedButton(
            onPressed: () {
              //print('button pressed!');
              /// MyAppStateをappStateで宣言しているのでgetNext()を呼べている。
              /// これによってボタンを押すたびにワードが変更される。
              appState.getNext();  // ← This instead of print().
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    return Text(pair.asLowerCase);
  }
}