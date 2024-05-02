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
          // アプリのテーマカラーを決める。変更するとアニメーションで色が変化する。
          // UI を状態から状態へジャンプさせるのではなく、値と値の間を滑らかに補間します。
          // カードの下の浮き上がりボタンの色も変化しています。これが、値をハードコードするのではなく、アプリ全体が対象の Theme を使用するメリットです。
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
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
    // アプリの現在のテーマをリクエスト
    // MyApp までスクロールし、そこで ColorScheme のシード色を変更すると、この色とアプリ全体のカラーパターンを変更できます。
    final theme = Theme.of(context);       // ← Add this.

    return Card(
      // カードの色をテーマの colorScheme プロパティと同じになるよう定義しています。カラーパターンには多数の色が含まれていますが、primary がこのアプリの最も目立つ特徴的な色です。
      color: theme.colorScheme.primary,    // ← And also this.
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(pair.asLowerCase),
      ),
    );
  }
}