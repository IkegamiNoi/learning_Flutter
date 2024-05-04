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

  // ↓ Add the code below.
  /// MyAppState に favorites という新規のプロパティを追加しました。このプロパティは空のリスト [] で初期化されています。
  var favorites = <WordPair>[];

  /// お気に入りのリストから現在の単語ペアを取り除くか（すでにそこにある場合）、追加します（まだそこにない場合）。どちらの場合も、その後でこのコードから notifyListeners(); が呼び出されます。
  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

/// リファクタによってウィジェット内にステートメントを持てるようにした。
/// 元々のMyHomePageクラスは_MyHomePageStateとなり、直接のアクセスが禁止になった。
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  /// 新しい変数 selectedIndex を導入し、0 に初期化しました。
  var selectedIndex = 0;     // ← Add this property.

  @override
  Widget build(BuildContext context) {
    /// Scaffold 以外のすべては GeneratorPage へ抽出された。
    return Scaffold(
      body: Row(
        children: [
          /// SafeArea は、その子がハードウェア ノッチやステータスバーで隠れないようにするものです。このアプリでは、このウィジェットが NavigationRail を包んで、ナビゲーション ボタンがモバイル ステータスバーなどで隠されるのを防いでいます。
          SafeArea(
            child: NavigationRail(
              /// NavigationRail の extended: false の行は true に変更できます。そうすることで、アイコンの隣にlabelで設定した文字列が表示されます。
              extended: false,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite),
                  label: Text('Favorites'),
                ),
              ],
              /// ナビゲーションレールの選択されている場所を示す機能。「0」ならHomeのアイコンを「1」ならFavoritesのアイコンが選択表示になる。
              /// NavigationRail の定義で、先程まであったハードコードの 0 の代わりに、この新しい変数を使用します。
              selectedIndex: selectedIndex,    // ← Change to this.
              /// ナビゲーションレールのアイコンを選択したときの動作を記述する。現在は選択されたIndexをPrintするだけ
              onDestinationSelected: (value) {

                // ↓ Replace print with this.
                /// onDestinationSelected コールバックが呼び出されたときに、setState() の呼び出しの中で selectedIndex に代入します。この呼び出しは、前に使用した notifyListeners() メソッドに似ていますが、こちらは UI を更新するためのものです。
                setState(() {
                  selectedIndex = value;
                });

              },
            ),
          ),
          /// Expanded は余白を埋める機能がある。ナビゲーションレールより右を余白として埋めている。
          /// ちなみにSafeAreaをExpandedに変更すると横方向の余白を2つで分け合うことになる。
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: GeneratorPage(),
            ),
          ),
        ],
      ),
    );
  }
}

/// MyHomePage に在った機能を持ってきている
/// 
class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
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
      /// theme.colorScheme.primary 以外にも、.secondary(色褪せ？) や .surface(グレーアウト？) など無数にあります。これらの色のすべてに onPrimary と同等のものがあります。
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
        
        // ↓ Make the following change.
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}