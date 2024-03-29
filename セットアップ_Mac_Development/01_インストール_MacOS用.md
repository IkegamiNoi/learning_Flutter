## アップルシリコンの場合、以下をターミナルで流す。[^1]
```
sudo softwareupdate --install-rosetta --agree-to-license
```
[^1]:インテルの場合は上記の手順を飛ばす。

## `Flutter SDK`を以下のページから入手する。[^2]
[^2]:このテキストは以下のページを参考にしている。
    https://docs.flutter.dev/get-started/install/macos

## 入手した`Flutter SDK`を任意のファイルに配置する。
以下に例を示す。
```
cd ~/development
unzip ~/Downloads/flutter_macos_arm64_3.7.6-stable.zip
```
上記はHOMEディレクトリへ移動し、ダウンロードディレクトリから移動先に解凍した`Flutter SDK`を配置している。

## flutterツールをPATHに追加する。以下をターミナルで流す。
```
export PATH="$PATH:`pwd`/flutter/bin"
```
上記は流したターミナルのみで有効になるのが本来の意図した動作だが、私の場合PATHの永続化が同時にされていた。

## `flutter doctor`を実行する。以下をターミナルに流す。
```
flutter doctor
```
上記を実行すると`Flutter SDK`を使用するのに必要な依存ソフトウェアがインストールされているか確認できる。
ないと表示された場合はメッセージの案内に沿って不足している依存関係をインストールする。
インストールが終わったらもう一度上記をターミナルに流し、依存関係を満たしていることを確認する。
依存関係を満たしている場合以下のメッセージが最後に出る。
```
No issues found!
```

## PATHを更新する
これは推奨であり、必須ではない。
これを行わない場合以下を新規ターミナルを開くたびに流す必要がある。
```
export PATH="$PATH:`pwd`/flutter/bin"
```
パスの永続化方法はPCの種類、バージョン、OSごとに異なる。
「16インチMacBook Pro 2021モデル」の場合、以下をターミナルに流して、PATHの保存先を開いた。
```
sudo vi $HOME/.zshrc
```
開いた先に以下を書き込む
```
export PATH="$PATH:[PATH_OF_FLUTTER_GIT_DIRECTORY]/bin"
```
このとき、[PATH_OF_FLUTTER_GIT_DIRECTORY]は`Flutter SDK`を配置したディレクトリまでのPATH。
私の場合は以下になる。[^3]
[^3]:`Flutter SDK`の解凍先そのもの。
```
development//flutter
```
よって書き込んだのは以下になる。
```
export PATH="$PATH:/Users/name/development/flutter/bin"
```
書き込んだファイルを保存して閉じたら以下をターミナルに流すか、新規のターミナルを開く。
```
source $HOME/.<rc file> 
```
私の場合は以下だった。
```
source $HOME/.zshrc
```
次に以下をターミナルに流し、`flutter/bin`がPATHにあるか確認する。
```
echo $PATH
```
次に以下をターミナルに流し、`flutter`コマンドが使用可能であることを確認する。
```
which flutter
```

2023/3/15