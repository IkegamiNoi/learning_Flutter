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
          /// アプリのテーマカラーを決める。変更するとアニメーションで色が変化する。
          /// UI を状態から状態へジャンプさせるのではなく、値と値の間を滑らかに補間します。
          /// カードの下の浮き上がりボタンの色も変化しています。これが、値をハードコードするのではなく、アプリ全体が対象の Theme を使用するメリットです。
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
    /// アプリの現在のテーマをリクエスト
    /// MyApp までスクロールし、そこで ColorScheme のシード色を変更すると、この色とアプリ全体のカラーパターンを変更できます。
    final theme = Theme.of(context);       // ← Add this.
    // ↓ Add this.
    /// theme.textTheme, を使用して、アプリのフォントテーマにアクセスします。このクラスには、bodyMedium（中サイズの標準テキスト用）、caption（画像のキャプション用）、headlineLarge（大きな見出し用）などのメンバーがあります。
    /// displayMedium プロパティは、ディスプレイ テキスト用の大きなスタイルです。ここで「ディスプレイ」という単語は、ディスプレイ書体（見出し書体）などのタイポグラフィでの意味で使用されています。displayMedium のドキュメントには「ディスプレイ スタイルは短く、重要なテキストにのみ使用します」と書かれており、まさに我々のユースケースです。
    /// displayMedium の copyWith() を呼び出すと、定義した変更が反映されたテキスト スタイルのコピーが返されます。この場合は、テキストの色のみを変更しています。
    /// copyWithの()内にカーソルを合わせてCtrl+Shift+Space（Win / Linux）か Cmd+Shift+Space（Mac) で変更可能なプロパティを確認できる。
    final style = theme.textTheme.displayMedium!.copyWith(
      /// theme.colorScheme.primary 以外にも、.secondary や .surface など無数にあります。これらの色のすべてに onPrimary と同等のものがあります。
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      /// カードの色をテーマの colorScheme プロパティと同じになるよう定義しています。カラーパターンには多数の色が含まれていますが、primary がこのアプリの最も目立つ特徴的な色です。
      /// Card ウィジェットにも、他に変更できるパラメータがあります。たとえば、elevation パラメータの値を増やせば、カードの影を大きくできます。
      color: theme.colorScheme.primary,    // ← And also this.
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        // ↓ Change this line.
        /// buildで定義したstyleを追加して文字のサイズ、色を変化させている。
        child: Text(pair.asLowerCase, style: style),
      ),
    );
  }
}