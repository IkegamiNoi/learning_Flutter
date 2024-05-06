import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'notifier.g.dart'; /// 自動生成する名称として自動生成元のファイル名と拡張子の間に「.g」と入れたものをここに記述する

@riverpod
class S1Notifier extends _$S1Notifier {
  @override
  int build() {
    // 最初のデータ
    return 0;
  }

  // データを変更する関数
  void updateState() {
    // 変更前のデータ
    final oldState = state;
    // 変更後のデータ
    final newState = oldState + 1;
    // データを上書き
    state = newState;
  }
}

/// riverpod_generaterの使用コマンド
/// flutter pub run build_runner build --delete-conflicting-outputs