# 自作ファイルのimport方法
`pubspec.yaml`の`name:`で設定した名前が`lib`と置き換わり参照となる。
例えば`name: my_app`と設定したとき`ui`フォルダの`homePage.dart`ファイルは以下のようにimportする。
``` dart
import 'package:my_app/ui/homePage.dart';
```