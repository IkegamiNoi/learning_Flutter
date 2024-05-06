import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folder_manager/notifier.dart';

/// notifierの以下3つの使い分け
/// ・watch   見続ける
/// ・listen  耳を澄まし続ける
/// ・read    読み取る
/// `watch`と`listen`は`~続ける`となっている。
/// これは関数スコープの外まで影響を残すという意味。
/// `read`はこれを使ったときしか変更を確認できない。
/// 
/// `watch`と`listen`は`ref`のある`build`のスコープ範囲内で使用する。
/// なお`build`のスコープ範囲内でも別のスコープで括られている範囲で使用することはできない。
/// 例としてはonPressed: () {}内では使えない。
/// この中では`read`を使用する。
/// 
/// `watch`と`listen`の使い分け
/// `watch`は変更があったらその表示場所を変更する。
/// `listen`は変更があったら命令を実行できる。

class MyWidget extends ConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// buildの中で状態の変化を`watch`で監視
    final s1 = ref.watch(s1NotifierProvider);
    
    /// buildの中で状態の変化を`listen`で監視して変化があれば、命令を出す。
    ref.listen(
      s1NotifierProvider, 
      (previous, next) { 
        // スナックバーを表示する
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$previous から $next へ変化しました'),
          ),
        );
      },
    );

    final button = ElevatedButton(
      onPressed: () {
        /// 画面を触ったら(ここではボタン)Notifierを`read`で読み込み
        final notifier = ref.read(s1NotifierProvider.notifier);
        notifier.updateState();
      },
       child: const Text('ボタン'),
    );
    
    // 縦に並べる
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('$s1'),
        button,
      ],
    );
  }
}