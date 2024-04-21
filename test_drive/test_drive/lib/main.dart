import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // このウィジェットはアプリケーションのルートです。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        // これがアプリケーションのテーマです。
        //
        // TRY THIS: Try running your application with "flutter run". 
        // これを試してください: 「flutter run」を使用してアプリケーションを実行してみてください。
        // You'll see the application has a purple toolbar. 
        // アプリケーションに紫色のツールバーがあることがわかります。
        // Then, without quitting the app, try changing the seedColor in the colorScheme below 
        // to Colors.green and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used the command line to start the app).
        // 次に、アプリを終了せずに、以下の colorScheme の seedColor を Colors.green に変更してから、
        //「ホット リロード」を呼び出してください (変更を保存するか、Flutter 対応 IDE で「ホット リロード」ボタンを押すか、
        //「コマンドラインを使用してアプリを起動した場合r」を押します) )。
        // Notice that the counter didn't reset back to zero; the application state is not lost during the reload. 
        // To reset the state, use hot restart instead.
        // カウンタがゼロにリセットされていないことに注意してください。 アプリケーションの状態はリロード中に失われません。
        // This works for code too, not just values: Most code changes can be tested with just a hot reload.
        // これは値だけでなくコードにも機能します。ほとんどのコード変更はホット リロードだけでテストできます。
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. 
  // このウィジェットはアプリケーションのホームページです。
  // It is stateful, meaning that it has a State object (defined below) 
  // that contains fields that affect how it looks.
  // これはステートフルです。つまり、見た目に影響を与えるフィールドを含む 
  // State オブジェクト (以下で定義) があることを意味します。

  // This class is the configuration for the state. 
  // このクラスは状態の構成です。
  // It holds the values (in this case the title) provided by the parent 
  // (in this case the App widget) and used by the build method of the State. 
  // 親 (この場合はアプリ ウィジェット) によって提供され、状態のビルド メソッドによって
  // 使用される値 (この場合はタイトル) が保持されます。
  // Fields in a Widget subclass are always marked "final".
  // ウィジェット サブクラス内のフィールドは常に「final」とマークされます。

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. 
      // setState への呼び出しは、この State で何かが変更されたことを Flutter フレームワークに伝えます。
      // これにより、表示に更新された値を反映できるように、以下のビルド メソッドが再実行されます。
      // If we changed _counter without calling setState(), then the build method 
      // would not be called again, and so nothing would appear to happen.
      // setState() を呼び出さずに _counter を変更した場合、build メソッドは再度呼び出されないため、何も起こらないように見えます。
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    // このメソッドは、たとえば上記の _incrementCounter メソッドによって実行されるように、
    // setState が呼び出されるたびに再実行されます。
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    // Flutter フレームワークは、ビルド メソッドの再実行を高速化するように最適化されているため、
    // ウィジェットのインスタンスを個別に変更することなく、更新が必要なものを再ビルドするだけで済みます。
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        // 試してみましょう: ここの色を特定の色 (Colors.amber など) に変更し、
        // ホット リロードをトリガーして、他の色が変わらないまま AppBar の色が変わることを確認してください。
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        // ここでは、App.build メソッドによって作成された MyHomePage オブジェクトから値を取得し、
        // それを使用してアプリバーのタイトルを設定します。
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. 
        // 中央はレイアウトウィジェットです。
        // It takes a single child and positions it in the middle of the parent.
        // 子を 1 つ取り、それを親の中央に配置します。
        child: Column(
          // Column is also a layout widget.
          // 列もレイアウト ウィジェットです。
          // It takes a list of children and arranges them vertically.
          // 子のリストを取得し、それらを垂直方向に配置します。 
          // By default, it sizes itself to fit its children horizontally,
          // and tries to be as tall as its parent.
          // デフォルトでは、子が水平に収まるようにサイズを調整し、親と同じ高さにしようとします。
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children.
          // 列には、列自体のサイズや子の配置方法を制御するさまざまなプロパティがあります。
          // Here we use mainAxisAlignment to center the children vertically; 
          // the main axis here is the vertical axis because Columns are vertical
          // (the cross axis would be horizontal).
          // ここでは mainAxisAlignment を使用して子を垂直方向の中央に配置します。 
          // 列が垂直であるため、ここでの主軸は垂直軸です (交差軸は水平になります)。
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          // 試してみましょう: 「デバッグ ペイント」を呼び出して (IDE で「デバッグ ペイントの切り替え」
          // アクションを選択するか、コンソールで「p」を押します)、各ウィジェットのワイヤーフレームを確認します。
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              //'You have pushed the button this many times:',
              'You have clicked the button this many times:' ,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
         // この末尾のカンマにより、ビルド メソッドの自動フォーマットがより適切になります。
    );
  }
}
